import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/repository/multiples_repository.dart';

/// 예시 1
final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    const Duration(
      seconds: 2,
    )
  );

  /// 일부러 에러 발생
  // throw Exception('에러');

  return [1,2,3,4,5];
});

/// 예시 2
// final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
//   final result = await MultiplesRepository.getMultiplesFuture(number: 2);
//
//   return result;
// });
