import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:create_your_adventure/utils/story_brain.dart';

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
  StoryBrain _storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: isPortrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Center(
                        child: BorderedTextWidget(
                            text: _storyBrain.text, size: 30.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimatedButton(
                          width: MediaQuery.of(context).size.width - 50.0,
                          color: Colors.blueGrey,
                          child: BorderedTextWidget(
                            text: _storyBrain.choice1,
                            size: 20.0,
                          ),
                          onPressed: () =>
                              setState(() => _storyBrain.chooseNext(1)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimatedButton(
                          width: MediaQuery.of(context).size.width - 50.0,
                          color: Colors.grey,
                          child: BorderedTextWidget(
                            text: _storyBrain.choice2,
                            size: 20.0,
                          ),
                          onPressed: () =>
                              setState(() => _storyBrain.chooseNext(2)),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: [
                    Center(
                      child: BorderedTextWidget(
                          text: _storyBrain.text, size: 30.0),
                    ),
                    const SizedBox(height: 50.0),
                    Center(
                      child: AnimatedButton(
                        width: MediaQuery.of(context).size.width - 80.0,
                        color: Colors.blueGrey,
                        child: BorderedTextWidget(
                          text: _storyBrain.choice1,
                          size: 20.0,
                        ),
                        onPressed: () =>
                            setState(() => _storyBrain.chooseNext(1)),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: AnimatedButton(
                        width: MediaQuery.of(context).size.width - 80.0,
                        color: Colors.grey,
                        child: BorderedTextWidget(
                          text: _storyBrain.choice2,
                          size: 20.0,
                        ),
                        onPressed: () =>
                            setState(() => _storyBrain.chooseNext(2)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class BorderedTextWidget extends StatelessWidget {
  final String text;
  final double size;

  const BorderedTextWidget({Key key, this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: BorderedText(
        strokeWidth: 6.0,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
