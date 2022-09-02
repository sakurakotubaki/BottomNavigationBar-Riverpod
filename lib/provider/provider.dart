// enumは列挙型と呼ばれている固定数の定数値を表すために使用される
// 特別な種類のクラスです。
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TabType { home, map, profile }
// StateProviderを使用して、Enum型のTabTypeを型として使い状態管理をする。
// 初期の状態だとhomeの定数を初期値として使うので、HomeScreenが選択される。
final tabTypeProvider = StateProvider<TabType>((ref) => TabType.home);
