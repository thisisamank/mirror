import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mirror/constants/colors.dart';
import 'package:mirror/models/user.dart';
import 'package:mirror/route/router.gr.dart';
import 'package:mirror/shared/widgets/mirror.dart';
import 'package:provider/provider.dart';

class UserDialog extends StatelessWidget {
  final TextEditingController _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final genders = context.watch<GenderProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MirrorText(
          text: 'Gender',
          size: 22,
        ),
        const SizedBox(height: 8),
        Consumer(
          builder: (context, _, __) => Row(
            children: [
              ...genders.genders
                  .map<Widget>((gender) => GestureDetector(
                        onTap: () {
                          genders.changeGender(gender);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: MirrorPill(
                            text: gender.gender
                                .toString()
                                .replaceAll('GenderClassification.', ''),
                            isSelected: gender.isSelected,
                          ),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const MirrorText(
              text: "Age",
              size: 20,
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 100,
              child: TextField(
                cursorColor: MColor.lightOrange,
                cursorHeight: 24,
                style: const TextStyle(
                  color: MColor.lightOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MColor.background,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: _ageController,
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              AutoRouter.of(context).push(const HomeScreenRoute());
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 8,
            ),
            shape: const StadiumBorder(),
            color: MColor.skyBlue,
            child: Text(
              "Next",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MirrorPill extends StatelessWidget {
  const MirrorPill({
    required this.text,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          color: isSelected ? MColor.blue : MColor.grey,
          borderRadius: BorderRadius.circular(200)),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
