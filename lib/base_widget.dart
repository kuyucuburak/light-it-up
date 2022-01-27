import 'package:flame/components.dart';
import 'package:water_to_trees/game/puzzle_game.dart';

abstract class BaseWidget extends SpriteComponent with HasGameRef<PuzzleGame> {
  Future<void> load();

  void setDimensions(Vector2 gameSize);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await load();
    setDimensions(gameRef.size);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    setDimensions(gameSize);
  }
}
