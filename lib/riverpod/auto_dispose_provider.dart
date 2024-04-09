import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/repository/multiples_repository.dart';

/// 말그대로 자동 해지
final autoDisposeProvider = FutureProvider.autoDispose<List<int>>((ref) async{
  await Future.delayed(const Duration(seconds: 2));

  return [1,2,3,4,5];
});

// final autoDisposeProvider = FutureProvider.autoDispose((ref) {
//   return MultiplesRepository.getMultiplesFuture(number: 2);
// });
