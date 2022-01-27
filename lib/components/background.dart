import 'package:flame/components.dart';
import 'package:water_to_trees/base_widget.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Background extends BaseWidget {
  @override
  Future<void> load() async {
    sprite = await AssetProvider.background(gameRef);
    anchor = Anchor.center;
  }

  @override
  void setDimensions(Vector2 gameSize) {
    position = gameSize / 2;
    width = gameSize.x;
    height = gameSize.y;
  }
}
