// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'get.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.amber,
        canvasColor: const Color.fromRGBO(244, 67, 54, 1),
      ),
      home: MyPasswordPage(storage: CounterStorage()),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/password.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents).toString();
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  Future<File> writeCounter(String keyPass) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(keyPass);
  }
}

class MyPasswordPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyPasswordPage({required this.storage});

  final CounterStorage storage;

  @override
  State<MyPasswordPage> createState() => _MyPasswordPage();
}

int routeToPass = 0;

class _MyPasswordPage extends State<MyPasswordPage> {
  String _keyPass = "";

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _keyPass = value.toString();
        print(_keyPass);
      });
    });
  }

  @override
  // ignore: override_on_non_overriding_member
  double boxHeight = 130;
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: boxHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: "button_1",
                  onPressed: () {
                    _password = _password + "1";
                  },
                  child: const Text("1")),
              FloatingActionButton(
                  heroTag: "button_2",
                  onPressed: () {
                    _password = _password + "2";
                  },
                  child: const Text("2")),
              FloatingActionButton(
                heroTag: "button_3",
                onPressed: () {
                  _password = _password + "3";
                },
                child: const Text("3"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: "button_4",
                  onPressed: () {
                    _password = _password + "4";
                  },
                  child: const Text("4")),
              FloatingActionButton(
                  heroTag: "button_5",
                  onPressed: () {
                    _password = _password + "5";
                  },
                  child: const Text("5")),
              FloatingActionButton(
                heroTag: "button_6",
                onPressed: () {
                  _password = _password + "6";
                },
                child: const Text("6"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  heroTag: "button_7",
                  onPressed: () {
                    _password = _password + "7";
                  },
                  child: const Text("7")),
              FloatingActionButton(
                  heroTag: "button_8",
                  onPressed: () {
                    _password = _password + "8";
                  },
                  child: const Text("8")),
              FloatingActionButton(
                heroTag: "button_9",
                onPressed: () {
                  _password = _password + "9";
                },
                child: const Text("9"),
              ),
            ],
          ),
          FloatingActionButton(
              heroTag: "button_0",
              onPressed: () {
                _password = _password + "0";
              },
              child: const Text("0")),
          SizedBox(
            height: boxHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _password = "";
                },
                child: const Text("Clear",
                    style: TextStyle(fontSize: 30, color: Colors.black87)),
              ),
              const SizedBox(width: 30),
              TextButton(
                onPressed: () {
                  if (routeToPass == 1) {
                    CounterStorage().writeCounter(_password);
                    routeToPass = 0;
                  }
                  if (_password == _keyPass) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyHomePage(storage: LogStorage());
                      }),
                    );
                  } else {
                    print("_password = " +
                        _password +
                        " | _keyPass = " +
                        _keyPass);
                  }
                },
                child: const Text("Enter",
                    style: TextStyle(fontSize: 30, color: Colors.black87)),
              )
            ],
          ),
        ],
      )),
    );
  }
}

class LogStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/log.txt');
  }

  Future<String> readLog() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  Future<File> writeCounter(String keyPass) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(keyPass);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.storage});
  final LogStorage storage;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int minutes = 0;
  int _tasksDone = 0;
  int _tasksFailed = 0;
  // ignore: unused_field
  dynamic _name = "No Task";
  // ignore: unused_field, prefer_final_fields
  List _tasks = ["clean room", "Make food"];
  dynamic listItem;

  void _tasksDoneCounter() {
    _name = loadAsset();
    setState(() {
      _name = loadAsset();
      _tasksDone++;
    });
  }

  void _tasksFailedCounter() {
    _name = loadAsset();
    setState(() {
      _tasksFailed++;
      _name = loadAsset();
    });
  }

  void _newAPTRR() {
    setState(() {
      loadAsset();
    });
  }

  void _askForPermisson(int probability, quest) {
    int number = Random().nextInt(probability);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    int timeNow = int.parse(formattedDate.split(":")[1]);
    String answer = "NO";
    if (number == 1 && timeNow == 0 || number == 1 && timeNow >= minutes + 5) {
      minutes = int.parse(formattedDate.split(":")[1]);
      answer = "YES";
      print(minutes);
    }
    print("TimeNow: $timeNow---minutes: $minutes");
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          _buildPopupDialog(context, answer, quest),
    );
  }

  void _askForNumber(int probability, quest) {
    int number = Random().nextInt(probability);
    String numbers = number.toString();
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          _buildPopupDialog(context, numbers, quest),
    );
  }

  void _settings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return const MySetting();
      }),
    );
  }

  final controller = PageController(initialPage: 0);

  String _logContent = "";
  @override
  void initState() {
    super.initState();
    widget.storage.readLog().then((value) {
      setState(() {
        _logContent = value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double userWidth = MediaQuery.of(context).size.width;
    double userHeight = MediaQuery.of(context).size.height;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              color: Colors.blue,
              child: Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: userHeight / 8,
                    // Here we take the value from the MyHomePage object that was created by
                    // the App.build method, and use it to set our appbar title.
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: userWidth / 4,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: FloatingActionButton(
                                heroTag: "setting",
                                onPressed: () {
                                  _settings();
                                },
                                tooltip: "Settings",
                                child: const Icon(Icons.settings),
                              ),
                            )),
                        SizedBox(
                          width: userWidth / 3,
                          child: Text("Finished: $_tasksDone"),
                        ),
                        SizedBox(
                          width: userWidth / 4,
                          child: Text("Failed: $_tasksFailed"),
                        ),
                      ],
                    )),
                body: Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Invoke "debug painting" (press "p" in the console, choose the
                  // "Toggle Debug Paint" action from the Flutter Inspector in Android
                  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                  // to see the wireframe for each widget.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    SizedBox(
                      height: userHeight / 9,
                      child: Text(
                        "Task:",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    SizedBox(
                      height: userHeight / 2 + userHeight / 9,
                      width: userWidth - userWidth / 8,
                      child: Center(
                          child: ListView(
                        children: [
                          FutureBuilder(
                              future: loadAsset(),
                              builder: ((context, snapshot) {
                                // Checking if future is resolved or not
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  // If we got an error
                                  if (snapshot.hasError) {
                                    return const Center(child: Text("ERROR"));
                                  }
                                  if (snapshot.hasData) {
                                    // Extracting data from snapshot object
                                    final data = snapshot.data as String;
                                    return Center(
                                      child: Text(data,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4),
                                    );
                                  }
                                }
                                return const Text("No data");
                              }))
                        ],
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: userHeight / 16,
                          width: userWidth / 3,
                          child: FloatingActionButton(
                            heroTag: "TaskFailed",
                            onPressed: _tasksFailedCounter,
                            tooltip: 'Task failed',
                            child: const Icon(Icons.highlight_remove_rounded),
                          ),
                        ),
                        SizedBox(
                          height: userHeight / 16,
                          width: userWidth / 5,
                          //child: FloatingActionButton(
                          //  onPressed: _incrementCounter,
                          //  tooltip: 'Increment',
                          //  child: const Icon(Icons.add),
                        ),
                        SizedBox(
                          height: userHeight / 16,
                          width: userWidth / 3,
                          child: FloatingActionButton(
                            heroTag: "TaskDone",
                            onPressed: _tasksDoneCounter,
                            tooltip: 'Task done',
                            child: const Icon(Icons.done),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Container(
              color: const Color.fromARGB(255, 37, 102, 35),
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: userHeight / 8,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: userWidth / 4,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FloatingActionButton(
                              heroTag: "setting",
                              onPressed: () {
                                _settings();
                              },
                              tooltip: "Settings",
                              child: const Icon(Icons.settings),
                            ),
                          )),
                      SizedBox(
                        width: userWidth / 1.5,
                        child: Text("Ask for Permission",
                            style: Theme.of(context).textTheme.headline6),
                      )
                    ],
                  ),
                ),
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: null,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 30,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 236, 76, 76),
                          ),
                          onPressed: () =>
                              _askForPermisson(2, "Toilett Permission"),
                          child: Text(
                            "Go on toilett",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                    ),
                    SizedBox(
                      height: userHeight / 30,
                    ),
                    SizedBox(
                      height: null,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 30,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 236, 76, 76),
                          ),
                          onPressed: () =>
                              _askForPermisson(10, "Cum Permission"),
                          child: Text(
                            "Cum",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                    ),
                    SizedBox(
                      height: userHeight / 30,
                    ),
                    SizedBox(
                      height: null,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 30,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 236, 76, 76),
                          ),
                          onPressed: () => _askForNumber(100, "Number"),
                          child: Text(
                            "Number",
                            style: Theme.of(context).textTheme.headline4,
                          )),
                    ),
                  ],
                )),
              )),
          Container(
              color: Colors.red,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: userHeight / 12,
                  title: SizedBox(
                      child: FloatingActionButton(
                    onPressed: _newAPTRR,
                    tooltip: 'Increment',
                    child: const Icon(Icons.update),
                  )),
                ),
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Action: ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 24, 166, 209))),
                        SizedBox(
                            child: FutureBuilder(
                                future: getAction(),
                                builder: ((context, snapshot) {
                                  // Checking if future is resolved or not
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      // Extracting data from snapshot object
                                      final data = snapshot.data as String;
                                      return Center(
                                          child: SingleChildScrollView(
                                              child: SizedBox(
                                        width: userWidth / 2,
                                        child: Text(data,
                                            style:
                                                const TextStyle(fontSize: 25)),
                                      )));
                                    }
                                  }
                                  return const Text("No data");
                                })))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Position:  ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 24, 166, 209))),
                        SizedBox(
                            child: FutureBuilder(
                                future: getPositins(),
                                builder: ((context, snapshot) {
                                  // Checking if future is resolved or not
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      // Extracting data from snapshot object
                                      final data = snapshot.data as String;
                                      return Center(
                                          child: SingleChildScrollView(
                                              child: SizedBox(
                                        width: userWidth / 2,
                                        child: Text(
                                          data,
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                      )));
                                    }
                                  }
                                  return const Text("No data");
                                })))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Toy:  ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 24, 166, 209))),
                        SizedBox(
                            child: FutureBuilder(
                                future: getToy(),
                                builder: ((context, snapshot) {
                                  // Checking if future is resolved or not
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      // Extracting data from snapshot object
                                      final data = snapshot.data as String;
                                      return Center(
                                          child: SingleChildScrollView(
                                              child: SizedBox(
                                        width: userWidth / 2,
                                        child: Text(
                                          data,
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                      )));
                                    }
                                  }
                                  return const Text("No data");
                                })))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Rule:  ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 24, 166, 209))),
                        SizedBox(
                            child: FutureBuilder(
                                future: getRule(),
                                builder: ((context, snapshot) {
                                  // Checking if future is resolved or not
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      // Extracting data from snapshot object
                                      final data = snapshot.data as String;
                                      return Center(
                                          child: SingleChildScrollView(
                                              child: SizedBox(
                                        width: userWidth / 2,
                                        child: Text(
                                          data,
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                      )));
                                    }
                                  }
                                  return const Text("No data");
                                })))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: userWidth / 3,
                            child: const Text("Regulation:  ",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 24, 166, 209)))),
                        SizedBox(
                            width: userWidth / 2,
                            height: userHeight / 5,
                            child: FutureBuilder(
                                future: getRegulation(),
                                builder: ((context, snapshot) {
                                  // Checking if future is resolved or not
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      // Extracting data from snapshot object
                                      final data = snapshot.data as String;
                                      return Center(
                                          child: SingleChildScrollView(
                                              child: SizedBox(
                                        width: userWidth / 2,
                                        child: Text(
                                          data,
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                      )));
                                    }
                                  }
                                  return const Text("No data");
                                })))
                      ],
                    ),
                  ],
                )),
              )),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
              ),
              body: Center(
                  child: TextButton(
                      onPressed: () {
                        routeToPass = 1;
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return MyPasswordPage(storage: CounterStorage());
                        }));
                      },
                      child: const Text("Change Password"))),
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: Scaffold(
            appBar: AppBar(
              toolbarHeight: userHeight / 12,
              title: Row(children: [
                SizedBox(
                    child: FloatingActionButton(
                  heroTag: "log",
                  onPressed: () {
                    var dt = DateTime.now();
                    String _add = dt.day.toString() +
                        "." +
                        dt.month.toString() +
                        "." +
                        dt.year.toString() +
                        "  " +
                        dt.hour.toString() +
                        ":" +
                        dt.minute.toString() +
                        "\n\n" +
                        _logContent;
                    LogStorage().writeCounter(_add);
                    _logContent = _add;
                    setState(() {});
                  },
                  child: const Icon(Icons.av_timer),
                )),
                Text("Cum log")
              ]),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: userHeight / 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: Text(_logContent,
                              style: Theme.of(context).textTheme.headline5)),
                    ),
                    SizedBox(
                      height: userHeight / 10,
                    )
                  ]),
            ),
          ))
        ],
      )),
    );
  }
}

class MySetting extends StatefulWidget {
  const MySetting({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MySetting> createState() => _MySetting();
}

class _MySetting extends State<MySetting> {
  Future<String> loadAsset() async {
    String stringtolist = await rootBundle.loadString("assets/punishment");
    List listToSting = stringtolist.split("\n");
    return listToSting.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: FutureBuilder(
        future: loadAsset(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If we got an error
            if (snapshot.hasError) {
              return const Center(child: Text("ERROR"));
            }
            if (snapshot.hasData) {
              // Extracting data from snapshot object
              final data = snapshot.data as String;
              List dataList = data.split(", ,");

              return Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ListView.separated(
                      itemCount: dataList[0].length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: const Icon(Icons.circle), // Text("$index"),
                          title: Text(dataList[index]),
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ))
                  ],
                ),
              );
            }
          }
          return const Text("No data");
        }),
      )),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, answer, quest) {
  return AlertDialog(
    title: Text(quest),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(answer)],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
