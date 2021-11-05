import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class LabTwoGui extends StatefulWidget {
  @override
  _LabTwoGuiState createState() => _LabTwoGuiState();
}

class _LabTwoGuiState extends State<LabTwoGui> {
  var availablePorts = [];
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPorts();
  }

  void initPorts() {
    setState(() => availablePorts = SerialPort.availablePorts);
    print(availablePorts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 2 Gui'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (availablePorts.isNotEmpty)
            for (final address in availablePorts)
              Builder(builder: (context) {
                final port = SerialPort(address);
                port.config.baudRate = 9600;
                port.config.bits = 8;
                port.config.stopBits = 1;
                if (!port.isOpen) {
                  port.openReadWrite();
                  print('opened');
                }
                print(port.isOpen);
                return Center(
                  child: Column(
                    children: [
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
                          final reader = SerialPortReader(port);

                          reader.stream.listen((data) {
                            //print(data.toString());

                            setState(() {});
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

                      /// todo On / Off MCU
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              port.write(Uint8List.fromList("1".codeUnits));
                              print(Uint8List.fromList("1".codeUnits));
                            },
                            child: Text('On'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              port.write(Uint8List.fromList("0".codeUnits));
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
          if (availablePorts.isEmpty)
            Center(child: Text('No Serial Ports is Detected')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: initPorts,
      ),
    );
  }
}
