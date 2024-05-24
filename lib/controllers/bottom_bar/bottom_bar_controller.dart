import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_bar_controller.g.dart';

@riverpod
class BottomBarController extends _$BottomBarController {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}
