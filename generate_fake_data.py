import os
import django
import random
from datetime import date, timedelta
from decimal import Decimal

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "football_analyzer.settings")
django.setup()

from core.models import *

def run():
    print("Starting data population...")
    
    # 1. Create Seasons
    print("Generating Seasons...")
    seasons = [Season.objects.get_or_create(year=y)[0] for y in range(2008, 2024)]

    # 2. Formations
    print("Generating Formations...")
    formation_names = ['4-3-3', '4-4-2', '4-2-3-1', '5-3-2', '3-5-2', '4-1-4-1', '3-4-3', '4-5-1']
    formations = [Formation.objects.get_or_create(name=f, defaults={'description': f'A standard {f} formation'})[0] for f in formation_names]

    # 3. Tactics
    print("Generating Tactics...")
    tactic_names = ['Tiki-Taka', 'High Press', 'Counter Attack', 'Park the Bus', 'Gegenpressing', 'Catenaccio']
    tactics = [Tactic.objects.get_or_create(name=t)[0] for t in tactic_names]

    # 4. Stadiums
    print("Generating Stadiums...")
    stadium_names = ['Old Trafford', 'Emirates Stadium', 'Anfield', 'Etihad Stadium', 'Stamford Bridge', 'Tottenham Hotspur Stadium', 'St James Park', 'Villa Park']
    stadiums = [Stadium.objects.get_or_create(name=n, defaults={'capacity': random.randint(40000, 75000)})[0] for n in stadium_names]

    # 5. Clubs
    print("Generating Clubs (including Big 6)...")
    club_names = ['Manchester United', 'Arsenal', 'Liverpool', 'Manchester City', 'Chelsea', 'Tottenham', 'Newcastle', 'Aston Villa', 'Everton', 'West Ham']
    clubs = []
    for i, c in enumerate(club_names):
        clubs.append(Club.objects.get_or_create(name=c, defaults={'stadium': stadiums[i % len(stadiums)]})[0])

    # 6. Competition & Managers
    print("Generating Competitions & Managers...")
    comp = Competition.objects.get_or_create(name='Premier League', defaults={'type_flag': 'League'})[0]
    
    manager_names = [('Pep', 'Guardiola'), ('Jurgen', 'Klopp'), ('Mikel', 'Arteta'), ('Erik', 'ten Hag'), ('Jose', 'Mourinho'), ('Arsene', 'Wenger'), ('Sir Alex', 'Ferguson')]
    for fname, lname in manager_names:
        p = Person.objects.get_or_create(first_name=fname, last_name=lname)[0]
        Manager.objects.get_or_create(person=p, defaults={'philosophy': 'Attacking Football'})

    # 7. Persons & Players
    print("Generating Players...")
    roles_to_seed = ['False 9', 'Inverted Fullback', 'Sweeper Keeper', 'Deep Lying Playmaker', 'Box to Box Midfielder', 'Target Man', 'Winger']
    players = []
    for i in range(150):
        p = Person.objects.get_or_create(first_name=f'Player{i}', last_name=f'Smith{i}')[0]
        player = Player.objects.get_or_create(person=p, defaults={
            'market_value': Decimal(random.randint(10, 100)), 
            'stamina_rating': random.randint(50, 99),
            'GK_flag': i % 11 == 0,
            'outfield_flag': i % 11 != 0,
            'save_ratio': Decimal(random.uniform(0.5, 0.9)) if (i % 11 == 0) else None
        })[0]
        players.append(player)

    # 8. Matches & Events & Lineups
    print("Generating Matches, Events, and Lineups...")
    matches_created = 0
    
    # Let's create about 200 random matches
    for _ in range(200):
        s = random.choice(seasons)
        c1, c2 = random.sample(clubs, 2)
        f = random.choice(formations)
        t = random.choice(tactics)
        
        # Pick a random date within the season
        d = date(s.year, random.randint(1, 12), random.randint(1, 28))
        
        m = Match.objects.create(
            date=d,
            home_club=c1,
            away_club=c2,
            comp=comp,
            year=s,
            formation=f,
            tactic=t
        )
        matches_created += 1

        # Match Events (Goals, passes, heatmap coords)
        for seq in range(1, random.randint(4, 12)):
            event_type = random.choice(['Goal', 'Shot', 'Pass', 'Tackle', 'Yellow Card'])
            MatchEvent.objects.create(
                match=m,
                event_seq=seq,
                person=random.choice(players).person,
                type=event_type,
                minute=random.randint(1, 90),
                x=Decimal(random.uniform(0, 100)),
                y=Decimal(random.uniform(0, 100))
            )

        # Lineup Entries (to populate player role evolution)
        selected_players = random.sample(players, 14) # 11 starters + 3 subs
        for p in selected_players:
            role = random.choice(roles_to_seed + ['CM', 'CB', 'LB', 'RB', 'ST', 'GK'])
            LineupEntry.objects.get_or_create(
                match=m,
                person=p.person,
                defaults={'position': role}
            )
            
    print(f"✅ Successfully generated {matches_created} match records along with events, lineups, players, clubs, formations, and tactics!")

if __name__ == '__main__':
    run()