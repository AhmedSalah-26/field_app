import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class clindricalToCartisanvector extends StatefulWidget {
  @override
  _CartesianToSphericalConverterState createState() =>
      _CartesianToSphericalConverterState();
}

class _CartesianToSphericalConverterState
    extends State<clindricalToCartisanvector> {
  TextEditingController arController = TextEditingController();
  TextEditingController aphiController = TextEditingController();
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
                      "clindrical\nTo\n Cartesian vector",
                      style: GoogleFonts.aladin(
                        letterSpacing: 2,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _buildVectorInputFields2(
                    'Vector ',
                    arController,
                    aphiController,
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
                      convertToVector();
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

  void convertToVector() {
    try {
      // Parse input values
      double x = double.parse(x2Controller.text);
      double y = double.parse(y2Controller.text);
      double z = double.parse(z2Controller.text);
      double ar = double.parse(arController.text);
      double aphi = double.parse(aphiController.text);
      double az = double.parse(zController.text);

      // Calculate phi
      if(x==0){
        x=0.0000001;
      };
      double phi = atan(y/x);

      // Calculate vector components
      double ax = ar * cos(phi) - aphi * sin(phi);
      double ay = ar * sin(phi) + aphi * cos(phi);

      // Update UI state
      setState(() {
        result = '\n ax: ${ax.toStringAsFixed(2)}\n ay: ${ay.toStringAsFixed(2)}\n az: ${az.toStringAsFixed(2)}';
      });
    } catch (e) {
      // Handle invalid input
      setState(() {
        result = 'Invalid input. Please enter valid numeric values.';
      });
    }
  }

  void _resetFields() {
    x2Controller.clear();
    arController.clear();
    aphiController.clear();

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
Widget _buildVectorInputFields2(
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
                labelText: 'δ',
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
                  labelText: 'Φ',
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
                labelText: 'AZ',
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
