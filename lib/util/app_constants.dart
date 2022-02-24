import 'package:flame/components.dart';

class AppConstants {
  static const bool debugMode = false;
  static const bool debugModeStaticSprites = false;

  static const int staticAnimationPriority = 4;
  static const int dynamicAnimationPriority = 3;
  static const int wallPriority = 2;
  static const int wirePriority = 1;
  static const int backgroundPriority = 0;

  static const Anchor anchor = Anchor.center;
  static const int wallWireRatio = 3;

  static double mostTopLeftTileX = 200;
  static double mostTopLeftTileY = 200;
  static double wireMoveEffectDurationSec = 0.2;
  static double wireSize = 120;

  static double get staticAnimationSize => wireSize;

  static double get wallSize => wireSize / wallWireRatio;

  static Vector2 get electricityHorizontalSize => Vector2(wireSize * 0.2, wireSize * 0.75);

  static Vector2 get electricityVerticalSize => Vector2(wireSize * 0.75, wireSize * 0.2);
}
