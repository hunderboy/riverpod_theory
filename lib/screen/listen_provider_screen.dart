import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/listen_provider.dart';

// /// StatefulWidget => ConsumerStatefulWidget
// class ListenProviderScreen extends ConsumerStatefulWidget {
//   const ListenProviderScreen({Key? key}) : super(key: key);
//
//   @override
//   ListenProviderScreenState createState() => ListenProviderScreenState();
// }
//
// /// State => ConsumerState
// class ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
//     with TickerProviderStateMixin {
//   late final TabController tabController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     tabController = TabController(
//       length: 10,
//       vsync: this,
//       initialIndex: ref.read<int>(listenProvider),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     /// ConsumerStatefulWidget 에서는
//     /// WidgetRef 없이 바로 ref를 전역으로 사용가능하다.
//     /// listenProvider 의 상태가 변경 될때마다 아래 코드가 실행됨.
//     ref.listen<int>(listenProvider, (previous, next) {
//       print('run');
//       if (previous != next) {
//         tabController.animateTo(
//           next,
//           duration: Duration(seconds: 1),
//         );
//       }
//     });
//
//     return DefaultLayout(
//       title: 'ListenProvider',
//       body: TabBarView(
//         physics: NeverScrollableScrollPhysics(),
//         controller: tabController,
//         children: List.generate(
//           10,
//           (index) => Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text('TAB : ${index + 1}', textAlign: TextAlign.center),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         ref
//                             .read(listenProvider.notifier)
//                             .update((state) => state == 0 ? 0 : state - 1);
//                       },
//                       child: Text('뒤로'),
//                     ),
//                   ),
//                   const SizedBox(width: 12.0),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) => _NextScreen(),
//                           ),
//                         );
//                       },
//                       child: Text('다음페이지'),
//                     ),
//                   ),
//                   const SizedBox(width: 12.0),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         ref
//                             .read(listenProvider.notifier)
//                             .update((state) => state == 10 ? 10 : state + 1);
//                       },
//                       child: Text('다음'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _NextScreen extends ConsumerWidget {
//   const _NextScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return DefaultLayout(
//       title: 'NextScreen',
//       body: Center(
//         child: Row(
//           children: [
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   ref
//                       .read(listenProvider.notifier)
//                       .update((state) => state == 0 ? 0 : state - 1);
//                 },
//                 child: Text('뒤로'),
//               ),
//             ),
//             const SizedBox(width: 16.0),
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   ref
//                       .read(listenProvider.notifier)
//                       .update((state) => state == 10 ? 10 : state + 1);
//                 },
//                 child: Text('다음'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// StatefulWidget => ConsumerStatefulWidget
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ListenProviderScreenState createState() => ListenProviderScreenState();
}

/// State => ConsumerState
class ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 10, // 탭 개수
      vsync: this, // TickerProviderStateMixin 필요
      initialIndex: ref.read<int>(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// ConsumerStatefulWidget 에서는
    /// WidgetRef 없이 바로 ref를 전역으로 사용가능하다.
    /// listenProvider 의 상태가 변경 될때마다 아래 코드가 실행됨.
    /// previous = 기존 상태
    /// next = 다음 상태
    ref.listen<int>(listenProvider, (previous, next) {
      print("previous : $previous");
      print("next : $next");

      if (previous != next) {
        tabController.animateTo(
          next,
          // duration: const Duration(seconds: 1),
        );
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: (){
                    ref.read(listenProvider.notifier).update((state) =>
                         state == 10
                             ? 10
                             : state + 1
                    );
                  },
                  child: const Text(
                    '다음'
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    ref.read(listenProvider.notifier).update((state) =>
                    state == 10
                        ? 10
                        : state - 1
                    );
                  },
                  child: const Text(
                      '뒤로'
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
