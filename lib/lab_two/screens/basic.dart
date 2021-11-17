import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

class BasicScreen extends StatefulWidget {
  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  var controller = TextEditingController();
  bool close = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (cubit.availablePorts.isNotEmpty)
                for (final address in cubit.availablePorts)
                  Builder(builder: (context) {
                    return Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              cubit.openPort(address);
                              print(cubit.port.isOpen);
                            },
                            child: const Text(
                              'Conncect',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  controller: controller,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// todo Reading data from port
                          ElevatedButton(
                            onPressed: () {
                              final readerBasic =
                                  SerialPortReader(cubit.port, timeout: 2000);
                              readerBasic.stream.listen((data) {
                                //print(data.toString());
                                if (close) {
                                  close = false;
                                  readerBasic.close();
                                  print('closed');
                                }
                                controller.text =
                                    AsciiCodec().decode(data).toString();

                                print('received: $data');
                              });
                              print('read complete');
                            },
                            child: Text('Read Data'),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          ElevatedButton(
                            onPressed: () {
                              close = true;
                              setState(() {});
                            },
                            child: Text('Stop Reading'),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          /// todo On / Off MCU
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  cubit.port
                                      .write(Uint8List.fromList("1".codeUnits));
                                  print(Uint8List.fromList("1".codeUnits));
                                },
                                child: Text('On'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cubit.port
                                      .write(Uint8List.fromList("0".codeUnits));
                                  print(Uint8List.fromList("0".codeUnits));
                                },
                                child: Text('Off'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
              if (cubit.availablePorts.isEmpty)
                Center(child: Text('No Serial Ports is Detected')),
            ],
          ),
        );
      },
    );
  }
}
