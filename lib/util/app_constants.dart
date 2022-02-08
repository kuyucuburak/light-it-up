import 'package:flame/components.dart';

class AppConstants {
  static const bool debugMode = true;
  static const bool debugModeStaticSprites = false;

  static const double mostTopLeftTileX = 200;
  static const double mostTopLeftTileY = 200;
  static const double tileSize = 100; // This should be divisible by wallSize to build the map correctly.
  static const double wallSize = 25;

  static const int tilePriority = 0;
  static const int wallPriority = 0;
  static const Anchor anchor = Anchor.center;
}
