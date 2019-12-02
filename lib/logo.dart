import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Because there is no appBar, here is how we get the extra padding
    final double mediaPaddingTop = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: mediaPaddingTop),
      // We want the height to fill about 30% of the screen
      height: MediaQuery.of(context).size.height * 0.30,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'TO:DO',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 60.0,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700
            ),
          ),
          new Text(
            'Do it with a smile!',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontFamily: 'Marvel',
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}

// class Logo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Image(
//             image: AssetImage('logo_todo.gif'),
//             fit: BoxFit.cover,
//           ),
//         ));
//   }
// }