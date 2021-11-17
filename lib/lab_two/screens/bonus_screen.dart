import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gui_ci_embedded/lab_two/provider/cubit.dart';
import 'package:gui_ci_embedded/lab_two/provider/states.dart';

class BonusScreen extends StatefulWidget {
  @override
  State<BonusScreen> createState() => _BonusScreenState();
}

class _BonusScreenState extends State<BonusScreen> {
  var speed = 20;
  String recievedData = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.availablePorts.isNotEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //recievedData = '';
                            cubit.readPort();
                            print(cubit.recievedData);
                            recievedData = cubit.recievedData;
                            setState(() {});
                          },
                          child: Text('Read Data'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                speed += 10;
                                if (speed > 100) {
                                  speed = 100;
                                }
                                cubit.port
                                    .write(Uint8List.fromList("+".codeUnits));

                                setState(() {});
                              },
                              child: const Text(
                                '+',
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('${cubit.recievedData} Degrees'),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                speed -= 10;
                                if (speed < 10) {
                                  speed = 10;
                                }
                                cubit.port
                                    .write(Uint8List.fromList("-".codeUnits));

                                setState(() {});
                              },
                              child: Text(
                                '-',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text('$speed% of Motor Speed'),
                      ],
                    ),
                  ),
                )
              : Center(child: const Text('No Ports Detected')),
        );
      },
    );
  }
}
