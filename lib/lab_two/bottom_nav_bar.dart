// import 'package:flutter/material.dart';
// import 'package:gui_ci_embedded/lab_two/provider/bottom_nav_bar_provider.dart';
// import 'package:provider/provider.dart';
//
// import 'bottom_nav_bar/custom_bottom_navigation_bar.dart';
//
// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // -------------------------------- BottomNavBar Provider ------------------------------------//
//     final pageProvider = Provider.of<Lab2BottomNavBarProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(pageProvider.changeTitle()),
//       ),
//       /*-------------------------------------------------------------------------------------*/
//       /*                    Content on the screen fetched from the provider                  */
//       /*-------------------------------------------------------------------------------------*/
//       //body: pageProvider.pages[pageProvider.currentIndex]['basic'],
//       // -------------------------------- Using the Custom BottomNavBar ------------------------------------//
//       bottomNavigationBar: CustomBottomNavigationBar(),
//     );
//   }
// }
