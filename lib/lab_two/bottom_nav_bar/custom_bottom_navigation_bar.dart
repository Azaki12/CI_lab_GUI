import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/clipper/wave_clipper.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

import 'custom_nav_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SizedBox(
          height: 110,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.pink[800],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 45,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomNavItem(
                        provider: cubit,
                        id: 0,
                        icon: Icons.plus_one,
                      ),
                      Container(),
                      CustomNavItem(
                        provider: cubit,
                        id: 1,
                        icon: Icons.exposure_plus_2,
                      ),
                      Container(),
                      CustomNavItem(
                        provider: cubit,
                        id: 2,
                        icon: Icons.refresh,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'Basic',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(),
                      const Text(
                        'Bonus',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(),
                      const Text(
                        'Refresh',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
