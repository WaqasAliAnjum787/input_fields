import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GettingDataFromTextFiled(),
    );
  }
}

class GettingDataFromTextFiled extends StatefulWidget {
  const GettingDataFromTextFiled({super.key});

  @override
  State<GettingDataFromTextFiled> createState() =>
      _GettingDataFromTextFiledState();
}

class _GettingDataFromTextFiledState extends State<GettingDataFromTextFiled> {
  late TextEditingController myController;
  String name = '';
  @override
  void initState() {
    super.initState();
    myController = TextEditingController();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                      fillColor: Color.fromARGB(31, 194, 20, 20),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                              color: Colors.pink,
                              width: 3,
                              style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 3,
                          )),
                      focusColor: Color.fromARGB(255, 0, 94, 255)),
                  controller: myController,
                  onChanged: (value) {
                    setState(() {
                      name = myController.text;
                    });
                  },
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  name = myController.text.toString();
                });
              },
              child: const Text('Get Data')),
          const SizedBox(
            height: 30,
          ),
          Text(name)
        ],
      ),
    );
  }
}
