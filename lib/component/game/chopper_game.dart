import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/component/animation/chopper.dart';
import 'package:water_to_trees/game/puzzle_game.dart';
import 'package:water_to_trees/util/constants.dart';

class ChopperGame extends Chopper<PuzzleGame> with HasHitboxes, Collidable, Draggable {
  static const int dragStartThreshold = 50; // When it is lower, drag will start sooner.

  @override
  bool debugMode = Constants.debugMode;

  List<Vector2> _intersectionPoints = [];

  int? _dragPointerId;
  Vector2? _dragDeltaPosition;
  bool? _isDragHorizontal;

  ChopperGame({
    required Vector2 position,
    required Vector2 size,
  }) : super(
          position: position,
          size: size,
        ) {
    addHitbox(HitboxRectangle());
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged ? material.Colors.greenAccent : material.Colors.lightBlueAccent;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    final dragPointerId = _dragPointerId;
    if (dragPointerId != null) {
      handleDragCanceled(dragPointerId);
    }

    _intersectionPoints = intersectionPoints.toList();
  }

  @override
  void onCollisionEnd(Collidable other) {
    _intersectionPoints = [];
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    _dragPointerId = pointerId;
    _dragDeltaPosition = info.eventPosition.game - position;
    _isDragHorizontal = null;
    return true;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    if (_intersectionPoints.isNotEmpty) {
      return false;
    }

    final Vector2 dragDeltaPosition = _dragDeltaPosition ?? Vector2(0, 0);
    Vector2 eventPositionWithDelta = info.eventPosition.game;
    double evenPointX = eventPositionWithDelta.x - dragDeltaPosition.x;
    double evenPointY = eventPositionWithDelta.y - dragDeltaPosition.y;
    if (_isDragHorizontal == null) {
      double moveXCount = (evenPointX - position.x).abs();
      double moveYCount = (evenPointY - position.y).abs();
      if (moveXCount >= dragStartThreshold || moveYCount >= dragStartThreshold) {
        _isDragHorizontal = moveXCount > moveYCount;
      }
    }

    if (_isDragHorizontal == true) {
      position.x = evenPointX;
    } else if (_isDragHorizontal == false) {
      position.y = evenPointY;
    }

    return true;
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo info) {
    _dragPointerId = null;
    _dragDeltaPosition = null;
    _isDragHorizontal = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    _dragPointerId = null;
    _dragDeltaPosition = null;
    _isDragHorizontal = null;
    return false;
  }
}
