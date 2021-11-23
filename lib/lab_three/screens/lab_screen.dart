import 'dart:typed_data';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/constants.dart';
import 'package:gui_ci_embedded/lab_three/fancy_fab.dart';
import 'package:gui_ci_embedded/lab_three/slider_button/slider.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

class LabScreen extends StatefulWidget {
  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> with TickerProviderStateMixin {
  FlipCardController _controller;
  AnimationController pin0Controller;
  AnimationController pin1Controller;
  AnimationController pin2Controller;
  AnimationController pin3Controller;
  AnimationController pin4Controller;
  AnimationController pin5Controller;
  AnimationController pin6Controller;
  AnimationController pin7Controller;

  Animation<Color> _pin0color;
  Animation<Color> _pin1color;
  Animation<Color> _pin2color;
  Animation<Color> _pin3color;
  Animation<Color> _pin4color;
  Animation<Color> _pin5color;
  Animation<Color> _pin6color;
  Animation<Color> _pin7color;

  List<int> values = [];
  var value;
  String finalVal = '';
  var ff;
  void animationConfig() {
    pin0Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin0color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin0Controller);

    pin1Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin1color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin1Controller);

    pin2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin2color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin2Controller);

    pin3Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin3color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin3Controller);

    pin4Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin4color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin4Controller);

    pin5Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin5color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin5Controller);

    pin6Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin6color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin6Controller);

    pin7Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _pin7color = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(pin7Controller);
  }

  String readWrite = 'r';
  bool port = false;
  bool pin = false;
  bool ddr = false;
  bool ram = false;
  bool rom = false;
  String address;

  @override
  void initState() {
    _controller = FlipCardController();
    animationConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                FlipCard(
                  onFlip: () {
                    if (readWrite == 'r') {
                      readWrite = 'w';
                    } else {
                      readWrite = 'r';
                    }
                    setState(() {});
                    print(readWrite);
                  },
                  controller: _controller,
                  front: Container(
                    width: 69,
                    height: 69,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: Colors.red[100],
                    ),
                    child: const Text(
                      'r',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  back: Container(
                    width: 69,
                    height: 69,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: Colors.blue[100],
                    ),
                    child: const Text(
                      'w',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FancyFab(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// PORT
                    GestureDetector(
                      onTap: () {
                        port = true;
                        pin = false;
                        ddr = false;
                        ram = false;
                        rom = false;
                        if (Consts.port == 'A') {
                          address = '58';
                        } else if (Consts.port == 'B') {
                          address = '56';
                        } else if (Consts.port == 'C') {
                          address = '53';
                        } else if (Consts.port == 'D') {
                          address = '50';
                        }
                        setState(() {});
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: port ? Colors.blue[400] : Colors.grey[400],
                        ),
                        child: Center(
                          child: Text(
                            'PORT',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    /// PIN
                    GestureDetector(
                      onTap: () {
                        port = false;
                        pin = true;
                        ddr = false;
                        ram = false;
                        rom = false;
                        if (Consts.port == 'A') {
                          address = '57';
                        } else if (Consts.port == 'B') {
                          address = '55';
                        } else if (Consts.port == 'C') {
                          address = '51';
                        } else if (Consts.port == 'D') {
                          address = '48';
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: pin ? Colors.blue[400] : Colors.grey[400],
                        ),
                        child: Center(
                          child: Text(
                            'PIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    /// DDR
                    GestureDetector(
                      onTap: () {
                        port = false;
                        pin = false;
                        ddr = true;
                        ram = false;
                        rom = false;
                        if (Consts.port == 'A') {
                          address = '59';
                        } else if (Consts.port == 'B') {
                          address = '55';
                        } else if (Consts.port == 'C') {
                          address = '52';
                        } else if (Consts.port == 'D') {
                          address = '49';
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ddr ? Colors.blue[400] : Colors.grey[400],
                        ),
                        child: Center(
                          child: Text(
                            'DDR',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    /// RAM
                    GestureDetector(
                      onTap: () {
                        port = false;
                        pin = false;
                        ddr = false;
                        ram = true;
                        rom = false;
                        address = '';
                        setState(() {});
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ram ? Colors.blue[400] : Colors.grey[400],
                        ),
                        child: Center(
                          child: Text(
                            'RAM',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    /// ROM
                    GestureDetector(
                      onTap: () {
                        port = false;
                        pin = false;
                        ddr = false;
                        ram = false;
                        rom = true;
                        address = ' ';
                        setState(() {});
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: rom ? Colors.blue[400] : Colors.grey[400],
                        ),
                        child: Center(
                          child: Text(
                            'ROM',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin0Controller.isCompleted) {
                            pin0Controller.reverse();
                          } else
                            pin0Controller.forward();
                          print(pin0Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin0color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin0color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          print(pin1Controller.value);
                          if (pin1Controller.isCompleted) {
                            pin1Controller.reverse();
                          } else {
                            pin1Controller.forward();
                          }
                          setState(() {});

                          print(pin1Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin1color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin1color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin2Controller.isCompleted) {
                            pin2Controller.reverse();
                          } else
                            pin2Controller.forward();
                          print(pin2Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin2color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin2color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin3Controller.isCompleted) {
                            pin3Controller.reverse();
                          } else
                            pin3Controller.forward();
                          print(pin3Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin3color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin3color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin4Controller.isCompleted) {
                            pin4Controller.reverse();
                          } else
                            pin4Controller.forward();
                          print(pin4Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin4color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin4color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin5Controller.isCompleted) {
                            pin5Controller.reverse();
                          } else
                            pin5Controller.forward();
                          print(pin5Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin5color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin5color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin6Controller.isCompleted) {
                            pin6Controller.reverse();
                          } else
                            pin6Controller.forward();
                          print(pin6Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin6color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin6color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          if (pin7Controller.isCompleted) {
                            pin7Controller.reverse();
                          } else
                            pin7Controller.forward();
                          print(pin7Controller.value);
                        },
                        child: AnimatedBuilder(
                          builder: (BuildContext context, Widget child) {
                            return Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: _pin7color.value,
                                shape: BoxShape.circle,
                                border: Border.all(width: 1),
                              ),
                            );
                          },
                          animation: _pin7color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SliderButton(
                  action: () {
                    values = [];
                    print(pin0Controller.value);
                    values.add(pin0Controller.value.toInt());
                    values.add(pin1Controller.value.toInt());
                    values.add(pin2Controller.value.toInt());
                    values.add(pin3Controller.value.toInt());
                    values.add(pin4Controller.value.toInt());
                    values.add(pin5Controller.value.toInt());
                    values.add(pin6Controller.value.toInt());
                    values.add(pin7Controller.value.toInt());
                    String val = '';

                    for (int i = 0; i < values.length; i++) {
                      val += values[i].toString();
                    }
                    setState(() {});
                    value = convert(val);
                    // print(value);
                    finalVal = '@$readWrite$address$value;';
                    //print(cubit.port);
                    print(finalVal);
                    cubit.port.write(Uint8List.fromList(finalVal.codeUnits));
                  },
                  buttonColor: Colors.blue,
                  radius: 10,
                  alignLabel: Alignment.center,
                  icon: Icon(Icons.send),
                  shimmer: true,
                  label: const Text(
                    'Configure',
                    style: TextStyle(fontSize: 20),
                  ),
                  dismissible: false,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.readPort();
                    // print(cubit.recievedData);
                    // if (readWrite == 'r') {
                    //   ff = value;
                    // }
                    // print(ff);
                    setState(() {});
                  },
                  child: Text('jdaklsd'),
                ),
                Text(cubit.recievedData),
              ],
            ),
          ),
        );
      },
    );
  }

  int convert(String val) {
    int decimal_value = 0; //decimal value

    int binary_value = int.parse(val);

    int last_digit;

    int i = 1;

    while (binary_value > 0) {
      last_digit = binary_value % 10;

      binary_value = (binary_value / 10).floor();

      decimal_value += last_digit * i;

      i = i * 2;
    }
    return decimal_value;
  }
}
