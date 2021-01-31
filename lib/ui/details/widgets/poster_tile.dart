import 'package:flutter/material.dart';

class PosterTile extends StatelessWidget {
  final String assetImage;

  const PosterTile({Key key, @required this.assetImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 230,
      child: Image.asset(assetImage, fit: BoxFit.cover,),
    );
  }
}
