import "package:flutter/material.dart";

class LendingPage extends StatelessWidget { //stateless widget is basically static widgets which don't change overtime
 @override
  Widget build(BuildContext context) {
   return new Material( // a page or a piece of paper
     color: Colors.greenAccent,
     child: new InkWell(
       onTap: () => print("We Tap the page"),
       onDoubleTap: () => print("We double Tap the page"),
       child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           new Text("Lets Start", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
           new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)
         ],
       ),
     ),
   );
 }
}