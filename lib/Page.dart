import 'package:flutter/material.dart';
import 'info.dart';
class InfoPage extends StatefulWidget {
  int? index;
  InfoPage(this.index);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Info.name[widget.index!],
          style: TextStyle(
              color: Info.color[widget.index!],
              fontSize: Info.size[widget.index!]),
        ),
        elevation: 0,
        backgroundColor: Info.color[widget.index!],
        centerTitle: true,
        actions: [
          Text(Info.club[widget.index!],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Info.size[widget.index!]))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    elevation: 0,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Icon(Icons.arrow_back,
                            color: Info.color[widget.index!],
                            size: Info.size[widget.index!]),
                      )
                    ],
                    title: Text(
                      Info.name[widget.index!],
                      style: TextStyle(
                          color: Info.color[widget.index!],
                          fontSize: Info.size[widget.index!]),
                    ),
                    content: Text(
                      Info.information[widget.index!],
                      style: TextStyle(
                          color: Info.color[widget.index!],
                          fontSize: Info.size[widget.index!]),
                    ),
                  );
                });
          });
        },
        child: Center(
          child: Icon(Icons.info,
              size: Info.size[widget.index!], color: Info.color[widget.index!]),
        ),
      ),
    );
  }
}