import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror/constants/colors.dart';

class MirrorText extends StatelessWidget {
  final double size;
  final String text;
  const MirrorText({
    this.size = 18,
    this.text = 'Mirror',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.spartan(
        fontSize: size,
        color: MColor.blue,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
