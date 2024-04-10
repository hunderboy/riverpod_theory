import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart'; // 코드제너레이션을 위해 .g.dart 파일 적어줘야함.

// 1. 어떤 provider 이 사용할지 결정할 고민 할 필요 없도록 => code generation 을 통해 해결

// 2. parameter -> Family 방식 : 파라미터를 일반 함수처럼 사용할 수 있도록
// Family 방식은 단 1개의 파라미터만 들어 갈수 있는데,
// 여러개의 파라미터가 들어가게 하고 싶다면, Class 를 만들어 해당 인스턴스를 입력하게 하는 방식이 있다.(List, map 도 있지만.,,)
// 근데 매번 파라미터가 달라지거나 한다면 매번 Class 를 생성하기 너무 귀찮다.

/// ------------------------------------------------------------------------------------------
/// Code Generation : flutter pub run build_runner build

// 1. 어떤 provider 이 사용할지 결정할 고민 할 필요 없도록 => code generation 을 통해 해결

// provider 방식 1 (일반적인 우리가 생성)
final _tesProvider = Provider<String>((ref) => 'Hello Code Generation');

// provider 방식 2 (code generation)
@riverpod
String gState(GStateRef ref){
  return 'Hello Code Generation';
}