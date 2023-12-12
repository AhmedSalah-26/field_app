import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CartesianToSphericalConverter extends StatefulWidget {
  @override
  _CartesianToSphericalConverterState createState() =>
      _CartesianToSphericalConverterState();
}

class _CartesianToSphericalConverterState
    extends State<CartesianToSphericalConverter> {
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
  TextEditingController zController = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/450;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 80,
        backgroundColor: HSLColor.fromAHSL(1.0, 238, 1.0, 0.71).toColor(),
        centerTitle: true,
        title: Row(
          children: [
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Cartesian to Spherical",
                    style: GoogleFonts.aladin(
                      letterSpacing: 2,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextField(
                  controller: xController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'X Coordinate',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
            
                TextField(
                  controller: yController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Y Coordinate',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                TextField(
                  controller: zController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Z Coordinate',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.5),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    convertToSpherical();
                  },
                  child: Text('Convert '),
                ),
                SizedBox(height: 20),
                Text(
                  'Spherical Coordinates: $result',
                  style: GoogleFonts.aladin(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void convertToSpherical() {
    try {
      double x = double.parse(xController.text);
      double y = double.parse(yController.text);
      double z = double.parse(zController.text);

      double radius = sqrt(x * x + y * y + z * z);
      double theta = atan2(y, x);
      double phi = atan2(sqrt(x * x + y * y), z);

      setState(() {
        result =
        '\nRadius: ${radius.toStringAsFixed(2)}\nTheta: ${theta.toStringAsFixed(2)}\nPhi: ${phi.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input. Please enter valid numeric values.';
      });
    }
  }
}
