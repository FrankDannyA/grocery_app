import 'package:flutter/material.dart';
import 'package:grocery_app/consts/theme_data.dart';
import 'package:grocery_app/inner_screen/feeds_screen.dart';
import 'package:grocery_app/inner_screen/on_sale_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = true;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: BottomBar(),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            FeedsScreen.routeName: (context) => const FeedsScreen(),
          },
        );
      }),
    );
  }
}
