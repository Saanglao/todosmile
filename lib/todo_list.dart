import 'package:flutter/material.dart';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

import 'package:todosmile/todo.dart';

// Defined the type of the onTouch function which we will received here
typedef TouchCallback = void Function(Todo, bool);
typedef SwipeCallback = void Function(int);

class TodoList extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  final List<Todo> todos;
  final TouchCallback onTouch;
  final SwipeCallback onSwipe;


  TodoList({@required this.todos, this.onTouch, this.onSwipe});

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    // We use InkWell Widget in order to get the onTap method
    return new Dismissible(
      key: new Key(todo.text),
      direction: DismissDirection.horizontal,
      onDismissed: (DismissDirection direction) {
        onSwipe(index);
      },
      child: new InkWell(
        child: new Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
          child: new Text(
            todo.text,
            style: new TextStyle(
              fontSize: 28.0,
              fontFamily: 'Marvel',
              fontWeight: FontWeight.w200,
              // The decoration will apply the line-through style if the todo is done
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          // Update will be sent back on this event
          onTouch(todo, !todo.isDone);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new SizedBox(
        // This Widget will make the start and end of scroll fading away like effect
        child: new FadingEdgeScrollView.fromScrollView(
          child: new ListView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemBuilder: _buildItem,
            itemCount: todos.length,
          ),
        ),
      ),
    );
  }
}
