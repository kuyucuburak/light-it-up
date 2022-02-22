import 'dart:developer';

import 'package:flame/components.dart';
import 'package:light_it_up/component/animation/animation_bulb.dart';
import 'package:light_it_up/component/animation/animation_electricity.dart';
import 'package:light_it_up/component/animation/animation_generator.dart';
import 'package:light_it_up/component/sprite/wire.dart';
import 'package:light_it_up/game/destination.dart';
import 'package:light_it_up/game/level_controller.dart';
import 'package:light_it_up/game/puzzle_game.dart';
import 'package:light_it_up/menu/congratulation_menu.dart';
import 'package:light_it_up/menu/hud.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/extensions/vector_extension.dart';

class GameController {
  final PuzzleGame gameRef;

  GameController(this.gameRef);

  late final LevelController _levelController = LevelController();
  late List<Component> componentList;
  late List<Component> electricityAnimationList = [];
  late final double minWireX = AppConstants.mostTopLeftTileX;
  late final double minWireY = AppConstants.mostTopLeftTileY;
  late final double maxWireX = AppConstants.mostTopLeftTileX + ((_levelController.currentLevel[0].length - 1) * AppConstants.wireSize);
  late final double maxWireY = AppConstants.mostTopLeftTileY + ((_levelController.currentLevel.length - 1) * AppConstants.wireSize);
  bool hasNextLevel = true;

  void updateGameMap() async {
    electricityAnimationList.forEach((e) => e.removeFromParent());
    electricityAnimationList = [];

    List<List<Component?>> gameMap = List.generate(_levelController.currentLevel.length, (i) => List.filled(_levelController.currentLevel[0].length + 2, null, growable: false), growable: false);
    List<Destination> bulbDestinations = List.empty(growable: true);

    componentList.forEach((element) {
      if (element is Wire) {
        int j = (element.position.x - AppConstants.mostTopLeftTileX) ~/ AppConstants.wireSize;
        int i = (element.position.y - AppConstants.mostTopLeftTileY) ~/ AppConstants.wireSize;
        gameMap[i][j + 1] = element;
      }

      if (element is AnimationGenerator) {
        gameMap[0][0] = element;
      }

      if (element is AnimationBulb) {
        int j = _levelController.currentLevel[0].length + 1;
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
    } else {
      log("NOT COMPLETED!");
    }
  }

  bool _isChapterCompleted(List<List<Component?>> wireMap, List<Destination> bulbDestinations) {
    bool allCompleted = true;
    for (final destination in bulbDestinations) {
      bool completed = _hasRightAdjacentLeftEdge(wireMap, 0, 1) && _checkElectricity(wireMap, destination, 0, 1, List.empty(growable: true));

      if (completed) {
        (wireMap[destination.x][destination.y] as AnimationBulb).turnOnTheLight();
      } else {
        (wireMap[destination.x][destination.y] as AnimationBulb).turnOffTheLight();
        allCompleted = false;
      }
    }
    return allCompleted;
  }

  bool _checkElectricity(List<List<Component?>> wireMap, Destination finalDestination, int i, int j, List<Destination> roadTaken) {
    if (i < 0 || j < 0 || i >= wireMap.length || j >= wireMap[0].length) return false;
    if (wireMap[i][j] == null || wireMap[i][j] is AnimationGenerator) return false;

    Component element = wireMap[i][j]!;

    if (element is AnimationBulb && i == finalDestination.x && j == finalDestination.y) {
      return true;
    }

    bool left = false, right = false, top = false, bottom = false;
    if (element is Wire) {
      roadTaken.add(Destination(i, j));
      _addElectricityAnimation(element);

      if (element.hasRight && _hasRightAdjacentLeftEdge(wireMap, i, j + 1) && !_doesRoadContainDestination(i, j + 1, roadTaken)) {
        right = _checkElectricity(wireMap, finalDestination, i, j + 1, roadTaken);
      }
      if (element.hasLeft && _hasLeftAdjacentRightEdge(wireMap, i, j - 1) && !_doesRoadContainDestination(i, j - 1, roadTaken)) {
        left = _checkElectricity(wireMap, finalDestination, i, j - 1, roadTaken);
      }
      if (element.hasTop && _hasTopAdjacentBottomEdge(wireMap, i - 1, j) && !_doesRoadContainDestination(i - 1, j, roadTaken)) {
        top = _checkElectricity(wireMap, finalDestination, i - 1, j, roadTaken);
      }
      if (element.hasBottom && _hasBottomAdjacentTopEdge(wireMap, i + 1, j) && !_doesRoadContainDestination(i + 1, j, roadTaken)) {
        bottom = _checkElectricity(wireMap, finalDestination, i + 1, j, roadTaken);
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

  bool _hasRightAdjacentLeftEdge(List<List<Component?>> wireMap, int i, int j) {
    if (wireMap[i][j] is AnimationBulb) return true; // special condition to understand we have arrived at the generator

    if (j >= wireMap[0].length || wireMap[i][j] is! Wire) return false;
    return (wireMap[i][j] as Wire).hasLeft;
  }

  bool _hasLeftAdjacentRightEdge(List<List<Component?>> wireMap, int i, int j) {
    if (j < 0 || wireMap[i][j] is! Wire) return false;
    return (wireMap[i][j] as Wire).hasRight;
  }

  bool _hasTopAdjacentBottomEdge(List<List<Component?>> wireMap, int i, int j) {
    if (i < 0 || wireMap[i][j] is! Wire) return false;
    return (wireMap[i][j] as Wire).hasBottom;
  }

  bool _hasBottomAdjacentTopEdge(List<List<Component?>> wireMap, int i, int j) {
    if (i >= wireMap.length || wireMap[i][j] is! Wire) return false;
    return (wireMap[i][j] as Wire).hasTop;
  }

  Future<void> createLevel() async {
    componentList = await _levelController.createLevel() as List<Component>;
  }

  Future<void> startGamePlay() async {
    await createLevel();
    componentList.forEach((e) => gameRef.add(e));

    updateGameMap();
  }

  void removeAllGameComponents() {
    componentList.forEach((e) => e.removeFromParent());
    electricityAnimationList.forEach((e) => e.removeFromParent());
    componentList = [];
    electricityAnimationList = [];
  }

  void nextLevel() {
    removeAllGameComponents();
    _levelController.nextLevel();
    hasNextLevel = _levelController.hasNextLevel;
  }
}
