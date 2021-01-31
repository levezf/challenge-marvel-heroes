import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:challenge_marvel_heroes/styles/colors.dart';
import 'package:challenge_marvel_heroes/ui/home/widgets/image_character_tile.dart';
import 'package:flutter/material.dart';

class SectionCharecter extends StatelessWidget {
  final String title;
  final List<Character> characters;

  const SectionCharecter(
      {Key key, @required this.title, @required this.characters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: kColorRed,
                      ),
                ),
              ),
              Text(
                'Ver tudo',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: kColorGrey,
                    ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          color: Colors.transparent,
          height: 230,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final child =
                  ImageCharacterTile(character: characters.elementAt(index));
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: child,
                );
              }

              return child;
            },
            itemCount: characters != null ? characters.length : 0,
            separatorBuilder: (context, index) => const SizedBox(
              width: 16.0,
            ),
          ),
        ),
        const SizedBox(
          height: 48.0,
        ),
      ],
    );
  }
}
