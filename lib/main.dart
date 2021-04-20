import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: CounterScreen(),
    ),
  );
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void _actionPressedButtom(String operation) {
    setState(() {
      if (operation == "sum") {
        counter++;
      } else {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Counter",
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "You have pressed this buttom this many times:",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Center(
            child: Text(
              "$counter",
              style: TextStyle(
                fontSize: 34,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          EditButton(() {
            _actionPressedButtom("sub");
          }, Icon(Icons.remove)),
          SizedBox(
            width: 5,
          ),
          EditButton(() {
            _actionPressedButtom("sum");
          }, Icon(Icons.add))
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  final Function function;
  final Widget icon;

  EditButton(this.function, this.icon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: icon,
    );
  }
}
