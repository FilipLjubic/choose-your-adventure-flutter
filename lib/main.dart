import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

TextStyle style = TextStyle(
  color: Colors.white,
  fontSize: 24.0,
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Choose your adventure",
      home: StoryPage(),
    ),
  );
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 10,
                child: Center(
                  child: Text(
                    "Here comes the text",
                    style: style,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: AnimatedButton(
                    child: Text("Test", style: style),
                    onPressed: () => print("hi"),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Center(
                  child: AnimatedButton(
                    color: Colors.green,
                    child: Text("Test", style: style),
                    onPressed: () => print("hi"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
