import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get themeData => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => themeData ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context).size;
}
