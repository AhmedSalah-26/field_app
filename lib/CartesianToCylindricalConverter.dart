import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CartesianToCylindricalConverter extends StatefulWidget {
  @override
  _CartesianToCylindricalConverterState createState() =>
      _CartesianToCylindricalConverterState();
}

class _CartesianToCylindricalConverterState
    extends State<CartesianToCylindricalConverter> {
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
  TextEditingController zController = TextEditingController();

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
                  "Cartesian to Cylindrical ",
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
                  convertToCylindrical();
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
                'Cylindrical Coordinates: $result',

              ),
            ],
          ),
        ),
      ),
    );
  }

  void convertToCylindrical() {
    try {
      double x = double.parse(xController.text);
      double y = double.parse(yController.text);
      double z = double.parse(zController.text);

      double radius = sqrt(x * x + y * y);
      double phi = atan2(y, x);
      double height = z;

      setState(() {
        result =
            '\n ,  σ: ${radius.toStringAsFixed(2)}\n, Φ: ${phi.toStringAsFixed(2)}\n, z: ${height.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        result = 'Invalid input. Please enter valid numeric values.';
      });
    }
  }
}
