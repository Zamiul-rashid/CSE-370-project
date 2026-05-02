from django.contrib import admin

from .models import (
	Club,
	Coach,
	Competition,
	CompetitionEdition,
	Formation,
	LineupEntry,
	Manager,
	Match,
	MatchEvent,
	Person,
	Player,
	PlayerSkills,
	Season,
	Stadium,
	Tactic,
	Transfer,
)


admin.site.register(
	[
		Club,
		Coach,
		Competition,
		CompetitionEdition,
		Formation,
		LineupEntry,
		Manager,
		Match,
		MatchEvent,
		Person,
		Player,
		PlayerSkills,
		Season,
		Stadium,
		Tactic,
		Transfer,
	]
)
