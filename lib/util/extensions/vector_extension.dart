import 'package:flame/components.dart';
import 'package:light_it_up/component/sprite/wire.dart';

extension WireExtensions on Wire {
  Vector2 get addElectricityToRight => Vector2(x + 50, y);
  Vector2 get addElectricityToLeft => Vector2(x - 50, y);

  Vector2 get addElectricityToBottom => Vector2(x, y + 50);
  Vector2 get addElectricityToTop => Vector2(x, y - 50);
}
