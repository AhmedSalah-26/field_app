import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'BouncingContainer.dart';
import 'CalculateMagnitude.dart';
import 'CartesianToCylindricalConverter.dart';
import 'CartesianToSphericalConverter.dart';
import 'CylindricalToCartesianConverter.dart';
import 'DotProduct.dart';
import 'CrossProduct.dart';
import 'SphericalToCartesianConverter.dart';
import 'Sum.dart';
import 'clindricalToCartisanvector.dart';
import 'c_to_s_v.dart';
import 'cartisantoclindrical_vector.dart';
import 'sub.dart';
import 's_to_c_v.dart';

void main() {
  runApp(FieldSolver());
}

class FieldSolver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          toolbarHeight: 80,
          backgroundColor:
          HSLColor.fromAHSL(1.0, 238, 1.0, 0.71).toColor(),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  " Vector operations :",
                  style: GoogleFonts.aladin(
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BouncingContainer(
                          navigateTo: CalculateMagnitude(),
                          text: "Calculate\nMagnitude",
                          color: HSLColor.fromAHSL(1.0, 100, 1.0, 0.4)
                              .toColor(),
                        ),
                        BouncingContainer(
                          navigateTo: VectorSum(),
                          color: Colors.blue,
                          text: "Vector\nSum",
                        ),
                        BouncingContainer(
                          navigateTo: VectorSubtraction(),
                          text: "Vector\nSubtraction",
                          color: HSLColor.fromAHSL(1.0, 50, 1.0, 0.4)
                              .toColor(),
                        ),
                        BouncingContainer(
                          navigateTo: dotPrpduct(),
                          text: "Dot Product",
                          color: HSLColor.fromAHSL(1.0, 238, 1.0, 0.66)
                              .toColor(),
                        ),
                        BouncingContainer(
                          navigateTo: crossProduct(),
                          text: "CrossProduct",
                          color: Colors.deepOrange,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  " Point converter :",
                  style: GoogleFonts.aladin(
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BouncingContainer(
                          navigateTo: CartesianToCylindricalConverter(),
                          text: "Cartesian \nto \nCylindrical ",
                          color: Colors.red,
                        ),
                        BouncingContainer(
                          navigateTo: CylindricalToCartesianConverter(),
                          text: "Cylindrical\nTo \nCartesian",
                          color: HSLColor.fromAHSL(1.0, 100, 1.0, 0.4)
                              .toColor(),
                        ),
                        BouncingContainer(
                          navigateTo: CartesianToSphericalConverter(),
                          text: "Cartesian\nTo\nSpherical",
                          color: Colors.blue,
                        ),
                        BouncingContainer(
                          navigateTo: SphericalToCartesianConverter(),
                          text: "Spherical\nTo\nCartesian",
                          color: HSLColor.fromAHSL(1.0, 222, 1.0, 0.55)
                              .toColor(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  " Vector converter :",
                  style: GoogleFonts.aladin(
                    letterSpacing: 2,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BouncingContainer(
                        navigateTo: CartesianToclindricalvector(),
                        color: Colors.red,
                        text: "Cartesian\nTo\nclindrical\nvector",
                      ),
                      BouncingContainer(
                        navigateTo: clindricalToCartisanvector(),
                        text: "Clindrical\nTo\nCartisan \n vector",
                        color: HSLColor.fromAHSL(1.0, 20, 1.0, 0.4)
                            .toColor(),
                      ),
                      BouncingContainer(
                        navigateTo: CartesianTosphrecalvector(),
                        text: "Cartesian\nTo\nsphrecal\nvector",
                        color: HSLColor.fromAHSL(1.0, 50, 1.0, 0.4)
                            .toColor(),
                      ),
                      BouncingContainer(
                        navigateTo: sphrecalvectortoCartesian(),
                        color: Colors.blue,
                        text: "Sphrecal\nto\nCartesian\nvectot",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
