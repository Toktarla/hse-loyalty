import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/pages/create/create_form_page.dart';
import 'package:hsg_loyalty/presentation/pages/create/create_page.dart';
import 'package:hsg_loyalty/presentation/pages/home_page.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/call_screen/call_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/documents_screens/documents_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/incident_review_screen/incident_review_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/incident_review_screen/pdf_view_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/media_screen/media_option_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/media_screen/media_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/observer_screens/add_pnb_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/observer_screens/pnb_driving_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/observer_screens/pnb_report_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/observer_screens/pnb_work_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/questionnaire_screen/questionnaire_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/survey_screen/pass_survey_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/survey_screen/survey_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/visit_report_screen/add_report_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/visit_report_screen/visit_report_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/visual_aids_screen/visual_aids_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/main_page.dart';
import 'package:hsg_loyalty/presentation/pages/my_forms/my_forms_page.dart';
import 'package:hsg_loyalty/presentation/pages/notification/notifications_page.dart';
import 'package:hsg_loyalty/presentation/pages/profile/auth_or_profile_page.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/documents_screens/documents_show_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/observer_screens/observer_screen.dart';
import 'package:hsg_loyalty/presentation/pages/main/kmg_items_pages/survey_screen/fill_card_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/',
              builder: (context, state) => const MainPage(),
              routes: <RouteBase>[
                GoRoute(
                  path: "observerScreen",
                  pageBuilder:(context, state) => const NoTransitionPage(
                    child: ObserverScreen()
                  ),
                  routes: [
                    GoRoute(
                      path: "pnbDrivingScreen",
                      pageBuilder:(context, state) => const NoTransitionPage(
                          child: PnbDrivingScreen()
                      ),
                    ),
                    GoRoute(
                      path: "pnbReportScreen",
                      pageBuilder:(context, state) => const NoTransitionPage(
                          child: PnbReportScreen()
                      ),
                    ),
                    GoRoute(
                      path: "pnbWorkScreen",
                      pageBuilder:(context, state) => const NoTransitionPage(
                          child: PnbWorkScreen()
                      ),
                      routes: [
                        GoRoute(
                          path: "addPnbScreen",
                          pageBuilder:(context, state) => const NoTransitionPage(
                              child: AddPnbScreen()
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
                GoRoute(
                  path: "surveyScreen",
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: SurveyScreen(),
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: "passSurveyScreen",
                      pageBuilder:(context, state) => NoTransitionPage(
                        child: PassSurveyScreen(
                          surveyId: state.extra as String,
                        )
                      ),
                      routes: <RouteBase>[
                        GoRoute(
                          path: "fillCardScreen",
                          pageBuilder:(context, state) => NoTransitionPage(
                            child: FillCardScreen(
                              surveyId: state.extra as String,
                            )
                          ),
                        )
                      ] 
                    )
                  ]
                ),
                GoRoute(
                  path: "mediaScreen",
                  pageBuilder:(context, state) => NoTransitionPage(
                    child: MediaScreen(
                      mobileModuleId: state.extra as int,
                    )
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: "mediaOptionScreen",
                      pageBuilder:(context, state) => NoTransitionPage(
                        child: MediaOptionScreen(
                          appBarTitle: (state.extra as Map)['appBarTitle'],
                          mediaModuleId: (state.extra as Map)['mediaModuleId'],
                        )
                      ),
                    )
                  ]
                ),
                GoRoute(
                  path: "documentsScreen",
                  pageBuilder:(context, state) => NoTransitionPage(
                    child: DocumentsScreen(
                      mobileModuleId: state.extra as int,
                    )
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: "documentsShowScreen",
                      pageBuilder:(context, state) => NoTransitionPage(
                        child: DocumentsShowScreen(
                          appBarTitle: (state.extra as Map)['appBarTitle'],
                          mediaModuleId: (state.extra as Map)['mediaModuleId'],
                        )
                      ),
                      routes: <RouteBase>[
                        GoRoute(
                          path: "pdfViewScreen",
                          pageBuilder:(context, state) => NoTransitionPage(
                            child: PdfViewScreen(
                              title: (state.extra as Map)['title'], 
                              pdfPath: (state.extra as Map)['pdfPath'],
                            )
                          ),
                        )
                      ]
                    )
                  ]
                ),
                GoRoute(
                  path: "incidentReviewScreen",
                  pageBuilder:(context, state) => NoTransitionPage(
                    child: IncidentReviewScreen(
                      mobileModuleId: state.extra as int,
                    )
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: "pdfViewScreen",
                      pageBuilder:(context, state) => NoTransitionPage(
                        child: PdfViewScreen(
                          title: (state.extra as Map)['title'], 
                          pdfPath: (state.extra as Map)['pdfPath'],
                        )
                      ),
                    )
                  ]
                ),
                GoRoute(
                  path: "visualAidsScreen",
                  pageBuilder:(context, state) => NoTransitionPage(
                    child: VisualAidsScreen(
                      mobileModuleId: state.extra as int,
                    )
                  )
                ),
                GoRoute(
                  path: "callScreen",
                  pageBuilder:(context, state) => const NoTransitionPage(
                    child: CallScreen(),
                  )
                ),
                GoRoute(
                  path: "questionnaireScreen",
                  pageBuilder:(context, state) => const NoTransitionPage(
                    child: QuestionnaireScreen(),
                  ),
                ),
                GoRoute(
                  path: "visitReportScreen",
                  pageBuilder:(context, state) => const NoTransitionPage(
                    child: VisitReportScreen()
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: "pdfViewScreen",
                      pageBuilder:(context, state) => NoTransitionPage(
                        child: PdfViewScreen(
                          title: (state.extra as Map)['title'], 
                          pdfPath: (state.extra as Map)['pdfPath'],
                        )
                      ),
                    ),
                    GoRoute(
                      path: "addReportScreen",
                      pageBuilder:(context, state) => NoTransitionPage(
                          child: AddReportScreen()
                      ),
                    )
                  ]
                ),
              ]
            )
          ]
        ),
        StatefulShellBranch(
          routes: <RouteBase>[ 
            GoRoute(
              path: '/myFormsPage',
              builder: (context, state) => const MyFormsPage(),
            )
          ]
        ),
        StatefulShellBranch(
          routes: <RouteBase>[ 
            GoRoute(
              path: '/createPage',
              builder: (context, state) => const CreatePage(),
              routes: <RouteBase> [
                GoRoute(
                  path: 'createFormPage',
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: CreateFormPage()),
                ),
              ]
            )
          ]
        ),
        StatefulShellBranch(
          routes: <RouteBase>[ 
            GoRoute(
              path: '/notificationsPage',
              builder: (context, state) => const NotificationsPage(),
            )
          ]
        ),
        StatefulShellBranch(
          routes: <RouteBase>[ 
            GoRoute(
              path: '/authPage',
              builder: (context, state) => const AuthOrProfilePage(),
            )
          ]
        ),
      ]
    )
  ]
);