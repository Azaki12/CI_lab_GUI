import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flurry_drawer/flurry_menu.dart';
import 'package:flutter_flurry_drawer/flutter_flurry_drawer.dart';
import 'package:gui_ci_embedded/lab_five/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_four/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_six/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_three/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_two/provider/drawer_cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';
import 'package:gui_ci_embedded/lab_two/screens/basic_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var activeScreen = Lab2BasicScreen;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return FlurryDrawer(
          alignment: Alignment.center,
          iconSize: 20,
          menuScreen: MenuScreen(
            onMenuItemSelected: (String itemId) {
              print(itemId);
              if (itemId == 'hom') {
                setState(() => activeScreen = Lab2BasicScreen);
              } else if (itemId == 'sta') {
                setState(() => activeScreen = Lab3BasicScreen);
              } else if (itemId == 'doc') {
                setState(() => activeScreen = Lab4BasicScreen);
              } else if (itemId == 'loc') {
                setState(() => activeScreen = Lab5BasicScreen);
              } else if (itemId == 'set') {
                setState(() => activeScreen = Lab6BasicScreen);
              }
            },
            menu: Menu(
              items: [
                //You can add as many items as you want, it's scrollable!!
                MenuItem(
                  id: 'hom', //You can set this to whatever you want but dont duplicate it
                  icon:
                      'assets/2.png', //Set this to the data for the icon of the button
                  isSelected: true,
                  selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                  // btnShape: BoxShape.rectangle
                ),
                MenuItem(
                  id: 'sta',
                  icon: 'assets/3.png',
                  isSelected: false,
                  selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                  //btnShape: BoxShape.rectangle
                ),
                MenuItem(
                  id: 'doc',
                  icon: 'assets/4.png',
                  isSelected: false,
                  selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                ),
                MenuItem(
                  id: 'loc',
                  icon: 'assets/5.png',
                  isSelected: false,
                  selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                ),
                MenuItem(
                  id: 'set',
                  icon: 'assets/6.png',
                  isSelected: false,
                  selectedBtnColor: Color.fromRGBO(38, 198, 218, 1),
                ),
              ],
            ),
            bgColor: Colors.blue,
          ),
          contentScreen: activeScreen,
          expandIcon: Icon(Icons.view_list),
        );
      },
    );
  }
}
