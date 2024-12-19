import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/menu.dart';
import 'pages/laboratory/laboratory_view.dart';
// import 'pages/shop/shop_view.dart';
import 'pages/blog/blog_view.dart';
import 'pages/quests/quests_view.dart';
import 'pages/credits.dart';
import 'pages/resuming.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case LaboratoryView.routeName:
                    try {
                      Map<String, dynamic> argomenti = routeSettings.arguments as Map<String, dynamic>;
                      return LaboratoryView(numeroPartita: argomenti["numeroPartita"] ?? "");
                    } catch (error) {
                      return const MenuView();
                    }
                  /* case ShopView.routeName:
                    try {
                      Map<String, dynamic> argomenti = routeSettings.arguments as Map<String, dynamic>;
                      return ShopView(numeroPartita: argomenti["numeroPartita"] ?? "");
                    } catch (error) {
                      return const MenuView();
                    } */
                  case QuestsView.routeName:
                    try {
                      Map<String, dynamic> argomenti = routeSettings.arguments as Map<String, dynamic>;
                      return QuestsView(numeroPartita: argomenti["numeroPartita"] ?? "");
                    } catch (error) {
                      return const MenuView();
                    }
                  case BlogView.routeName:
                    try {
                      Map<String, dynamic> argomenti = routeSettings.arguments as Map<String, dynamic>;
                      return BlogView(numeroPartita: argomenti["numeroPartita"] ?? "", blogId: argomenti["blogId"] ?? 1);
                    } catch (error) {
                      return const MenuView();
                    }
                  case ResumingView.routeName:
                    return const ResumingView();
                  case CreditsView.routeName:
                    return const CreditsView();
                  case MenuView.routeName:
                  default:
                    return const MenuView();
                }
              },
            );
          },
        );
      },
    );
  }
}
