import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mirror/constants/colors.dart';
import 'package:mirror/home/home_screen.dart';
import 'package:mirror/models/report.dart';
import 'package:mirror/shared/widgets/mirror.dart';
import 'package:mirror/splash/widgets/dialog.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  final _facialEmoji = ['🙂', '😄', '🥳'];
  final _gestureEmoji = ['🤏', '🙌', '🤘'];
  final _loudnessEmoji = ['🔈', '🔉', '🔊'];

  Future<Results> fetchData() async {
    final json = await rootBundle.loadString('assets/output.json');
    return Future.delayed(
        Duration(seconds: 10), () => Results.fromRawJson(json));
  }

  _getEmojiCard(List<String> emojis, int selected, String title) {
    int i = 0;
    return Container(
      padding: EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        color: MColor.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          MirrorText(text: title, size: 20),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...emojis.map<Widget>((emoji) {
                final isSelected = i == selected;
                i++;
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isSelected ? MColor.skyBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: TextStyle(
                        fontSize: isSelected ? 32 : 24,
                      ),
                    ),
                  ),
                );
              })
            ],
          )
        ],
      ),
    );
  }

  _getCard(List<String> words, String title) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        color: MColor.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          MirrorText(text: title, size: 20),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              ...words.map((e) => MirrorPill(text: e, isSelected: true))
            ],
          )
        ],
      ),
    );
  }

  Widget _getResultView(Results result) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: _getEmojiCard(
              _facialEmoji,
              result.expression - 1,
              'Facial Expressions',
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: _getEmojiCard(
              _gestureEmoji,
              result.geatures - 1,
              'Gestures',
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: _getEmojiCard(
              _loudnessEmoji,
              result.loudness - 1,
              'Loudness',
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: _getCard(
              result.misspelledWords,
              'Misspelled Words',
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: _getCard(
              result.frequentlyUsed,
              'Frequently used Words',
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MirrorAppBar(title: 'Report'),
              FutureBuilder<Results>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _getResultView(snapshot.data!);
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                        MirrorText(text: "Video uploading and processing...")
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
