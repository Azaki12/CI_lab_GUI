import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:gui_ci_embedded/consts/constants.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  SerialPort port;
  String recievedData = '';
  List<bool> animations = [];
  List<ChartData> oscilloscopeData = [];
  bool analyzer = true;
  int logicSample = 1;

  final List<ChartSampleData> logicAnalyzerData = [];

  List<StepLineSeries<ChartSampleData, num>> getDefaultStepLineSeries() {
    List<StepLineSeries<ChartSampleData, num>> data = [
      StepLineSeries<ChartSampleData, num>(
        color: Colors.red,
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
        name: 'Non-Renewable',
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
        name: 'Non-Renewable',
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.fourthSeriesYValue,
        name: 'Non-Renewable',
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.fifthSeriesYValue,
        name: 'Non-Renewable',
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.sixthSeriesYValue,
        name: 'Non-Renewable',
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.seventhSeriesYValue,
        name: 'Non-Renewable',
      ),
      StepLineSeries<ChartSampleData, num>(
        dataSource: logicAnalyzerData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.eightsSeriesYValue,
        name: 'Non-Renewable',
      ),
    ];
    //emit(AppLogicAnalyzerSuccess());
    return data;
  }

  List<LineSeries<ChartData, num>> getDefaultLineSeries() {
    List<LineSeries<ChartData, num>> data = [
      LineSeries<ChartData, num>(
        animationDuration: 2500,
        dataSource: oscilloscopeData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        width: 2,
      ),
    ];
    //emit(AppOscilloscopeSuccess());
    return data;
  }

  void changeAnalyzerOscilloscope() {
    analyzer = !analyzer;
    emit(AppChangeScreen());
  }

  void setOscilloscope(String data) {
    oscilloscopeData.add(
      ChartData(
        x: (logicSample++).toDouble(),
        y: double.parse(data),
      ),
    );
    emit(AppOscilloscopeSuccess());
  }

  void setLogicAnalyzer(String data) {
    logicAnalyzerData.add(
      ChartSampleData(
        x: logicSample++,
        y: int.parse(data[0]) == 0 ? 14 : 15,
        secondSeriesYValue: int.parse(data[1]) == 0 ? 12 : 13,
        thirdSeriesYValue: int.parse(data[2]) == 0 ? 10 : 11,
        fourthSeriesYValue: int.parse(data[3]) == 0 ? 8 : 9,
        fifthSeriesYValue: int.parse(data[4]) == 0 ? 6 : 7,
        sixthSeriesYValue: int.parse(data[5]) == 0 ? 4 : 5,
        seventhSeriesYValue: int.parse(data[6]) == 0 ? 2 : 3,
        eightsSeriesYValue: int.parse(data[7]) == 0 ? 0 : 1,
      ),
    );
    emit(AppLogicAddSuccess());
  }

  animationInit() {
    for (int i = 0; i < 4; i++) {
      animations.add(false);
    }
  }

  void write(String value) {
    port.write(Uint8List.fromList(value.codeUnits));
    emit(AppWriteSuccessful());
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
    emit(AppSetWaveOn());
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
      String checkData = AsciiCodec().decode(data).toString();

      /// todo revert to normal reading with $
      if (checkData == '_') {
        recievedData = tempData;
        tempData = '';
        print('done');
        analyzer
            ? setLogicAnalyzer(recievedData)
            : setOscilloscope(recievedData);
      } else {
        tempData += checkData;
      }

      emit(AppReadSuccess());
      print(recievedData);
    });
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
