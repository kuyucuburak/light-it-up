import 'package:flame/components.dart';

class AppConstants {
  static const bool debugMode = true;
  static const bool debugModeStaticSprites = false;
  static const Anchor anchor = Anchor.center;

  static const double mostTopLeftTileX = 250;
  static const double mostTopLeftTileY = 250;
  static const double tileSize = 100; // This should be divisible by wallSize to build the map correctly.
  static const double wallSize = 20;

  static const int tilePriority = 0;
  static const int wallPriority = 0;
}
