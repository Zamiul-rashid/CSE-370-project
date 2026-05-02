from django.shortcuts import get_object_or_404, render
from django.contrib.auth.decorators import login_required

from .models import Club, Formation, LineupEntry, Manager, Match, MatchEvent, Player, Season, Tactic


BIG_6_CLUBS = (
    'Manchester City',
    'Manchester United',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham',
)

PEP_YEARS = [2008, 2011, 2013, 2016, 2019, 2022]
KLOPP_YEARS = [2010, 2013, 2015, 2018, 2019, 2022]


@login_required
def home(request):
    # SQL EQUIVALENTS:
    # 1. SELECT * FROM club ORDER BY name ASC;
    # 2. SELECT * FROM formation ORDER BY name ASC;
    # 3. SELECT manager.*, person.* FROM manager INNER JOIN person ON manager.person_id = person.person_id ORDER BY person.first_name ASC, person.last_name ASC;
    # 4. SELECT COUNT(*) FROM match;
    context = {
        'clubs': Club.objects.order_by('name'),
        'formations': Formation.objects.order_by('name'),
        'managers': Manager.objects.select_related('person').order_by('person__first_name', 'person__last_name'),
        'total_matches': Match.objects.count(),
    }
    return render(request, 'home.html', context)


@login_required
def formation_comparison(request):
    clubs = Club.objects.all()
    seasons = Season.objects.all().order_by('year')
    formations = Formation.objects.all()
    comparison = None

    if request.method == 'POST':
        club_id = request.POST.get('club_id')
        season1 = request.POST.get('season1')
        season2 = request.POST.get('season2')

        matches_s1 = Match.objects.filter(
            home_club_id=club_id,
            year=season1
        ).select_related('formation', 'tactic', 'home_club', 'away_club')
        
        matches_s2 = Match.objects.filter(
            home_club_id=club_id,
            year=season2
        ).select_related('formation', 'tactic', 'home_club', 'away_club')

        comparison = {
            'club': Club.objects.get(club_id=club_id),
            'season1': int(season1),
            'season2': int(season2),
            'matches_s1': list(matches_s1),
            'matches_s2': list(matches_s2),
        }

    return render(request, 'formation_comparison.html', {
        'clubs': clubs,
        'seasons': seasons,
        'formations': formations,
        'comparison': comparison,
    })


@login_required
def tactical_timeline(request):
    # SQL EQUIVALENT: SELECT * FROM club ORDER BY name ASC;
    clubs = Club.objects.order_by('name')
    timeline = None

    if request.method == 'POST':
        # SQL EQUIVALENT: SELECT * FROM club WHERE club_id = <post_data_id> LIMIT 1;
        club = get_object_or_404(Club, pk=request.POST.get('club_id'))
        
        # SQL EQUIVALENT: 
        # SELECT match.*, formation.*, tactic.*, season.* FROM match
        # INNER JOIN formation ON ... INNER JOIN season ON ...
        # WHERE match.home_club_id = <club_id>
        # ORDER BY season.year ASC, match.date ASC, match.match_id ASC;
        matches = Match.objects.filter(home_club=club).select_related('formation', 'tactic', 'home_club', 'away_club', 'year').order_by('year__year', 'date', 'match_id')
        timeline = {
            'club': club,
            'matches': list(matches),
        }

    return render(request, 'tactical_timeline.html', {
        'clubs': clubs,
        'timeline': timeline,
    })


@login_required
def formation_builder(request):
    return render(request, 'formation_builder.html', {
        'formations': Formation.objects.order_by('name'),
    })


@login_required
def manager_profiling(request):
    return render(request, 'manager_profiling.html', {
        'managers': Manager.objects.select_related('person').order_by('person__first_name', 'person__last_name'),
        'pep_years': PEP_YEARS,
        'klopp_years': KLOPP_YEARS,
    })


@login_required
def tactical_suggestion(request):
    formations = Formation.objects.order_by('name')
    tactics = Tactic.objects.order_by('name')
    suggestion = None
    tactic = None

    if request.method == 'POST':
        goal = request.POST.get('goal')
        style = request.POST.get('style')

        if goal == 'attack' and style == 'possession':
            suggestion = get_object_or_404(Formation, name='4-3-3')
            tactic = get_object_or_404(Tactic, name='Tiki-Taka')
        elif goal == 'attack' and style == 'pressing':
            suggestion = get_object_or_404(Formation, name='4-3-3')
            tactic = get_object_or_404(Tactic, name='High Press')
        elif goal == 'defend' and style == 'counter':
            suggestion = get_object_or_404(Formation, name='5-3-2')
            tactic = get_object_or_404(Tactic, name='Counter Attack')
        else:
            suggestion = formations.first()
            tactic = tactics.first()

    return render(request, 'tactical_suggestion.html', {
        'formations': formations,
        'tactics': tactics,
        'suggestion': suggestion,
        'tactic': tactic,
    })


@login_required
def opponent_adaptation(request):
    clubs = Club.objects.order_by('name')
    analysis = None

    if request.method == 'POST':
        club = get_object_or_404(Club, pk=request.POST.get('club_id'))
        all_matches = Match.objects.filter(home_club=club).select_related('away_club', 'formation', 'tactic').order_by('date', 'match_id')
        big6_matches = list(all_matches.filter(away_club__name__in=BIG_6_CLUBS))
        other_matches = list(all_matches.exclude(away_club__name__in=BIG_6_CLUBS))

        analysis = {
            'club': club,
            'big6_matches': big6_matches,
            'other_matches': other_matches,
        }

    return render(request, 'opponent_adaptation.html', {
        'clubs': clubs,
        'analysis': analysis,
    })


@login_required
def player_role_evolution(request):
    roles = [
        'False 9',
        'Inverted Fullback',
        'Sweeper Keeper',
        'Deep Lying Playmaker',
        'Box to Box Midfielder',
    ]
    players = Player.objects.select_related('person').order_by('person__first_name', 'person__last_name')
    lineup_data = None

    if request.method == 'POST':
        role = request.POST.get('role')
        lineup_data = LineupEntry.objects.filter(position__icontains=role).select_related('person', 'match').order_by('match__date', 'match_id', 'person__last_name')

    return render(request, 'player_role_evolution.html', {
        'roles': roles,
        'players': players,
        'lineup_data': lineup_data,
    })


@login_required
def heatmap(request):
    clubs = Club.objects.order_by('name')
    heatmap_data = None

    if request.method == 'POST':
        club = get_object_or_404(Club, pk=request.POST.get('club_id'))
        events = MatchEvent.objects.filter(match__home_club=club, x__isnull=False, y__isnull=False).order_by('match__date', 'match_id', 'event_seq').values('x', 'y', 'type', 'minute')

        heatmap_data = {
            'club': club,
            'events': list(events),
        }

    return render(request, 'heatmap.html', {
        'clubs': clubs,
        'heatmap_data': heatmap_data,
    })


@login_required
def tactical_efficiency(request):
    formations = Formation.objects.order_by('name')
    efficiency_data = []

    for formation in formations:
        total = Match.objects.filter(formation=formation).count()
        goals = MatchEvent.objects.filter(match__formation=formation, type='Goal').count()

        efficiency_data.append({
            'formation': formation,
            'total_matches': total,
            'total_goals': goals,
            'goals_per_match': round(goals / total, 2) if total else 0,
            'efficiency_score': round((goals / total) * 10, 1) if total else 0,
        })

    return render(request, 'tactical_efficiency.html', {
        'efficiency_data': efficiency_data,
    })

