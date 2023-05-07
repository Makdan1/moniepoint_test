import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_test/core/services/database_service.dart';
import 'package:moniepoint_test/ui/screens/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:moniepoint_test/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/progressBarManager/dialog_manager.dart';
import 'package:moniepoint_test/utils/progressBarManager/dialog_service.dart';
import 'package:moniepoint_test/utils/router/navigation_service.dart';
import 'package:moniepoint_test/utils/router/router.dart';
import 'ui/screens/bottom_navigation/bottom_nav_model_view.dart';
import 'ui/screens/home/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  //Initialize the database
  await DatabaseService.initDatabase();
  setupLocator();
  return runApp(ChangeNotifierProvider<HomeViewModel>(
    create: (_) => HomeViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider()),
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MoniePoint',
        builder: (context, child) => Navigator(
          key: locator<ProgressService>().progressNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
            return ProgressManager(child: child!);
          }),
        ),
        // This get the selected saved theme
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // This initialize the navigator service
        navigatorKey: locator<NavigationService>().navigationKey,
        home: const Home(),
        onGenerateRoute: generateRoute,
    ));
  }
}
