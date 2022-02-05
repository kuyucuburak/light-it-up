import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/archive/game/draggable_square.dart';

class DraggablesExample extends FlameGame with HasDraggables {
  static const String description = '''
    In this example we show you can use the `Draggable` mixin on
    `PositionComponent`s. Drag around the Embers and see their position
    changing.
  ''';

  final double zoom;
  late final DraggableSquare square;

  DraggablesExample({required this.zoom});

  @override
  Future<void> onLoad() async {
    add(square = DraggableSquare());
    add(DraggableSquare()..y = 350);
  }
}
