import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart'; // 코드제너레이션을 위해 .g.dart 파일 적어줘야함.

/// ------------------------------------------------------------------------------------------
/// Code Generation : flutter pub run build_runner build


// 1. 어떤 provider 이 사용할지 결정할 고민 할 필요 없도록 => code generation 을 통해 해결

// 2. parameter -> Family 방식 : 파라미터를 일반 함수처럼 사용할 수 있도록
// Family 방식은 단 1개의 파라미터만 들어 갈수 있는데,
// 여러개의 파라미터가 들어가게 하고 싶다면, Class 를 만들어 해당 인스턴스를 입력하게 하는 방식이 있다.(List, map 도 있지만.,,)
// 근데 매번 파라미터가 달라지거나 한다면 매번 Class 를 생성하기 너무 귀찮다.





/// ------------------------------------------------------------------------------------------
/// 1. 어떤 provider 이 사용할지 결정할 고민 할 필요 없도록 => code generation 을 통해 해결

// provider 방식 1 (일반적인 우리가 생성)
final _tesProvider = Provider<String>((ref) => 'Hello Code Generation');

// provider 방식 2 (code generation)
@riverpod
String gState(GStateRef ref){
  return 'Hello Code Generation';
}

// Future 값도 반환 가능하다.
@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}


@Riverpod(
  keepAlive: true // provider 상태 유지
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}



/// 2. parameter -> Family 방식 : 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

// 방식 1
final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2
);

// 방식 2
@riverpod
int gStateMulitply(GStateMulitplyRef ref,{
  required int number1,
  required int number2,
}){
  return number1 * number2;
}







/// ------------------------------------------------------------------------------------------
///Riverpod v2 StateNotifierProvider 코드제너레이션으로 생성하기
@riverpod
class GStateNotifier extends _$GStateNotifier{

  @override
  int build(){
    return 0; // 초기 상태값 지정
  }

  increment(){
    state ++;
  }
  decrement(){
    state --;
  }
}
