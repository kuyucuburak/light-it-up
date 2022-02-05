import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';

class Selector extends SpriteComponent {
  bool show = true;

  Selector(double s, Image image) {
    sprite = Sprite(image, srcSize: Vector2.all(32.0));
    size = Vector2.all(s);
  }

  @override
  void render(Canvas canvas) {
    if (!show) {
      return;
    }

    super.render(canvas);
  }
}
