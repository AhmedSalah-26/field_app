import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class crossProduct extends StatelessWidget {
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
                      "cross product",
                      style: GoogleFonts.aladin(
                        letterSpacing: 2,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _buildVectorInputFields(
                    'Vector 1',
                    textFieldControllerX1,
                    textFieldControllerY1,
                    textFieldControllerZ1,
                  ),
                  SizedBox(height: 16),
                  _buildVectorInputFields(
                    'Vector 2',
                    textFieldControllerX2,
                    textFieldControllerY2,
                    textFieldControllerZ2,
                  ),
                  SizedBox(height: 16),
                  TextField(

                    controller: resultController,
                    readOnly: true,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(fontSize: 25),
                      labelText: 'Result',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue), // Change color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 1),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,width: 2.5),

                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      calculateCrossProduct();
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
    return SingleChildScrollView(
      child: Column(
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
                    labelText: 'X',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black,width: 1),

          ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2.5),

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
                      labelText: 'Y',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 1),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2.5),

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
                    labelText: 'Z',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 1),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,width: 2.5),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void calculateCrossProduct() {
    String x1 = textFieldControllerX1.text;
    String y1 = textFieldControllerY1.text;
    String z1 = textFieldControllerZ1.text;

    String x2 = textFieldControllerX2.text;
    String y2 = textFieldControllerY2.text;
    String z2 = textFieldControllerZ2.text;

    if (x1.isNotEmpty &&
        y1.isNotEmpty &&
        z1.isNotEmpty &&
        x2.isNotEmpty &&
        y2.isNotEmpty &&
        z2.isNotEmpty) {
      double resultX = (double.parse(y1) * double.parse(z2)) - double.parse(z1) * double.parse(y2);
      double resultY =  (double.parse(z1) * double.parse(x2))- (double.parse(x1) * double.parse(z2));
      double resultZ =(double.parse(x1) * double.parse(y2))  - (double.parse(y1) * double.parse(x2));
      
      resultController.text = '($resultX i, $resultY j, $resultZ k)';
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
