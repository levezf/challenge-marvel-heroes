import 'package:challenge_marvel_heroes/ui/details/widgets/scale_bar_painter.dart';
import 'package:flutter/material.dart';

class AbilityWidget extends StatelessWidget {
  final double percent;
  final String title;

  const AbilityWidget({Key key, @required this.percent, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(
         width: 120,
         child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.white.withOpacity(0.75),
                  ),
            ),
       ),
        Expanded(
          child: CustomPaint(
            painter: ScaleBarPainter(
              scale: 100.0,
              percentFilled: percent,
            ),
          ),
        ),
      ],
    );
  }
}
