import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:water_to_trees/components/background.dart';
import 'package:water_to_trees/components/player.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class PuzzleGame extends FlameGame with PanDetector {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    player = Player();

    add(Background());
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
  }
}
