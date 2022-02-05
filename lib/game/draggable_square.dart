import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/archive/game/ember.dart';
import 'package:water_to_trees/game/puzzle_game.dart';

class DraggableSquare extends Ember<PuzzleGame> with Draggable, HasHitboxes, Collidable {
  @override
  bool debugMode = true;

  List<Vector2> intersectionPoints = [];

  DraggableSquare({Vector2? position})
      : super(
          position: position ?? Vector2.all(200),
          size: Vector2.all(200),
        ) {
    final shape = HitboxRectangle();
    addHitbox(shape);
  }

  Vector2? dragDeltaPosition;
  late Vector2 positionBeforeDrag = position;
  bool? isDragHorizontal;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged && parent is PuzzleGame ? material.Colors.greenAccent : material.Colors.purple;
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    positionBeforeDrag = position;
    isDragHorizontal = null;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    if (parent is! PuzzleGame) {
      return true;
    }

    if (intersectionPoints.length >= 2 && intersectionPoints[0].y == intersectionPoints[1].y) {
      return true;
    }

    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    var eventPosition = info.eventPosition.game;
    isDragHorizontal ??= (eventPosition.x - position.x).abs() > (eventPosition.y - position.y).abs();
    if (isDragHorizontal == true) {
      position.x = eventPosition.x - dragDeltaPosition.x;
    } else {
      position.y = eventPosition.y - dragDeltaPosition.y;
    }

    return false;
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo info) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is Ember) {
      this.intersectionPoints = intersectionPoints.toList();
    }
  }

  @override
  void onCollisionEnd(Collidable other) {
    if (other is Ember) {
      intersectionPoints = [];
    }
  }
}
