import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;
  final double endIndent;

  const CharacterInfo(
      {super.key,
      required this.title,
      required this.value,
      required this.endIndent});

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(color: MyColors.myWhite, fontSize: 16),
        ),
      ]),
    );
  }

  Widget characterDivider(double endIndent) {
    return Divider(
      height: 30,
      color: MyColors.myViolet,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        characterInfo(title, value),
        characterDivider(endIndent),
      ],
    );
  }
}
