import 'package:flame/components.dart';
import 'package:water_to_trees/game/puzzle_game.dart';

class Player extends SpriteComponent with HasGameRef<PuzzleGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('player.png');

    position = gameRef.size / 2;
    width = 100;
    height = 150;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
