import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/model/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharactersModel characters;
  const CharacterDetailsScreen({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const BackButtonIcon(),
              color: ColorsConstants.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: ColorsConstants.grey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                characters.name!,
                style: const TextStyle(color: ColorsConstants.white),
              ),
              background: Hero(
                tag: characters.id.toString(),
                child: Image.network(
                  characters.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      characterInfo("Status : ", characters.status!),
                      buildDivider(260),
                      characterInfo("Species : ", characters.species!),
                      buildDivider(260),
                      characterInfo("Gender : ", characters.gender!),
                      buildDivider(260),
                      characterInfo("Origin : ", characters.origin!.name!),
                      buildDivider(260),
                      characterInfo("Location : ", characters.location!.name!),
                      buildDivider(250),
                      characterInfo("Created : ", characters.created!),
                      buildDivider(250),
                      characterInfo(
                          "Episodes :", characters.episode!.length.toString()),
                      buildDivider(250),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                animatedText(characters.name!),
                const SizedBox(height: 400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: ColorsConstants.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: ColorsConstants.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: ColorsConstants.yellow,
      thickness: 1,
      height: 20,
      indent: 0,
      endIndent: endIndent,
    );
  }

  Widget animatedText(String text) {
    return Center(
      child: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 20.0,
            color: ColorsConstants.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 7.0,
                color: ColorsConstants.yellow,
                offset: Offset(0, 0),
              ),
            ]),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            WavyAnimatedText(
              text,
              textStyle: const TextStyle(
                color: ColorsConstants.yellow,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {},
        ),
      ),
    );
  }
}
