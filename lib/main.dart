import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/app/app.locator.dart';
import 'package:health/app/app.router.dart';
import 'package:health/ui/bottom_sheet/setup_bottom_sheet_ui.dart';
import 'package:health/ui/dialog/setup_dialog_ui.dart';
import 'package:health/ui/shared/app_colors.dart';
import 'package:health/ui/shared/shared_styles.dart';
import 'package:health/ui/snack_bar/setup_snack_bar.dart';

import 'package:health/ui/views/login/login_view.dart';

import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await ThemeManager.initialise();

  await Firebase.initializeApp();
  await setupLocator();
  setupSnackbarUi();
  setupBottomSheetUi();
  setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ksStatusBarStyle();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kcAppBackgroundColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: kcDarkGreyColor,
          ),
        ),
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: kcAppBackgroundColor,
            systemNavigationBarDividerColor: kcWhite,
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: LoginView(),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
