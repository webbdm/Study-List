import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/session.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study List',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        scaffoldBackgroundColor: const Color(0xFFEDF5FC),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Study List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<List<Session>> fetchSessions() async {
  final response = await http.get(Uri.parse('http://localhost:3000/sessions'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.body);
    return (jsonDecode(response.body) as List)
        .map((data) => Session.fromJson(data))
        .toList();
    //.toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Sessions');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Session>> sessions;

  @override
  void initState() {
    super.initState();
    sessions = fetchSessions();
    log('sessions: $sessions');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called dsdhfasdusda
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF357EA5),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                        ),
                        border: Border.all(
                          width: 3,
                          color: const Color(0xFF357EA5),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Study",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                    ),
                                  ),
                                  Text(
                                    " List",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * .20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF246E96),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0),
                                    bottomRight: Radius.circular(40.0),
                                  ),
                                  border: Border.all(
                                    width: 10,
                                    color: const Color(0xFF357EA5),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Studies",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Text(
                                              "|",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Notes",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: TextField(
                                              decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.search),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText:
                                                      "Search by keyword")),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("Yay"),
              Text("Yay"),
              Text("Yay"),
              Text("Yay"),
              Text("Yay")
            ],
          )
        ],
      ),
    );
  }
}
