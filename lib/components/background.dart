import 'package:flame/components.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Background extends SpriteComponent {
  final PuzzleGame _puzzleGame;

  Background(this._puzzleGame);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await AssetProvider.background(_puzzleGame);

    position = _puzzleGame.size / 2;
    width = _puzzleGame.size.x;
    height = _puzzleGame.size.y;
    anchor = Anchor.center;
  }
}
