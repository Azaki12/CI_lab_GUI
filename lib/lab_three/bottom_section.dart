import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gui_ci_embedded/lab_three/slider_button/slider.dart';

class BottomSection extends StatefulWidget {
  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
/*------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------  OR Widget  --------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
/*----------------------------------------  logout slider button  ---------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
        Center(
            child: SliderButton(
                action: () {
                  ///Do something here
                },
                label: Text(
                  "   Slide to logout",
                  style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).accentColor,
                ))),

/*------------------------------------------------------------------------------------------------------*/
/*---------------------------------------------  hint circle  --------------------------------------------*/
/*------------------------------------------------------------------------------------------------------*/
      ],
    );
  }
}
