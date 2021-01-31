import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaracteristicWidget extends StatelessWidget {
  final String svgImage;
  final String text;

  const CaracteristicWidget({Key key, this.svgImage, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          svgImage,
          color: kColorWhite.withOpacity(0.6),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2.copyWith(
                color: kColorWhite,
              ),
        ),
      ],
    );
  }
}
