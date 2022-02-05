import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:water_to_trees/game/draggable_square.dart';

class PuzzleGame extends FlameGame with HasDraggables, HasCollidables {
  late final List<DraggableSquare> squareList = [];

  @override
  Future<void> onLoad() async {
    squareList.add(DraggableSquare());
    squareList.add(DraggableSquare()..y = 500);
    squareList.add(DraggableSquare()..y = 701);
    add(squareList[0]);
    add(squareList[1]);
    add(squareList[2]);
  }
}
