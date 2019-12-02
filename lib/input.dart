import 'package:flutter/material.dart';

typedef ValidateCallback = Function(String);

class Input extends StatefulWidget {
  final ValidateCallback onValidate;

  Input({@required this.onValidate});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController _controller = new TextEditingController();

  void _handleSubmitted(String text) {
    String newTodo = text.trim();
    if (newTodo.length > 3) {
      widget.onValidate(newTodo);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double mediaPaddingBot = MediaQuery.of(context).padding.bottom;

    return new Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.only(
          bottom: mediaPaddingBot > 1.0 ? mediaPaddingBot : 20.0, top: 10.0),
      child: new TextField(
        maxLines: 1,
        controller: _controller,
        textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 28.0,
          fontFamily: 'Marvel',
          fontWeight: FontWeight.w300,
        ),
        onSubmitted: _handleSubmitted,
        decoration: new InputDecoration(
          focusedBorder: new UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          hintText: 'Add a new todo',
          hintStyle: TextStyle(
            fontSize: 28.0,
            color: Colors.black.withOpacity(0.2),
            fontFamily: 'Marvel',
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
