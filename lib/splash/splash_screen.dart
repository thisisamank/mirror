import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror/constants/colors.dart';
import 'package:mirror/shared/widgets/mirror.dart';
import 'package:mirror/splash/widgets/dialog.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                SvgPicture.asset('assets/blue_curve.svg'),
              ],
            ),
            const Spacer(),
            const MirrorText(size: 52),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: UserDialog(),
                      );
                    });
                // AutoRouter.of(context).push(const HomeScreenRoute());
              },
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 8,
              ),
              shape: const StadiumBorder(),
              color: MColor.lightOrange,
              child: Text(
                "Let's Begin",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                SvgPicture.asset('assets/pink_curve.svg'),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
