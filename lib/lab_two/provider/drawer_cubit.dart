import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/lab_five/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_four/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_six/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_three/screens/basic_screen.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';
import 'package:gui_ci_embedded/lab_two/screens/basic_screen.dart';

class DrawerCubit extends Cubit<AppStates> {
  DrawerCubit() : super(Appinit());

  DrawerCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Map<String, Object>> drawerPages = [];
  List<String> titles = [
    'Lab 2 Basic',
    'Lab 3 Basic',
    'Lab 4 Basic',
    'Lab 5 Basic',
    'Lab 6 Basic',
  ];
  var activeScreen = Lab2BasicScreen;

  /*------------------------------------  Methods of provider  ------------------------------------*/

  /// Method to change the Drawer screen
  changeDrawerScreen(screen) {
    activeScreen = screen;
    emit(AppchangeDrawer());
  }

  /// Method to initialize the menus of the Drawer (called in main)
  pageInit() {
    drawerPages = [
      {
        'page': Lab2BasicScreen,
      },
      {
        'page': Lab3BasicScreen,
      },
      {
        'page': Lab4BasicScreen,
      },
      {
        'page': Lab5BasicScreen,
      },
      {
        'page': Lab6BasicScreen,
      },
    ];
  }

  /// Method to change the title of the scaffold
  changeTitle() {
    print(drawerPages[currentIndex]['page']);
    return titles[currentIndex];
  }
}
