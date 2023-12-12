import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class SphericalToCartesianConverter extends StatefulWidget {
  @override
  _SphericalToCartesianConverterState createState() =>
      _SphericalToCartesianConverterState();
}

class _SphericalToCartesianConverterState
    extends State<SphericalToCartesianConverter> {
  TextEditingController radiusController = TextEditingController();
  TextEditingController thetaController = TextEditingController();
  TextEditingController phiController = TextEditingController();

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        toolbarHeight: 80,
        backgroundColor: HSLColor.fromAHSL(1.0, 238, 1.0, 0.71).toColor(),
        centerTitle: true,
        title: Text(
          "Field Solver",
          style: GoogleFonts.aladin(
            letterSpacing: 2,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Spherical to Cartesian",
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
                  labelText: 'Radius',
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
                  labelText: 'Theta',
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
                controller: phiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Phi',
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
                'Cartesian Coordinates: $result',
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
    );
  }

  void convertToCartesian() {
    try {
      double radius = double.parse(radiusController.text);
      double theta = double.parse(thetaController.text);
      double phi = double.parse(phiController.text);

      double x = radius * sin(phi) * cos(theta);
      double y = radius * sin(phi) * sin(theta);
      double z = radius * cos(phi);

      setState(() {
        result =
        '\nX: ${x.toStringAsFixed(2)}\nY: ${y.toStringAsFixed(2)}\nZ: ${z.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input. Please enter valid numeric values.';
      });
    }
  }
}
