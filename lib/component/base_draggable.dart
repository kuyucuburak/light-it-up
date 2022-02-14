import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:water_to_trees/component/animation/tile.dart';
import 'package:water_to_trees/component/sprite/wire.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:dart_extensions/dart_extensions.dart';

mixin BaseDraggable on HasGameRef<PuzzleGame>, HasHitboxes, PositionComponent, Draggable {
  static const int _dragStartThreshold = 50; // When it is lower, dragging will be started sooner, it will be more sensitive.

  @override
  bool debugMode = AppConstants.debugMode;

  Vector2? _dragDeltaPosition;
  bool? _isDragHorizontal;

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    _dragDeltaPosition = info.eventPosition.game - position;
    _isDragHorizontal = null;
    return true;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    final Vector2 dragDeltaPosition = _dragDeltaPosition ?? Vector2(0, 0);
    Vector2 eventPositionWithDelta = info.eventPosition.game;
    double evenPointX = eventPositionWithDelta.x - dragDeltaPosition.x;
    double evenPointY = eventPositionWithDelta.y - dragDeltaPosition.y;

    if (_isDragHorizontal == null) {
      double moveXCount = (evenPointX - position.x).abs();
      double moveYCount = (evenPointY - position.y).abs();

      if (moveXCount >= _dragStartThreshold || moveYCount >= _dragStartThreshold) {
        _isDragHorizontal = moveXCount > moveYCount;
      }

      return true;
    } else {
      if (_isDragHorizontal == true) {
        if (evenPointX > position.x) {
          double newX = position.x + AppConstants.tileSize;
          if (_canMoveToPosition(newX, position.y)) {
            position.x = newX;
          }
        } else {
          double newX = position.x - AppConstants.tileSize;
          if (_canMoveToPosition(newX, position.y)) {
            position.x = newX;
          }
        }
      } else if (_isDragHorizontal == false) {
        if (evenPointY > position.y) {
          double newY = position.y + AppConstants.tileSize;
          if (_canMoveToPosition(position.x, newY)) {
            position.y = newY;
          }
        } else {
          double newY = position.y - AppConstants.tileSize;
          if (_canMoveToPosition(position.x, newY)) {
            position.y = newY;
          }
        }
      }

      handleDragCanceled(pointerId);
      return false;
    }
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo info) {
    _dragDeltaPosition = null;
    _isDragHorizontal = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    _dragDeltaPosition = null;
    _isDragHorizontal = null;
    return false;
  }

  bool _canMoveToPosition(double x, double y) {
    bool hasChildren = gameRef.children.filter((e) => e is Tile || e is Wire).any((e) => e.containsPoint(Vector2(x, y)));
    bool isInSafeArea = x >= gameRef.minTileX && x <= gameRef.maxTileX && y >= gameRef.minTileY && y <= gameRef.maxTileY;
    return !hasChildren && isInSafeArea;
  }
}
