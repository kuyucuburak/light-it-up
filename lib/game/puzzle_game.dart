import 'dart:developer';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:light_it_up/component/animation/animation_bulb.dart';
import 'package:light_it_up/component/animation/animation_electricity.dart';
import 'package:light_it_up/component/animation/animation_generator.dart';
import 'package:light_it_up/component/sprite/background.dart';
import 'package:light_it_up/component/sprite/wire.dart';
import 'package:light_it_up/game/destination.dart';
import 'package:light_it_up/game/level_builder.dart';
import 'package:light_it_up/util/app_constants.dart';
import 'package:light_it_up/util/asset_provider.dart';
import 'package:light_it_up/util/extensions/vector_extension.dart';

class PuzzleGame extends FlameGame with HasDraggables {
  late final LevelBuilder _levelBuilder = LevelBuilder(_tileMap);
  late List<Component> componentList;
  late List<Component> electricityAnimationList = [];
  late final List<List<String>> _tileMap = [
    [LevelBuilder.wc4, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.who, LevelBuilder.wbl],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.w3r, LevelBuilder.ntg],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wve],
    [LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.ntg, LevelBuilder.wtr, LevelBuilder.ntg],
  ];
  late final double minWireX = AppConstants.mostTopLeftTileX;
  late final double minWireY = AppConstants.mostTopLeftTileY;
  late final double maxWireX = AppConstants.mostTopLeftTileX + ((_tileMap[0].length - 1) * AppConstants.wireSize);
  late final double maxWireY = AppConstants.mostTopLeftTileY + ((_tileMap.length - 1) * AppConstants.wireSize);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProvider.imageAssets);

    add(await background(this));

    componentList = await _levelBuilder.animationList() + await _levelBuilder.bulbList() + await _levelBuilder.wallList() + await _levelBuilder.wireList();
  }

  Future<Component> background(PuzzleGame gameRef) async {
    Vector2 size = gameRef.size;
    return Background.black(
      position: Vector2(size.x / 2, size.y / 2),
      size: size,
    );
  }

  void updateGameMap() async {
    electricityAnimationList.forEach((e) => e.removeFromParent());
    electricityAnimationList = [];

    List<List<Component?>> gameMap = List.generate(_tileMap.length, (i) => List.filled(_tileMap[0].length + 2, null, growable: false), growable: false);
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
        int j = _tileMap[0].length + 1;
        int i = (element.position.y - AppConstants.mostTopLeftTileY) ~/ AppConstants.wireSize;
        gameMap[i][j] = element;
        bulbDestinations.add(Destination(i, j));
      }
    });

    if (_isChapterCompleted(gameMap, bulbDestinations)) {
      log("COMPLETED!!!!!");
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
      add(animation);
    }

    if (wire.hasLeft) {
      AnimationElectricity animation = AnimationElectricity.horizontal(wire.electricityLeftPos);
      electricityAnimationList.add(animation);
      add(animation);
    }

    if (wire.hasBottom) {
      AnimationElectricity animation = AnimationElectricity.vertical(wire.electricityBottomPos);
      electricityAnimationList.add(animation);
      add(animation);
    }

    if (wire.hasTop) {
      AnimationElectricity animation = AnimationElectricity.vertical(wire.electricityTopPos);
      electricityAnimationList.add(animation);
      add(animation);
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

  void startGamePlay() {
    componentList.forEach((e) => add(e));

    updateGameMap();
  }

  void reset() {
    componentList.forEach((e) {
      e.removeFromParent();
    });
  }
}
