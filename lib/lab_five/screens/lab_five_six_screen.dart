import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LabFiveSixScreen extends StatelessWidget {
  int sample = 62;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          //backgroundColor: Colors.black,
          body: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    cubit.changeAnalyzerOscilloscope();
                  },
                  child: Text('Switch')),
              Expanded(
                child: SfCartesianChart(
                  primaryXAxis: NumericAxis(
                    interval: 1,
                    title: AxisTitle(
                      text: 'Samples',
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    interval: 1,
                    title: AxisTitle(
                      text: 'bits',
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  series: cubit.analyzer
                      ? cubit.getDefaultStepLineSeries()
                      : cubit.getDefaultLineSeries(),
                ),
              ),
              // TextField(
              //   onSubmitted: (value) {
              //     //print(value);
              //     print(cubit.logicSample);
              //
              //     //cubit.setLogicAnalyzer(value);
              //     cubit.setOscilloscope(value);
              //   },
              // ),
              ElevatedButton(
                onPressed: () {
                  cubit.readPort();
                  print(cubit.recievedData);
                },
                child: Text('start Reading'),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
