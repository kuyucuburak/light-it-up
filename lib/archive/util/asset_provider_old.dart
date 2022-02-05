import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AssetProviderOld {
  static const imageAssets = [
    'background.jpg',
    'player.png',
  ];

  static Future<Sprite> background(FlameGame game) async => await game.loadSprite('background.jpg');

  static Future<Sprite> player(FlameGame game) async => await game.loadSprite('player.png');
}
