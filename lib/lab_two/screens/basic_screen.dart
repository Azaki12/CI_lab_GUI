import 'package:flutter/material.dart';
import 'package:flutter_flurry_drawer/flutter_flurry_drawer.dart';
import 'package:gui_ci_embedded/lab_two/bottom_nav_bar/custom_bottom_navigation_bar.dart';

import '../lab_two_gui.dart';

final Screen Lab2BasicScreen = Screen(contentBuilder: (BuildContext context) {
  return Scaffold(
    body: LabTwoGui(),
    bottomNavigationBar: CustomBottomNavigationBar(),
  );
});
