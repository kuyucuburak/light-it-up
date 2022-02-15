import 'package:flame/game.dart';
import 'package:water_to_trees/component/base_draggable_sprite_component.dart';
import 'package:water_to_trees/util/alias.dart';
import 'package:water_to_trees/util/app_constants.dart';
import 'package:water_to_trees/util/asset_provider.dart';

class Wire extends BaseDraggableSpriteComponent {
  bool hasElectricity;

  Wire._({required Vector2 position, required SpriteLoader spriteLoader, required bool hasLeft, required bool hasRight, required bool hasBottom, required bool hasTop, required this.hasElectricity})
      : super(
          position: position,
          size: Vector2.all(AppConstants.wireSize),
          priority: AppConstants.wirePriority,
          spriteLoader: spriteLoader,
        );

  static Wire horizontal(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireHorizontal, hasLeft: true, hasRight: true, hasBottom: false, hasTop: false, hasElectricity: false);

  static Wire vertical(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireVertical, hasLeft: false, hasRight: false, hasBottom: true, hasTop: true, hasElectricity: false);

  static Wire cornerBottomLeft(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireCornerBottomLeft, hasLeft: true, hasRight: false, hasBottom: true, hasTop: false, hasElectricity: false);

  static Wire cornerBottomRight(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireCornerBottomRight, hasLeft: false, hasRight: true, hasBottom: true, hasTop: false, hasElectricity: false);

  static Wire cornerTopLeft(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireCornerTopLeft, hasLeft: true, hasRight: false, hasBottom: false, hasTop: true, hasElectricity: false);

  static Wire cornerTopRight(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireCornerTopRight, hasLeft: false, hasRight: true, hasBottom: false, hasTop: true, hasElectricity: false);

  static Wire connected3Left(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireConnected3Left, hasLeft: true, hasRight: false, hasBottom: true, hasTop: true, hasElectricity: false);

  static Wire connected3Right(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireConnected3Right, hasLeft: false, hasRight: true, hasBottom: true, hasTop: true, hasElectricity: false);

  static Wire connected3Bottom(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireConnected3Bottom, hasLeft: true, hasRight: true, hasBottom: true, hasTop: false, hasElectricity: false);

  static Wire connected3Top(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireConnected3Top, hasLeft: true, hasRight: true, hasBottom: false, hasTop: true, hasElectricity: false);

  static Wire connected4(Vector2 position) =>
      Wire._(position: position, spriteLoader: AssetProvider.imageWireConnected4, hasLeft: true, hasRight: true, hasBottom: true, hasTop: true, hasElectricity: false);
}
