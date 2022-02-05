import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' as material;
import 'package:water_to_trees/archive/game/draggable_example.dart';
import 'package:water_to_trees/archive/game/ember.dart';

class DraggableSquare extends Ember with Draggable {
  @override
  bool debugMode = true;

  DraggableSquare({Vector2? position})
      : super(
    position: position ?? Vector2.all(200),
    size: Vector2.all(200),
  );

  Vector2? dragDeltaPosition;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragged && parent is DraggablesExample
        ? material.Colors.greenAccent
        : material.Colors.purple;
  }

  @override
  bool onDragStart(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    if (parent is! DraggablesExample) {
      return true;
    }
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }

    position.setFrom(info.eventPosition.game - dragDeltaPosition);
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
}