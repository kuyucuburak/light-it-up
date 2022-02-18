import 'package:flame/components.dart';
import 'package:light_it_up/component/animation/animation_bulb.dart';
import 'package:light_it_up/component/animation/animation_electricity_horizontal.dart';
import 'package:light_it_up/component/animation/animation_electricity_vertical.dart';
import 'package:light_it_up/component/animation/animation_generator.dart';
import 'package:light_it_up/component/sprite/wall.dart';
import 'package:light_it_up/component/sprite/wire.dart';
import 'package:light_it_up/util/app_constants.dart';

class LevelBuilder {
  static const String ntg = "nothing";
  static const String blb = "bulb";
  static const String eho = "horizontal_electricity";
  static const String evo = "vertical_electricity";
  static const String gnr = "generator";
  static const String who = "wire_horizontal";
  static const String wve = "wire_vertical";
  static const String wbl = "wire_bottom_left";
  static const String wbr = "wire_bottom_right";
  static const String wtl = "wire_top_left";
  static const String wtr = "wire_top_right";
  static const String w3l = "wire_connected3_left";
  static const String w3r = "wire_connected3_right";
  static const String w3b = "wire_connected3_bottom";
  static const String w3t = "wire_connected3_top";
  static const String wc4 = "wire_connected4";

  late final double _mostTopLeftBrickX = AppConstants.mostTopLeftTileX - AppConstants.wireSize / 2 - AppConstants.wallSize / 2;
  late final double _mostTopLeftBrickY = AppConstants.mostTopLeftTileY - AppConstants.wireSize / 2 - AppConstants.wallSize / 2;
  late final int _tileRowCount = _tileMap.length;
  late final int _tileColumnCount = _tileMap[0].length;
  late final int _brickRowCount = _tileRowCount * AppConstants.wireSize ~/ AppConstants.wallSize + 2;
  late final int _brickColumnCount = _tileColumnCount * AppConstants.wireSize ~/ AppConstants.wallSize + 2;

  final List<List<String>> _tileMap;

  LevelBuilder(this._tileMap);

  Future<List<Component>> animationList() async {
    List<Component> componentList = [];
    componentList.add(_keyToComponent(
      gnr,
      Vector2(AppConstants.mostTopLeftTileX - AppConstants.wireSize * 0.75, AppConstants.mostTopLeftTileY),
    )!);
    return componentList;
  }

  Future<List<Component>> bulbList() async {
    List<Component> componentList = [];

    componentList.add(_keyToComponent(
      blb,
      Vector2(
        AppConstants.mostTopLeftTileX + (_tileColumnCount - 1) * AppConstants.wireSize + AppConstants.wireSize * 0.75,
        AppConstants.mostTopLeftTileY + (_tileRowCount - 1) * AppConstants.wireSize,
      ),
    )!);

    componentList.add(_keyToComponent(
      blb,
      Vector2(
        AppConstants.mostTopLeftTileX + (_tileColumnCount - 1) * AppConstants.wireSize + AppConstants.wireSize * 0.75,
        AppConstants.mostTopLeftTileY + (_tileRowCount - 4) * AppConstants.wireSize,
      ),
    )!);

    return componentList;
  }

  Future<List<Component>> electricityVerticalList() async {
    List<Component> componentList = [];

    componentList.add(_keyToComponent(
      evo,
      Vector2(
        AppConstants.mostTopLeftTileX + AppConstants.wireSize + 500,
        AppConstants.mostTopLeftTileY + 100,
      ),
    )!);

    return componentList;
  }

  Future<List<Component>> electricityHorizontalList() async {
    List<Component> componentList = [];

    componentList.add(_keyToComponent(
      eho,
      Vector2(
        AppConstants.mostTopLeftTileX + AppConstants.wireSize + 50,
        AppConstants.mostTopLeftTileY + 300,
      ),
    )!);

    return componentList;
  }

  Future<List<Component>> wallList() async {
    List<Component> componentList = [];

    double wallSize = AppConstants.wallSize;
    int rowCount = _brickRowCount;
    int columnCount = _brickColumnCount;

    // top bricks
    for (int i = 0; i < columnCount; i++) {
      componentList.add(Wall.unit(Vector2(
        _mostTopLeftBrickX + (i * wallSize),
        _mostTopLeftBrickY,
      )));
    }

    // bottom bricks
    for (int i = 0; i < columnCount; i++) {
      componentList.add(Wall.unit(Vector2(
        _mostTopLeftBrickX + (i * wallSize),
        _mostTopLeftBrickY + (wallSize * (rowCount - 1)),
      )));
    }

    // left bricks
    for (int i = 1; i < rowCount - 1; i++) {
      componentList.add(Wall.unit(Vector2(
        _mostTopLeftBrickX,
        _mostTopLeftBrickY + (i * wallSize),
      )));
    }

    // right bricks
    for (int i = 1; i < rowCount - 1; i++) {
      componentList.add(Wall.unit(Vector2(
        _mostTopLeftBrickX + wallSize * (columnCount - 1),
        _mostTopLeftBrickY + (i * wallSize),
      )));
    }

    return componentList;
  }

  Future<List<Component>> wireList() async {
    List<Component> componentList = [];

    for (int i = 0; i < _tileRowCount; i++) {
      for (int j = 0; j < _tileColumnCount; j++) {
        String key = _tileMap[i][j];
        double positionX = AppConstants.mostTopLeftTileX + AppConstants.wireSize * j;
        double positionY = AppConstants.mostTopLeftTileY + AppConstants.wireSize * i;
        Component? component = _keyToComponent(key, Vector2(positionX, positionY));
        if (component != null) {
          componentList.add(component);
        }
      }
    }

    return componentList;
  }

  Component? _keyToComponent(String key, Vector2 position) {
    switch (key) {
      case blb:
        return AnimationBulb.create(position);
      case eho:
        return AnimationElectricityHorizontal.create(position);
      case evo:
        return AnimationElectricityVertical.create(position);
      case gnr:
        return AnimationGenerator.create(position);
      case who:
        return Wire.horizontal(position);
      case wve:
        return Wire.vertical(position);
      case wbl:
        return Wire.cornerBottomLeft(position);
      case wbr:
        return Wire.cornerBottomRight(position);
      case wtl:
        return Wire.cornerTopLeft(position);
      case wtr:
        return Wire.cornerTopRight(position);
      case w3l:
        return Wire.connected3Left(position);
      case w3r:
        return Wire.connected3Right(position);
      case w3b:
        return Wire.connected3Bottom(position);
      case w3t:
        return Wire.connected3Top(position);
      case wc4:
        return Wire.connected4(position);
      default:
        return null;
    }
  }
}
