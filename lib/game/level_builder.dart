import 'package:flame/components.dart';
import 'package:light_it_up/component/animation/animation_bulb.dart';
import 'package:light_it_up/component/animation/animation_electricity.dart';
import 'package:light_it_up/component/animation/animation_generator.dart';
import 'package:light_it_up/component/sprite/wall.dart';
import 'package:light_it_up/component/sprite/wire.dart';
import 'package:light_it_up/data/level.dart';
import 'package:light_it_up/util/app_constants.dart';

class LevelBuilder {
  static const String ntg = "nothing";
  static const String blb = "bulb";
  static const String eho = "electricity_horizontal";
  static const String eve = "electricity_vertical";
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

  final Level _level;

  LevelBuilder(this._level);

  List<Component> _generatorList() {
    return _level.generatorIndexList.map<Component>((e) {
      return _keyToComponent(
        gnr,
        Vector2(
          AppConstants.mostTopLeftTileX - AppConstants.wireSize * 0.75,
          AppConstants.mostTopLeftTileY + e * AppConstants.wireSize,
        ),
      )!;
    }).toList();
  }

  List<Component> _bulbList() {
    return _level.bulbIndexList.map<Component>((e) {
      return _keyToComponent(
        blb,
        Vector2(
          AppConstants.mostTopLeftTileX + (wireColumnCount - 1) * AppConstants.wireSize + AppConstants.wireSize * 0.75,
          AppConstants.mostTopLeftTileY + e * AppConstants.wireSize,
        ),
      )!;
    }).toList();
  }

  List<Component> _wireList() {
    List<Component> componentList = [];

    for (int i = 0; i < wireRowCount; i++) {
      for (int j = 0; j < wireColumnCount; j++) {
        String key = _level.tileMap[i][j];
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

  List<Component> _wallList() {
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

  Component? _keyToComponent(String key, Vector2 position) {
    switch (key) {
      case blb:
        return AnimationBulb.create(position);
      case eho:
        return AnimationElectricity.horizontal(position);
      case eve:
        return AnimationElectricity.vertical(position);
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

  List<Component> get levelComponents => _generatorList() + _bulbList() + _wireList() + _wallList();

  double get _mostTopLeftBrickX => AppConstants.mostTopLeftTileX - AppConstants.wireSize / 2 - AppConstants.wallSize / 2;

  double get _mostTopLeftBrickY => AppConstants.mostTopLeftTileY - AppConstants.wireSize / 2 - AppConstants.wallSize / 2;

  int get wireRowCount => _level.tileMap.length;

  int get wireColumnCount => _level.tileMap[0].length;

  int get _brickRowCount => wireRowCount * 3 + 2;

  int get _brickColumnCount => wireColumnCount * 3 + 2;
}
