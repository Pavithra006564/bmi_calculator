import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightcontroller=TextEditingController();
  TextEditingController weightcontroller=TextEditingController();
  String textdata ="";
  void bmicalc(){
    double heights=double.parse(heightcontroller.text);
    double weights=double.parse(weightcontroller.text);
    double result=weights/(heights/100*heights/100);
    setState(() {
      textdata="Your BMI is ${result.toStringAsFixed(2)}";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              "BMI Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 350,
              width: 350,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextField(controller: heightcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.height),
                          fillColor: const Color.fromARGB(198, 255, 255, 255),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          labelText: "Height (cm)",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(controller: weightcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.monitor_weight),
                          fillColor: const Color.fromARGB(198, 255, 255, 255),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          labelText: "Weight (kg)",
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: 
                              TextButton(onPressed: () {
                                bmicalc();
                              },
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 15, 59, 95),
                                  ),
                                ),
                            
                          ),
                        ),
                      ),
Text(textdata),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
