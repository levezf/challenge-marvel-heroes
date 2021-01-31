import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:challenge_marvel_heroes/styles/gradients.dart';
import 'package:challenge_marvel_heroes/ui/details/page/details_page.dart';
import 'package:flutter/material.dart';

class ImageCharacterTile extends StatelessWidget {
  final Character character;

  const ImageCharacterTile({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.imagePath,
      child: Container(
        width: 140,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 20.0,
                offset: Offset(0, 20.0),
                color: kColorShadowPoster),
          ],
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              character.imagePath,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsPage(
                character: character,
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              gradient: kGradientDark,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.alterEgo,
                  style: Theme.of(context).textTheme.overline.copyWith(
                        color: kColorWhite.withOpacity(0.75),
                      ),
                ),
                Text(
                  character.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: kColorWhite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
