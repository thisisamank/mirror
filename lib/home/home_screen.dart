import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror/constants/colors.dart';
import 'package:mirror/route/router.gr.dart';
import 'package:mirror/shared/widgets/mirror.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _getFloatingButton() {
    return Container(
      width: 150,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MColor.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call,
              color: Colors.white,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: VerticalDivider(
              color: Colors.white,
              thickness: 2,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _getCard(
    String title,
    String description,
    Icon icon,
    Color bgColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Column(
            children: [
              Container(
                width: 200,
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 200,
                child: Text(
                  description,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 24,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _getFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 8),
              MirrorAppBar(title: 'Mirror'),
              SizedBox(height: 16),
              SvgPicture.asset('assets/banner.svg'),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _getCard(
                  "See your previous report",
                  "Analyse your previous performances via reports.",
                  Icon(
                    Icons.note_add_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  MColor.pink,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(ReportScreenRoute());
                  },
                  child: _getCard(
                    "Start your new Video",
                    "Begin your new video analysis via uploading a video or by camera.",
                    Icon(
                      Icons.video_call_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    MColor.lightOrange,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MirrorAppBar extends StatelessWidget {
  const MirrorAppBar({required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 12),
        MirrorText(
          size: 40,
          text: title,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(16),
          child: Text('     '),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: MColor.pink,
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }
}
