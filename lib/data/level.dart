import 'package:dart_extensions/dart_extensions.dart';

class Level {
  late final List<List<String>> tileMap;
  final List<int> generatorIndexList;
  final List<int> bulbIndexList;

  Level({
    required List<List<String>> tileMapUnShuffledList,
    required this.generatorIndexList,
    required this.bulbIndexList,
  }) {
    List<String> shuffledList = tileMapUnShuffledList.expand((e) => e).toList();
    shuffledList.shuffle();
    tileMap = shuffledList.chunks(tileMapUnShuffledList[0].length).toList();
  }
}
