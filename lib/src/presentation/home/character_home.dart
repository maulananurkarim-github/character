import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/app_provider.dart';
import '../widgets/app_elevated_button.dart';
import 'widgets/character_data.dart';

class CharacterHome extends HookConsumerWidget {
  const CharacterHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(idRandomProvider);
    final data = ref.watch(characterProvider(id));

    void onGenerate() {
      int randomminmax = 1 + Random().nextInt(300 - 1);
      ref.read(idRandomProvider.notifier).state = randomminmax;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick And Morty Generator"),
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(idRandomProvider),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(73.0),
        child: Column(
          children: [
            const Spacer(),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 38.0,
                  vertical: 19.0,
                ),
                child: data.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Text('Error: $err'),
                  data: (character) => CharacterData(character: character),
                ),
              ),
            ),
            const Spacer(),
            AppElevatedButton(
              title: "Generate".toUpperCase(),
              onPressed: () => onGenerate(),
            ),
          ],
        ),
      ),
    );
  }
}
