import 'package:flutter/material.dart';
import 'package:photoproject/controller/ScreenListener.dart';
import 'package:photoproject/view/PhotoWidget.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ScreenListener().startListening();
  }

  @override
  Widget build(BuildContext context) {
    final fieldController = TextEditingController();
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.white12
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch Data Example'),
          ),
          body: Column(
            children: [
              TextField(
                controller: fieldController,
                  style: TextStyle(color: Colors.white)
              ),
              Builder(
                  builder: (context) => ElevatedButton(
                      child: Text("Foo"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoWidget(
                                    myParameter: fieldController.text,
                                  )),
                        );
                      }))
            ],
          )
          // Center(child: ),
          ),
    );
  }
}
