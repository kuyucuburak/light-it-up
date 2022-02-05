import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/archive/util/asset_provider_old.dart';
import 'package:water_to_trees/component/selector.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class IsometricTileMapExample extends FlameGame with MouseMovementDetector, HorizontalDragDetector {
  static const double _scale = 4.0;
  static const double _srcTileSize = 32.0;
  static const double _destTileSize = _scale * _srcTileSize;

  static const bool _useShortTiles = true;
  static const double _tileHeight = _scale * (_useShortTiles ? 8.0 : 16.0);

  static const List<int> unswipableBlockValues = [4];

  final topLeft = Vector2(500, 250);
  final originColor = Paint()..color = material.Colors.red;

  late IsometricTileMapComponent _tileMap;
  late Selector _selector;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await images.loadAll(AssetProviderOld.imageAssets);

    add(await _getBlockMapComponent());
    add(await _getSelectorComponent());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.renderPoint(topLeft, size: 10, paint: originColor);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    final Vector2 screenPosition = info.eventPosition.game;
    final Block block = _tileMap.getBlock(screenPosition);
    _selector.show = isBlockSelectable(block);
    _selector.position.setFrom(topLeft + _tileMap.getBlockRenderPosition(block));
  }

  @override
  void onHorizontalDragStart(DragStartInfo info) {
    final Vector2 screenPosition = info.eventPosition.game;
    final Block block = _tileMap.getBlock(screenPosition);
    if (isBlockSelectable(block)) {
      _tileMap.setBlockValue(block, 3);
    }
  }

  Future<Component> _getBlockMapComponent() async {
    final Image tilesetImage = await AssetProvider.tiles(this, _useShortTiles);
    final SpriteSheet tileset = SpriteSheet(
      image: tilesetImage,
      srcSize: Vector2.all(_srcTileSize),
    );
    final List<List<int>> blockMatrix = [
      [3, 3, 3, 3, 3, 3, 3],
      [3, 2, 1, 1, 1, 2, 3],
      [3, 2, 4, 4, 4, 2, 3],
      [3, 2, 4, 4, 4, 2, 3],
      [3, 2, 4, 4, 4, 2, 3],
      [3, 2, 0, 0, 0, 2, 3],
      [3, 3, 3, 3, 3, 3, 3],
    ];

    return _tileMap = IsometricTileMapComponent(
      tileset,
      blockMatrix,
      destTileSize: Vector2.all(_destTileSize),
      tileHeight: _tileHeight,
      position: topLeft,
    );
  }

  Future<Component> _getSelectorComponent() async {
    final Image selectorImage = await AssetProvider.selector(this, _useShortTiles);
    return _selector = Selector(_destTileSize, selectorImage);
  }

  bool isBlockSelectable(Block block) => _tileMap.containsBlock(block) && !unswipableBlockValues.contains(_tileMap.blockValue(block));
}
