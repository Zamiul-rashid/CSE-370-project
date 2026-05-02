from django.db import models


class Season(models.Model):
    year = models.IntegerField(primary_key=True)

    def __str__(self):
        return str(self.year)


    class Meta:
        db_table = 'season'
        managed = True


class Stadium(models.Model):
    stadium_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    capacity = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return self.name


    class Meta:
        db_table = 'stadium'
        managed = True


class Club(models.Model):
    club_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    stadium = models.ForeignKey(
        Stadium, on_delete=models.SET_NULL, null=True, blank=True
    )

    def __str__(self):
        return self.name


    class Meta:
        db_table = 'club'
        managed = True


class Formation(models.Model):
    formation_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name


    class Meta:
        db_table = 'formation'
        managed = True


class Tactic(models.Model):
    tactic_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name


    class Meta:
        db_table = 'tactic'
        managed = True


class Competition(models.Model):
    comp_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    type_flag = models.CharField(max_length=50)

    def __str__(self):
        return self.name


    class Meta:
        db_table = 'competition'
        managed = True


class CompetitionEdition(models.Model):
    comp = models.ForeignKey(
        Competition, on_delete=models.CASCADE
    )
    year = models.ForeignKey(
        Season, on_delete=models.CASCADE
    )

    def __str__(self):
        return f'{self.comp} {self.year_id}'


    class Meta:
        db_table = 'competition_edition'
        managed = True
        unique_together = (('comp', 'year'),)


class Person(models.Model):
    person_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)

    def __str__(self):
        return f'{self.first_name} {self.last_name}'


    class Meta:
        db_table = 'person'
        managed = True


class Player(models.Model):
    person = models.OneToOneField(
        Person, on_delete=models.CASCADE, primary_key=True
    )
    market_value = models.DecimalField(
        max_digits=15, decimal_places=2, null=True, blank=True
    )
    save_ratio = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True
    )
    stamina_rating = models.IntegerField(null=True, blank=True)
    GK_flag = models.BooleanField(default=False)
    outfield_flag = models.BooleanField(default=True)

    def __str__(self):
        return str(self.person)


    class Meta:
        db_table = 'player'
        managed = True


class Coach(models.Model):
    person = models.OneToOneField(
        Person, on_delete=models.CASCADE, primary_key=True
    )
    license_type = models.CharField(
        max_length=50, null=True, blank=True
    )

    def __str__(self):
        return str(self.person)


    class Meta:
        db_table = 'coach'
        managed = True


class Manager(models.Model):
    person = models.OneToOneField(
        Person, on_delete=models.CASCADE, primary_key=True
    )
    philosophy = models.TextField(null=True, blank=True)

    def __str__(self):
        return str(self.person)


    class Meta:
        db_table = 'manager'
        managed = True


class PlayerSkills(models.Model):
    person = models.ForeignKey(
        Person, on_delete=models.CASCADE
    )
    skill = models.CharField(max_length=100)

    def __str__(self):
        return f'{self.person} — {self.skill}'


    class Meta:
        db_table = 'player_skills'
        managed = True
        unique_together = (('person', 'skill'),)


class Transfer(models.Model):
    transfer_id = models.AutoField(primary_key=True)
    amount = models.DecimalField(
        max_digits=15, decimal_places=2, null=True, blank=True
    )
    date = models.DateField(null=True, blank=True)
    player = models.ForeignKey(
        Player, on_delete=models.CASCADE
    )
    from_club = models.ForeignKey(
        Club, on_delete=models.SET_NULL,
        null=True, related_name='transfers_out'
    )
    to_club = models.ForeignKey(
        Club, on_delete=models.SET_NULL,
        null=True, related_name='transfers_in'
    )

    def __str__(self):
        return f'{self.player} transfer #{self.transfer_id}'


    class Meta:
        db_table = 'transfer'
        managed = True


class Match(models.Model):
    match_id = models.AutoField(primary_key=True)
    date = models.DateField(null=True, blank=True)
    home_club = models.ForeignKey(
        Club, on_delete=models.CASCADE,
        related_name='home_matches'
    )
    away_club = models.ForeignKey(
        Club, on_delete=models.CASCADE,
        related_name='away_matches'
    )
    comp = models.ForeignKey(
        Competition, on_delete=models.CASCADE
    )
    year = models.ForeignKey(
        Season, on_delete=models.CASCADE
    )
    formation = models.ForeignKey(
        Formation, on_delete=models.SET_NULL,
        null=True, blank=True
    )
    tactic = models.ForeignKey(
        Tactic, on_delete=models.SET_NULL,
        null=True, blank=True
    )

    def __str__(self):
        return f'{self.home_club} vs {self.away_club} ({self.year_id})'


    class Meta:
        db_table = 'match'
        managed = True


class MatchEvent(models.Model):
    match = models.ForeignKey(
        Match, on_delete=models.CASCADE
    )
    event_seq = models.IntegerField()
    person = models.ForeignKey(
        Person, on_delete=models.CASCADE
    )
    type = models.CharField(max_length=50, null=True, blank=True)
    minute = models.IntegerField(null=True, blank=True)
    x = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True
    )
    y = models.DecimalField(
        max_digits=5, decimal_places=2, null=True, blank=True
    )

    def __str__(self):
        return f'{self.match} event {self.event_seq}'


    class Meta:
        db_table = 'match_event'
        managed = True
        unique_together = (('match', 'event_seq'),)


class LineupEntry(models.Model):
    match = models.ForeignKey(
        Match, on_delete=models.CASCADE
    )
    person = models.ForeignKey(
        Person, on_delete=models.CASCADE
    )
    position = models.CharField(
        max_length=50, null=True, blank=True
    )

    def __str__(self):
        return f'{self.person} in {self.match}'


    class Meta:
        db_table = 'lineup_entry'
        managed = True
        unique_together = (('match', 'person'),)



