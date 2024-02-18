import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investhub/presentation/pages/entry_type_selection_page.dart';
import 'package:investhub/presentation/pages/community_application_form_page.dart';
import 'package:investhub/presentation/pages/community_details_page.dart';
import 'package:investhub/presentation/pages/community_projects_feed_page.dart';
import 'package:investhub/presentation/pages/investor_profile_page.dart';
import 'package:investhub/presentation/pages/project_application_form_page.dart';
import 'package:investhub/presentation/pages/project_details_page.dart';
import 'package:investhub/presentation/pages/individual_projects_feed_page.dart';
import 'package:investhub/presentation/pages/login_page.dart';
import 'package:investhub/presentation/pages/register_page.dart';
import 'package:investhub/presentation/pages/start_page.dart';
import 'package:investhub/route/route_location.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocations.start,
    parentNavigatorKey: navigationKey,
    builder: StartPage.builder,
  ),
  GoRoute(
    path: RouteLocations.entryTypeSelection,
    parentNavigatorKey: navigationKey,
    builder: EntryTypeSelectionPage.builder,
  ),
  GoRoute(
    path: RouteLocations.register,
    parentNavigatorKey: navigationKey,
    builder: RegisterPage.builder,
  ),
  GoRoute(
    path: RouteLocations.login,
    parentNavigatorKey: navigationKey,
    builder: LoginPage.builder,
  ),
  GoRoute(
    path: RouteLocations.communityProjectsFeed,
    parentNavigatorKey: navigationKey,
    builder: CommunityProjectsFeedPage.builder,
  ),
  GoRoute(
    path: RouteLocations.individualProjectsFeed,
    parentNavigatorKey: navigationKey,
    builder: IndividualProjectsFeedPage.builder,
  ),
  GoRoute(
    path: RouteLocations.projectDetails,
    parentNavigatorKey: navigationKey,
    builder: ProjectDetailsPage.builder,
  ),
  GoRoute(
    path: RouteLocations.communityDetails,
    parentNavigatorKey: navigationKey,
    builder: CommunityDetailsPage.builder,
  ),
  GoRoute(
    path: RouteLocations.investorProfile,
    parentNavigatorKey: navigationKey,
    builder: InvestorProfilePage.builder,
  ),
  GoRoute(
    path: RouteLocations.communityApplicationForm,
    parentNavigatorKey: navigationKey,
    builder: CommunityApplicationFormPage.builder,
  ),
  GoRoute(
    path: RouteLocations.projectApplicationForm,
    parentNavigatorKey: navigationKey,
    builder: ProjectApplicationFormPage.builder,
  ),
];
