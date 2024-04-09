import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/auto_dispose_provider.dart';

class AutoDisposeScreen extends ConsumerWidget {
  const AutoDisposeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 기존의 provider 경우, 데이터 캐싱이 된다.
    /// AutoDispose의 경우, 자동으로 캐시를 삭제한다.
    /// autoDisposeProvider 를 사용하는 page가 없으니 메모리에서 삭제한다.
    final AsyncValue<List<int>> result = ref.watch(autoDisposeProvider);

    return DefaultLayout(
      title: 'AutoDispose',
      body: Center(
        child: result.when(
          data: (data) => Text(data.toString()),
          error: (err, stack) => Text('Error : $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
