import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/repository/multiples_repository.dart';

/// 예시 1
final multiplesStreamProvider = StreamProvider<List<int>>((ref) async*{
  for(int i = 0; i < 10; i++){
    await Future.delayed(Duration(seconds: 1));

    yield List.generate(3, (index) => index * i);
  }
});


// /// 예시 2
// final multiplesStreamProvider = StreamProvider<List<int>>(
//   (ref) {
//     return MultiplesRepository.getMultiplesStream(number: 2);
//   },
// );