import 'package:flutter/material.dart';

import 'package:todosmile/todo.dart';
import 'package:todosmile/todo_list.dart';
import 'package:todosmile/input.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List<Todo> todos = [
    new Todo(text: "Dinner at John's", isDone: false),
    new Todo(text: "Mom's birthday soon", isDone: false),
    new Todo(text: "Call Jerry asap!", isDone: false),
    new Todo(text: "Meeting at Dublin on Saturday", isDone: true),
    new Todo(text: "Feed the dog", isDone: false),

    new Todo(text: "         ", isDone: true),
    new Todo(text: "www.littlescrawl.com", isDone: false),
    new Todo(text: "Thank you", isDone: false),
    new Todo(text: "         ", isDone: true),
  ];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo(String text) {
    setState(() {
      todos.add(new Todo(text: text));
    });
  }

  _removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TodoList(
            todos: todos,
            onTouch: _toggleTodo,
            onSwipe: _removeTodo,
          ),
          new Input(
            onValidate: _addTodo,
          ),
        ],
      ),
    );
  }
}
