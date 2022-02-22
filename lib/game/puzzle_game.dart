import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:light_it_up/component/sprite/background.dart';
import 'package:light_it_up/game/game_controller.dart';
import 'package:light_it_up/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final GameController gameController;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    gameController = GameController(this);
    add(await background(this));
  }

  Future<Component> background(PuzzleGame gameRef) async {
    Vector2 size = gameRef.size;
    return Background.black(
      position: Vector2(size.x / 2, size.y / 2),
      size: size,
    );
  }
}
