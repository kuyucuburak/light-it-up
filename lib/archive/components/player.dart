import 'package:flame/components.dart';
import 'package:water_to_trees/archive/base_widget.dart';
import 'package:water_to_trees/archive/util/asset_provider.dart';

class Player extends BaseWidget {
  @override
  Future<void> load() async {
    sprite = await AssetProvider.player(gameRef);
    anchor = Anchor.center;
    position = gameRef.size / 2;
  }

  @override
  void setDimensions(Vector2 gameSize) {
    width = 100;
    height = 150;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
