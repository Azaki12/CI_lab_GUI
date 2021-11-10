import 'package:flutter/material.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final AppCubit provider;

  const CustomNavItem({this.id, this.icon, this.provider});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id != 2) {
          provider.changeBottomNavigationBarIndex(id);
        } else if (id == 2) {
          provider.initPorts();
        }
        print('$id');
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.indigo[800],
        child: CircleAvatar(
          radius: 25,
          backgroundColor: provider.currentIndex == id
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          child: Icon(
            icon,
            color: provider.currentIndex == id
                ? Colors.black
                : Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
