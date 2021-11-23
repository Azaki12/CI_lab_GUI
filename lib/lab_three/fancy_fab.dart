import 'package:flutter/material.dart';
import 'package:gui_ci_embedded/constants.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 720.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -20.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  Widget portA() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'portA',
        onPressed: () {
          Consts.port = '';
          Consts.port = 'A';
          _animationController.reverse();
          setState(() {});
        },
        child: Text('A'),
      ),
    );
  }

  Widget portB() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'portB',
        onPressed: () {
          Consts.port = '';
          Consts.port = 'B';
          _animationController.reverse();
          setState(() {});
        },
        child: Text('B'),
      ),
    );
  }

  Widget portC() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'portC',
        onPressed: () {
          Consts.port = '';
          Consts.port = 'C';
          _animationController.reverse();
          setState(() {});
        },
        child: Text('C'),
      ),
    );
  }

  Widget portD() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'portD',
        onPressed: () {
          Consts.port = '';
          Consts.port = 'D';
          _animationController.reverse();
          setState(() {});
        },
        child: Text('D'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        toggle(),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * -1,
            0.0,
            0.0,
          ),
          child: portA(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * -1.5,
            0.0,
            0.0,
          ),
          child: portB(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * -2,
            0.0,
            0.0,
          ),
          child: portC(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value * -2.5,
            0.0,
            0.0,
          ),
          child: portD(),
        ),
      ],
    );
  }
}
