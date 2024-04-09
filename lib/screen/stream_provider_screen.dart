import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// StreamProvider 는 반환시 AsyncValue 로 반환한다.
    final AsyncValue<List<int>> stream = ref.watch(multiplesStreamProvider);

    return DefaultLayout(
      title: 'StreamProvider',
      body: Center(
        child: stream.when(
          data: (data) => Text(data.toString()),
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
