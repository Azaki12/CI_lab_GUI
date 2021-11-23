import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/home.dart';
import 'package:gui_ci_embedded/lab_three/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/drawer_cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

import 'lab_two/provider/cubit.dart';
import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => DrawerCubit()..pageInit(),
        ),
        BlocProvider(
          create: (context) => Lab3AppCubit(),
        ),
      ],
      child: BlocConsumer<DrawerCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
