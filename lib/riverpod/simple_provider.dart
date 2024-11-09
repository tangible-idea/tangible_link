

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'simple_provider.g.dart';

@riverpod
class UserStateNotifier extends _$UserStateNotifier {

  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }
}