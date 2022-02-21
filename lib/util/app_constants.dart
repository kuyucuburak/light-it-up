import 'package:flame/components.dart';

class AppConstants {
  static const bool debugMode = false;
  static const bool debugModeStaticSprites = false;

  static const double mostTopLeftTileX = 200;
  static const double mostTopLeftTileY = 200;

  static const double staticAnimationSize = 120;
  static const double wireSize = 120; // This should be divisible by wallSize to build the map correctly.
  static const double wallSize = 40;

  static final Vector2 electricityHorizontalSize = Vector2(wireSize * 0.2, wireSize * 0.75);
  static final Vector2 electricityVerticalSize = Vector2(wireSize * 0.75, wireSize * 0.2);

  static const int staticAnimationPriority = 4;
  static const int dynamicAnimationPriority = 3;
  static const int wallPriority = 2;
  static const int wirePriority = 1;
  static const int backgroundPriority = 0;

  static const Anchor anchor = Anchor.center;
}
