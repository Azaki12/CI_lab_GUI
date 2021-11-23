import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:gui_ci_embedded/lab_three/provider/states.dart';

class Lab3AppCubit extends Cubit<AppStates> {
  Lab3AppCubit() : super(Appinit());

  static Lab3AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Map<String, Object>> pages = [];
  List<String> titles = [
    'Basic',
    'Bonus',
  ];
  var availablePorts = [];
  var port;
  String recievedData = '';
  AnimationController animationController;

  void initPorts() {
    availablePorts = SerialPort.availablePorts;
    emit(AppReadPortsInit());
    print(availablePorts);
  }

  readPort() {
    final reader = SerialPortReader(port, timeout: 2000);
    String tempData = '';
    reader.stream.listen((data) {
      //print(data.toString());
      //recievedData = '';

      String checkData = AsciiCodec().decode(data).toString();
      if (checkData == '\$') {
        recievedData = tempData;
        tempData = '';
        print(tempData);
        print('done');
      } else {
        tempData += checkData;
      }
      emit(AppReadSuccess());
    }).onDone(() {});
    print(recievedData);
    print('here');
  }

  setRecievedData(String value) {
    recievedData = value;
  }

  openPort(address) {
    port = SerialPort(address);
    port.config.baudRate = 9600;
    port.config.bits = 8;
    port.config.stopBits = 1;

    emit(AppOpenSuccess());
    if (!port.isOpen) {
      port.openReadWrite();
      print('opened');
    }
  }

  /// Method to change the BottomNavBar Item
  changeBottomNavigationBarIndex(index) {
    currentIndex = index;
    emit(AppChangeIndex());
  }

  /// Method to change the title of the scaffold
  changeTitle() {
    print(currentIndex);
    return titles[currentIndex];
  }
}
