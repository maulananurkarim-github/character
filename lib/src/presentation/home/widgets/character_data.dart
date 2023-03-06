import 'package:flutter/material.dart';

import '../../../domain/character.dart';
import '../../core/utils/app_cached_image.dart';
import 'data_tile.dart';

class CharacterData extends StatelessWidget {
  const CharacterData({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 132.0,
          height: 132.0,
          child: AppCacheImage(imageUrl: character.image ?? ""),
        ),
        const SizedBox(height: 11.0),
        Text(
          character.name ?? "",
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 35.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DataTile(
              title: "Gender",
              content: character.gender ?? "",
            ),
            DataTile(
              title: "Location",
              content: character.location?.name ?? "",
            ),
          ],
        ),
      ],
    );
  }
}
