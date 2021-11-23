import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(Appinit());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Map<String, Object>> pages = [];
  List<String> titles = [
    'Basic',
    'Bonus',
  ];
  var availablePorts = [];
  var port;
  String recievedData = '';
  List<bool> animations = [];

  animationInit() {
    for (int i = 0; i < 4; i++) {
      animations.add(false);
    }
  }

  bool getAnimation(index) {
    return animations[index];
  }

  void setAnimation(index, value) {
    animations[index] = value;
    for (int i = 0; i < animations.length; i++) {
      if (i == index) {
        animations[index] = value;
      } else {
        animations[i] = false;
      }
    }
    emit(AppSetSineWaveOn());
  }

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

      /// todo revert to normal reading with $
      if (checkData == '>') {
        recievedData = tempData;
        tempData = '';
        print(tempData);
        print('done');
      } else {
        tempData += checkData;
      }

      // recievedData += checkData;
      // print(checkData);
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
