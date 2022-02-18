import 'package:flame/components.dart';

class AppConstants {
  static const bool debugMode = false;
  static const bool debugModeStaticSprites = false;

  static const double mostTopLeftTileX = 200;
  static const double mostTopLeftTileY = 200;

  static const double animationSize = 100;
  static const double wireSize = 100; // This should be divisible by wallSize to build the map correctly.
  static const double wallSize = 50;

  static const int animationPriority = 3;
  static const int wirePriority = 2;
  static const int wallPriority = 1;
  static const int backgroundPriority = 0;

  static final Vector2 electricityHorizontalSize = Vector2(30, 120);
  static final Vector2 electricityVerticalSize = Vector2(120, 30);

  static const Anchor anchor = Anchor.center;
}
