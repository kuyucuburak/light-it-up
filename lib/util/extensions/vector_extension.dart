import 'package:flame/components.dart';
import 'package:light_it_up/component/sprite/wire.dart';
import 'package:light_it_up/util/app_constants.dart';

extension WireExtensions on Wire {
  Vector2 get electricityLeftPos => Vector2(x - AppConstants.wireSize * 0.4, y);

  Vector2 get electricityRightPos => Vector2(x + AppConstants.wireSize * 0.4, y);

  Vector2 get electricityBottomPos => Vector2(x, y + AppConstants.wireSize * 0.4);

  Vector2 get electricityTopPos => Vector2(x, y - AppConstants.wireSize * 0.4);
}
