import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CylindricalToCartesianConverter extends StatefulWidget {
  @override
  _CylindricalToCartesianConverterState createState() =>
      _CylindricalToCartesianConverterState();
}

class _CylindricalToCartesianConverterState
    extends State<CylindricalToCartesianConverter> {
  TextEditingController radiusController = TextEditingController();
  TextEditingController thetaController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cylindrical to Cartesian",
                  style: GoogleFonts.aladin(
                    letterSpacing: 2,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              TextField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'δ',
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
                controller: thetaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Φ',
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
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'z',
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
                  convertToCartesian();
                },
                child: Text('Convert '),
              ),
              SizedBox(height: 20),
              Text(
                style: GoogleFonts.aladin(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                'Cartesian Coordinates: $result',

              ),
            ],
          ),
        ),
      ),
    );
  }

  void convertToCartesian() {
    try {
      double radius = double.parse(radiusController.text);
      double theta = double.parse(thetaController.text);
      double height = double.parse(heightController.text);

      double x = radius * cos(theta);
      double y = radius * sin(theta);
      double z = height;

      setState(() {
        result =
        '\n ,  X: ${x.toStringAsFixed(2)}\n, Y: ${y.toStringAsFixed(2)}\n, Z: ${z.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input. Please enter valid numeric values.';
      });
    }
  }
}
