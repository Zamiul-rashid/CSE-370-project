from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),
    path('', views.home, name='home'),
    path('formation-comparison/', views.formation_comparison, name='formation_comparison'),
    path('tactical-timeline/', views.tactical_timeline, name='tactical_timeline'),
    path('formation-builder/', views.formation_builder, name='formation_builder'),
    path('manager-profiling/', views.manager_profiling, name='manager_profiling'),
    path('tactical-suggestion/', views.tactical_suggestion, name='tactical_suggestion'),
    path('opponent-adaptation/', views.opponent_adaptation, name='opponent_adaptation'),
    path('player-role-evolution/', views.player_role_evolution, name='player_role_evolution'),
    path('heatmap/', views.heatmap, name='heatmap'),
    path('tactical-efficiency/', views.tactical_efficiency, name='tactical_efficiency'),
]

