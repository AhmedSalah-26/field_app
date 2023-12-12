import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CartesianToclindricalvector extends StatefulWidget {
  @override
  _CartesianToSphericalConverterState createState() =>
      _CartesianToSphericalConverterState();
}

class _CartesianToSphericalConverterState
    extends State<CartesianToclindricalvector> {
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
  TextEditingController zController = TextEditingController();
  TextEditingController x2Controller = TextEditingController();
  TextEditingController y2Controller = TextEditingController();
  TextEditingController z2Controller = TextEditingController();

  String result = '';

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
                      "Cartesian\nTo\n clindrical vector",
                      style: GoogleFonts.aladin(
                        letterSpacing: 2,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _buildVectorInputFields(
                    'Vector ',
                    xController,
                    yController,
                    zController,
                  ),
                  SizedBox(height: 16),
                  _buildVectorInputFields(
                    'point',
                    x2Controller,
                    y2Controller,
                    z2Controller,
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      convertvector();
                    },
                    child: Text('Calculate '),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _resetFields();
                    },
                    child: Text('Reset'),
                  ),
                  Text(result,style: TextStyle(fontSize: 25),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void convertvector() {
    try {
      double x = double.parse(x2Controller.text);
      double y = double.parse(y2Controller.text);
      double z = double.parse(z2Controller.text);
      double xv = double.parse(xController.text);
      double yv = double.parse(yController.text);
      double zv = double.parse(zController.text);
      double phi = atan(y/x);

      double ar = xv*cos(phi)+yv*sin(phi);
      double aphi = -xv*sin(phi)+yv*cos(phi);



      setState(() {
        result =
        '\n δ: ${ar.toStringAsFixed(2)}\nΦ: ${aphi.toStringAsFixed(2)}\nz: ${zv.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input. Please enter valid numeric values.';
      });
    }
  }
  void _resetFields() {
    x2Controller.clear();
    xController.clear();
    yController.clear();

    y2Controller.clear();
    z2Controller.clear();
    zController.clear();

  }
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
                  borderSide: BorderSide(color: Colors.black,width: 1),

                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,width: 2.5),

                ),
                labelText: 'X',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Change color here
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
                    borderSide: BorderSide(color: Colors.black,width: 1),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 2.5),

                  ),
                  labelText: 'Y',
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 5,strokeAlign: 5,style: BorderStyle.solid))
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
                  borderSide: BorderSide(color: Colors.black,width: 1),

                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,width: 2.5),

                ),
                labelText: 'Z',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Change color here
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
