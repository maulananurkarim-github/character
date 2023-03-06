import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/character.dart';

final idRandomProvider = StateProvider<int>((ref) => 1);

final characterProvider = FutureProvider.family<Character, int>(
  (ref, int id) async {
    final dio = Dio();
    final response =
        await dio.get("https://rickandmortyapi.com/api/character/$id");
    final character = characterFromJson(jsonEncode(response.data));
    return character;
  },
);
