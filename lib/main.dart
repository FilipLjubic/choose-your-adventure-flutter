import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context,
        width: 1080.0, height: 2300.0, allowFontScaling: true);

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      padding: EdgeInsets.all(20.w),
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
                  children: [
                    Expanded(
                      flex: 10,
                      child: Center(
                        child: BorderedTextWidget(
                            text: _storyBrain.text, size: 70),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimatedButton(
                          width: 900.w,
                          color: Colors.blueGrey,
                          child: BorderedTextWidget(
                              text: _storyBrain.choice1, size: 45),
                          onPressed: () =>
                              setState(() => _storyBrain.chooseNext(1)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimatedButton(
                          width: 900.w,
                          color: Colors.grey,
                          child: BorderedTextWidget(
                              text: _storyBrain.choice2, size: 45),
                          onPressed: () =>
                              setState(() => _storyBrain.chooseNext(2)),
                        ),
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Center(
                        child: BorderedTextWidget(
                            text: _storyBrain.text, size: 70),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimatedButton(
                          width: 900.w,
                          color: Colors.blueGrey,
                          child: BorderedTextWidget(
                              text: _storyBrain.choice1, size: 45),
                          onPressed: () =>
                              setState(() => _storyBrain.chooseNext(1)),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.h),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: AnimatedButton(
                          width: 900.w,
                          color: Colors.grey,
                          child: BorderedTextWidget(
                              text: _storyBrain.choice2, size: 45),
                          onPressed: () =>
                              setState(() => _storyBrain.chooseNext(2)),
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

class BorderedTextWidget extends StatelessWidget {
  final String text;
  final int size;

  const BorderedTextWidget({Key key, this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w),
      child: BorderedText(
        strokeWidth: 10.w,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(size),
          ),
        ),
      ),
    );
  }
}
