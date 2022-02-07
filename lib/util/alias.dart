import 'package:flame/components.dart';
import 'package:water_to_trees/game/puzzle_game.dart';

typedef SpriteAnimationLoader = Future<SpriteAnimation> Function(PuzzleGame gameRef);
typedef SpriteLoader = Future<Sprite> Function(PuzzleGame gameRef);
