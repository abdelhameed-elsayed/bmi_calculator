import 'dart:math';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool ismale = true;
  double val = 120;
  double w = 50;
  double e = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALC'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ismale ? Colors.blue : Colors.yellow),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Image(
                              height: 100,
                              width: 100,
                              image: AssetImage('assets/male-gender.png'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'MALE',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !ismale ? Colors.blue : Colors.yellow),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Image(
                              image: AssetImage('assets/female.png'),
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow),
                child: Column(
                  children: [
                    const Text(
                      'Hight',
                      style: TextStyle(
                        fontSize: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          '${val.round()}',
                          style: const TextStyle(fontSize: 60),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(fontSize: 20),
                        ),
                        Slider(
                            value: val,
                            max: 220,
                            min: 80,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                              print(value.round());
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '${e.round()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    e--;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    e++;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'whigth',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '${w.round()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    w--;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    w++;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: MaterialButton(
              onPressed: () {
                var result = w / pow(val / 100, 2);
                print(result.round());

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bmi(
                              age: e,
                              ismale: ismale,
                              result: result.round(),
                            )));
              },
              child: const Text('CLCULATOR'),
            ),
          ),
        ],
      ),
    );
  }
}

class bmi extends StatelessWidget {
  final int result;
  final bool ismale;
  final double age;

  bmi({
    required this.result,
    required this.ismale,
    required this.age,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_left)),
          title: const Text(
            'BMI_result',
            style: TextStyle(fontSize: 35),
          ),
          actions: []),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Gender : ${ismale ? 'Male' : 'Female'}',
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            'Result : $result',
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            'Age : $age',
            style: const TextStyle(fontSize: 30),
          )
        ]),
      ),
    );
  }
}
