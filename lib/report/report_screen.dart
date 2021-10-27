import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mirror/constants/colors.dart';
import 'package:mirror/home/home_screen.dart';
import 'package:mirror/models/report.dart';
import 'package:mirror/shared/widgets/mirror.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  final _facialEmoji = ['🙂', '😄', '🥳'];
  final _gestureEmoji = ['🤏', '🙌', '🤘'];
  final _loudnessEmoji = ['🔈', '🔉', '🔊'];

  Future<Results> fetchData() async {
    final json = await rootBundle.loadString('assets/output.json');
    return Results.fromRawJson(json);
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
                  width: 42,
                  decoration: BoxDecoration(
                    color: isSelected ? MColor.skyBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    emoji,
                    style: TextStyle(
                      fontSize: isSelected ? 32 : 24,
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

  Widget _getResultView(Results result) {
    return Container(
      child: _getEmojiCard(
        _facialEmoji,
        result.expression - 1,
        'Facial Expressions',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MirrorAppBar(title: 'Report'),
            FutureBuilder<Results>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _getResultView(snapshot.data!);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
