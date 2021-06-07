import 'package:divination/StoryBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

StoryBrain storyBrain = StoryBrain();

void main() => runApp(appFrame());

class appFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: DiviMain(),
        ),
      ),
    );
  }
}

class DiviMain extends StatefulWidget {
  @override
  _DiviMainState createState() => _DiviMainState();
}

class _DiviMainState extends State<DiviMain> {
  int storyNum = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage('images/bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        backgroundColor: Colors.black45),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black45),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black45),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
