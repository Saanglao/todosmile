import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:todosmile/logo.dart';
import 'package:todosmile/todo_view.dart';

// void main() {
//   SystemChrome.setEnabledSystemUIOverlays([]);

// }

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO:DO',
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Logo(),      // Height = 30%
            // TodoView will get both TodoList and Input classes
            new TodoView(),  // Height = 70%
          ],
        ),
      ),
    );
  }
}
