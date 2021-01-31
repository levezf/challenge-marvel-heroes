import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCircle extends StatelessWidget {
  final String asset;
  final LinearGradient gradient;

  const CategoryCircle({
    Key key,
    this.asset,
    @required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: kColorShadowCategorie,
            blurRadius: 12,
            offset: Offset(0, 12.0),
          )
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          asset,
          color: kColorWhite,
        ),
      ),
    );
  }
}
