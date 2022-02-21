import 'package:flame/components.dart';
import 'package:light_it_up/game/puzzle_game.dart';

typedef SpriteAnimationLoader = Future<SpriteAnimation> Function(PuzzleGame gameRef);
typedef SpriteLoader = Future<Sprite> Function(PuzzleGame gameRef);
