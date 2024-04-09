import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/repository/multiples_repository.dart';


/// 예시 1
/// <List<int>, int> => 관리하는 데이터 형식, provider 생성시 받아오는 데이터 형식
final familyProvider = FutureProvider.family<List<int>, int>((ref, data) async{
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});

// /// 예시 2
// final familyProvider = FutureProvider.family<List<int>, int>(
//   (ref, int number) {
//     return MultiplesRepository.getMultiplesFuture(number: number);
//   },
// );
