import 'package:flutter/material.dart';
import '../../constants/strings.dart';

import '../../constants/colors.dart';
import '../../data/model/character_model.dart';

class CharItem extends StatelessWidget {
  final CharactersModel characters;
  const CharItem({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsConstants.grey,
      ),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
          Navigator.pushNamed(context, characterDetailsScreen,
              arguments: characters);
        },
        child: GridTile(
          footer: Hero(
            tag: characters.id.toString(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                characters.name!,
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: ColorsConstants.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: ColorsConstants.grey,
            child: characters.image != null
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/images/loading.gif',
                    image: characters.image!,
                    fit: BoxFit.cover,
                  )
                : Image.asset("assets/images/person.png"),
          ),
        ),
      ),
    );
  }
}
