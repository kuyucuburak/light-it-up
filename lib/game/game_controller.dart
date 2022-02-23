import 'package:dart_extensions/dart_extensions.dart';
import 'package:flame/components.dart';
import 'package:light_it_up/component/animation/animation_bulb.dart';
import 'package:light_it_up/component/animation/animation_electricity.dart';
import 'package:light_it_up/component/animation/animation_generator.dart';
import 'package:light_it_up/component/sprite/wire.dart';
import 'package:light_it_up/data/destination.dart';
import 'package:light_it_up/game/level_controller.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/congratulation_menu.dart';
import 'package:light_it_up/menu/hud.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';
import 'package:light_it_up/util/extensions/vector_extension.dart';

class GameController {
  final PuzzleGame gameRef;
  late final LevelController _levelController = LevelController();
  late List<Component> componentList = [];
  late List<Component> electricityAnimationList = [];
  int _electricityOnLength = 0;
  int _bulbLightOnLength = 0;

  GameController(this.gameRef);

  void updateGameMap() async {
    AssetProvider.soundCableMovement();

    electricityAnimationList.forEach((e) => e.removeFromParent());
    electricityAnimationList = [];

    List<List<Component?>> gameMap = List.generate(_levelController.wireRowCount, (i) => List.filled(_levelController.wireColumnCount + 2, null, growable: false), growable: false);
    List<Destination> bulbDestinations = List.empty(growable: true);

    componentList.forEach((element) {
      if (element is Wire) {
        int j = (element.position.x - AppConstants.mostTopLeftTileX) ~/ AppConstants.wireSize;
        int i = (element.position.y - AppConstants.mostTopLeftTileY) ~/ AppConstants.wireSize;
        gameMap[i][j + 1] = element;
      }

      if (element is AnimationGenerator) {
        int i = (element.position.y - AppConstants.mostTopLeftTileY) ~/ AppConstants.wireSize;
        gameMap[i][0] = element;
      }

      if (element is AnimationBulb) {
        int j = _levelController.wireColumnCount + 1;
        int i = (element.position.y - AppConstants.mostTopLeftTileY) ~/ AppConstants.wireSize;
        gameMap[i][j] = element;
        bulbDestinations.add(Destination(i, j));
      }
    });

    if (_isChapterCompleted(gameMap, bulbDestinations)) {
      await Future.delayed(const Duration(milliseconds: 500), () {});
      gameRef.overlays.remove(Hud.id);
      gameRef.overlays.add(CongratulationMenu.id);
      gameRef.pauseEngine();
      AssetProvider.soundBgmMenu();
    }

    playBulbSoundIfNecessary();
    playElectricitySoundIfNecessary();
  }

  void playElectricitySoundIfNecessary() {
    int electricityCount = electricityAnimationList.length;
    if (_electricityOnLength < electricityCount) {
      _electricityOnLength = electricityCount;
      AssetProvider.soundElectricity();
    } else if (_electricityOnLength > electricityCount) {
      _electricityOnLength = electricityCount;
    }
  }

  void playBulbSoundIfNecessary() {
    int lightOnBulbCount = componentList.count((element) => element is AnimationBulb && element.isLightOn);
    if (_bulbLightOnLength < lightOnBulbCount) {
      Future.delayed(const Duration(milliseconds: 300), () => AssetProvider.soundSwitchOnBulb());
    } else if (_bulbLightOnLength > lightOnBulbCount) {
      AssetProvider.soundSwitchOffBulb();
    }
    _bulbLightOnLength = lightOnBulbCount;
  }

  bool _isChapterCompleted(List<List<Component?>> gameMap, List<Destination> bulbDestinations) {
    bool allCompleted = true;
    for (final destination in bulbDestinations) {
      bool completed = false;
      for (int i = 0; i < _levelController.wireRowCount; i++) {
        if (gameMap[i][0] is AnimationGenerator && _hasRightAdjacentLeftEdge(gameMap, i, 1) && _checkElectricity(gameMap, destination, i, 1, List.empty(growable: true))) {
          completed = true;
          break;
        }
      }

      if (completed) {
        (gameMap[destination.x][destination.y] as AnimationBulb).turnOnTheLight();
      } else {
        (gameMap[destination.x][destination.y] as AnimationBulb).turnOffTheLight();
        allCompleted = false;
      }
    }
    return allCompleted;
  }

  bool _checkElectricity(List<List<Component?>> gameMap, Destination finalDestination, int i, int j, List<Destination> roadTaken) {
    if (i < 0 || j < 0 || i >= gameMap.length || j >= gameMap[0].length) return false;
    if (gameMap[i][j] == null) return false;
    if (gameMap[i][j] is AnimationGenerator) return true;

    Component element = gameMap[i][j]!;

    if (element is AnimationBulb && i == finalDestination.x && j == finalDestination.y) {
      return true;
    }

    bool left = false, right = false, top = false, bottom = false;
    if (element is Wire) {
      roadTaken.add(Destination(i, j));
      _addElectricityAnimation(element);

      if (element.hasRight && _hasRightAdjacentLeftEdge(gameMap, i, j + 1) && !_doesRoadContainDestination(i, j + 1, roadTaken)) {
        right = _checkElectricity(gameMap, finalDestination, i, j + 1, roadTaken);
      }
      if (element.hasLeft && _hasLeftAdjacentRightEdge(gameMap, i, j - 1) && !_doesRoadContainDestination(i, j - 1, roadTaken)) {
        left = _checkElectricity(gameMap, finalDestination, i, j - 1, roadTaken);
      }
      if (element.hasTop && _hasTopAdjacentBottomEdge(gameMap, i - 1, j) && !_doesRoadContainDestination(i - 1, j, roadTaken)) {
        top = _checkElectricity(gameMap, finalDestination, i - 1, j, roadTaken);
      }
      if (element.hasBottom && _hasBottomAdjacentTopEdge(gameMap, i + 1, j) && !_doesRoadContainDestination(i + 1, j, roadTaken)) {
        bottom = _checkElectricity(gameMap, finalDestination, i + 1, j, roadTaken);
      }
    }

    return left || right || top || bottom;
  }

  void _addElectricityAnimation(Wire wire) {
    if (wire.hasRight) {
      AnimationElectricity animation = AnimationElectricity.horizontal(wire.electricityRightPos);
      electricityAnimationList.add(animation);
      gameRef.add(animation);
    }

    if (wire.hasLeft) {
      AnimationElectricity animation = AnimationElectricity.horizontal(wire.electricityLeftPos);
      electricityAnimationList.add(animation);
      gameRef.add(animation);
    }

    if (wire.hasBottom) {
      AnimationElectricity animation = AnimationElectricity.vertical(wire.electricityBottomPos);
      electricityAnimationList.add(animation);
      gameRef.add(animation);
    }

    if (wire.hasTop) {
      AnimationElectricity animation = AnimationElectricity.vertical(wire.electricityTopPos);
      electricityAnimationList.add(animation);
      gameRef.add(animation);
    }
  }

  bool _doesRoadContainDestination(int i, int j, List<Destination> roadTaken) {
    for (final destination in roadTaken) {
      if (destination.x == i && destination.y == j) return true;
    }
    return false;
  }

  bool _hasRightAdjacentLeftEdge(List<List<Component?>> gameMap, int i, int j) {
    if (gameMap[i][j] is AnimationBulb) return true; // special condition to understand we have arrived at a bulb

    if (j >= gameMap[0].length || gameMap[i][j] is! Wire) return false;
    return (gameMap[i][j] as Wire).hasLeft;
  }

  bool _hasLeftAdjacentRightEdge(List<List<Component?>> gameMap, int i, int j) {
    if (j < 0 || gameMap[i][j] is! Wire) return false;
    return (gameMap[i][j] as Wire).hasRight;
  }

  bool _hasTopAdjacentBottomEdge(List<List<Component?>> gameMap, int i, int j) {
    if (i < 0 || gameMap[i][j] is! Wire) return false;
    return (gameMap[i][j] as Wire).hasBottom;
  }

  bool _hasBottomAdjacentTopEdge(List<List<Component?>> gameMap, int i, int j) {
    if (i >= gameMap.length || gameMap[i][j] is! Wire) return false;
    return (gameMap[i][j] as Wire).hasTop;
  }

  Future<void> startGamePlay() async {
    componentList = _levelController.currentLevelComponentList;
    componentList.forEach((e) => gameRef.add(e));
    updateGameMap();
  }

  void removeAllGameComponents({bool resetGameProgress = false}) {
    componentList.forEach((e) => e.removeFromParent());
    electricityAnimationList.forEach((e) => e.removeFromParent());
    componentList = [];
    electricityAnimationList = [];

    if (resetGameProgress) {
      _levelController.resetLevelProgress();
    }
  }

  void nextLevel() {
    removeAllGameComponents();
    _levelController.nextLevel();
  }

  bool get hasNextLevel => _levelController.hasNextLevel;

  double get minWireX => AppConstants.mostTopLeftTileX;

  double get minWireY => AppConstants.mostTopLeftTileY;

  double get maxWireX => AppConstants.mostTopLeftTileX + ((_levelController.wireColumnCount - 1) * AppConstants.wireSize);

  double get maxWireY => AppConstants.mostTopLeftTileY + ((_levelController.wireRowCount - 1) * AppConstants.wireSize);
}
