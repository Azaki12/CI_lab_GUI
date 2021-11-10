import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';
import 'package:gui_ci_embedded/lab_two/screens/basic.dart';
import 'package:gui_ci_embedded/lab_two/screens/bonus_screen.dart';

class LabTwoGui extends StatefulWidget {
  @override
  _LabTwoGuiState createState() => _LabTwoGuiState();
}

class _LabTwoGuiState extends State<LabTwoGui> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.currentIndex == 0 ? BasicScreen() : BonusScreen();
      },
      listener: (context, state) {},
    );
  }
}
