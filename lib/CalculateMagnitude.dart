import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateMagnitude extends StatelessWidget {
  TextEditingController textFieldControllerX1 = TextEditingController();
  TextEditingController textFieldControllerY1 = TextEditingController();
  TextEditingController textFieldControllerZ1 = TextEditingController();

  TextEditingController textFieldControllerX2 = TextEditingController();
  TextEditingController textFieldControllerY2 = TextEditingController();
  TextEditingController textFieldControllerZ2 = TextEditingController();

  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            toolbarHeight: 80,
            backgroundColor: HSLColor.fromAHSL(1.0, 238, 1.0, 0.71).toColor(),
            centerTitle: true,
            title: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios)),
                Text(
                  "Field Solver",
                  style: GoogleFonts.aladin(
                    letterSpacing: 2,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HSLColor.fromAHSL(1.0, 238, 1.0, 0.71).toColor(),
                  HSLColor.fromAHSL(1.0, 295, 1.0, 0.84).toColor(),
                ],
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "CalculateMagnitude",
                      style: GoogleFonts.aladin(
                        letterSpacing: 2,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _buildVectorInputFields(
                    'Enter Vector 1',
                    textFieldControllerX1,
                    textFieldControllerY1,
                    textFieldControllerZ1,
                  ),
              
              
                  SizedBox(height: 16),
                  TextField(
                    controller: resultController,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.5),
                      ),
                      labelText: 'Result',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      calculateMagnitude();
                    },
                    child: Text('Calculate Magnitude'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _resetFields();
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVectorInputFields(
      String label,
      TextEditingController xController,
      TextEditingController yController,
      TextEditingController zController,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: xController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.5),
                  ),
                  labelText: 'X',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: yController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.5),
                  ),
                  labelText: 'Y',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 5,
                        strokeAlign: 5,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: zController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.5),
                  ),
                  labelText: 'Z',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  void calculateMagnitude() {
    String x = textFieldControllerX1.text;
    String y = textFieldControllerY1.text;
    String z = textFieldControllerZ1.text;

    if (x.isNotEmpty && y.isNotEmpty && z.isNotEmpty) {
      double magnitude = sqrt(
        pow(double.parse(x), 2) +
            pow(double.parse(y), 2) +
            pow(double.parse(z), 2),
      );

      resultController.text = magnitude.toString();
    } else {
      print('Please enter values in all fields.');
    }
  }

  void _resetFields() {
    textFieldControllerX1.clear();
    textFieldControllerY1.clear();
    textFieldControllerZ1.clear();

    textFieldControllerX2.clear();
    textFieldControllerY2.clear();
    textFieldControllerZ2.clear();

    resultController.clear();
  }
}


