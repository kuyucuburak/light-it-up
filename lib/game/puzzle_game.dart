import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:light_it_up/component/sprite/background.dart';
import 'package:light_it_up/game/game_controller.dart';
import 'package:light_it_up/util/asset_provider.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final GameController gameController = GameController(this);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.loadAll(AssetProvider.imageAssets);
    await FlameAudio.audioCache.loadAll(AssetProvider.soundAssets);
    await FlameAudio.bgm.loadAll(AssetProvider.backgroundSoundAssets);

    FlameAudio.bgm.initialize();
    AssetProvider.bgmMenu();
    add(await _background(this));
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    if (children.isNotEmpty) {
      children.firstWhere((value) => value is Background).onGameResize(canvasSize);
    }
    gameController.resize(canvasSize);
  }

  Future<Component> _background(PuzzleGame gameRef) async {
    Vector2 size = gameRef.size;
    return Background.black(
      position: Vector2(size.x / 2, size.y / 2),
      size: size,
    );
  }
}
