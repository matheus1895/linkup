import 'package:flutter/material.dart';
import 'package:linkup/ui/core/themes/theme.dart';

class ThemeViewModel extends ChangeNotifier {

 var theme = LinkupTheme.darkTheme;

  changeTheme() {
    if (theme == LinkupTheme.darkTheme) {
      theme = LinkupTheme.lightTheme;
    } else {
      theme = LinkupTheme.darkTheme;
    }
    notifyListeners();
  }

}