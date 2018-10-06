import 'package:flutter/material.dart';

class FancyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 150.0,
          child: Align(
            alignment: Alignment(-2.0, -10.0),
            child: Container(
              width: 200.0,
              height: 180.0,
              decoration: ShapeDecoration(
                  color: Color.fromARGB(220, 255, 137, 10),
                  shape: CircleBorder()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Movies",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
        Align(
            alignment: Alignment(0.0, 2.0),
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 70.0),
              // padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      decoration:
                          InputDecoration.collapsed(hintText: "Search for movies..."),
                    ),
                  )
                ],
              ),
              decoration: ShapeDecoration(
                  shadows: [BoxShadow(
                    color: Colors.black.withAlpha(100),
                    offset: Offset(1.0, 6.0),
                    blurRadius: 5.0,
                  )],
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
              // color: Colors.white,
            ))
      ],
    );
  }
}
