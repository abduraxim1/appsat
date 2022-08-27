import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'info.dart';
import 'package:aaabbb/Homepage';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        List<String> path = settings.name.toString().split("/");
        if (path[1] == "InfoPage") {
          return MaterialPageRoute(
              builder: (context) => InfoPage(int.parse(path[2])));
        }
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: Info.name.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, "/InfoPage/$index");
                  });
                },
                child: Card(
                    color: Colors.yellow,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Info.color[index],
                          child: Text((index + 1).toString())),
                      title: Text(Info.name[index]),
                      subtitle: Text(Info.club[index]),
                      trailing: Icon(Icons.arrow_forward_ios),
                    )),
              );
            }));
  }
}

