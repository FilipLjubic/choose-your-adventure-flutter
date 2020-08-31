import 'package:create_your_adventure/utils/anime_button.dart';
import 'package:create_your_adventure/utils/bordered_text_widget.dart';
import 'package:flutter/material.dart';
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
                            text: _storyBrain.text, fontSize: 30.0),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimeButton(
                          color: Colors.blue,
                          text: _storyBrain.choice1,
                          onPressed: () => setState(
                            () => _storyBrain.chooseNext(1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: AnimeButton(
                        text: _storyBrain.choice2,
                        color: Colors.grey,
                        onPressed: () => setState(
                          () => _storyBrain.chooseNext(2),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: [
                    Center(
                      child: BorderedTextWidget(
                          text: _storyBrain.text, fontSize: 30.0),
                    ),
                    const SizedBox(height: 50.0),
                    Center(
                      child: AnimeButton(
                        text: _storyBrain.choice1,
                        color: Colors.blue,
                        onPressed: () => setState(
                          () => _storyBrain.chooseNext(1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: AnimeButton(
                        text: _storyBrain.choice2,
                        color: Colors.grey,
                        onPressed: () => setState(
                          () => _storyBrain.chooseNext(2),
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
