import 'package:meta/meta.dart';

@immutable
class CounterState {
   final bool isLoading;
  final int value;

   CounterState({
     this.isLoading,
    this.value,
  });

  factory CounterState.initial() => CounterState(
    isLoading: false,
    value: 0,
   );

   CounterState copyWith({
     @required bool isLoading,
    @required int value,
  }) {
    return CounterState(
       isLoading: isLoading ?? this.isLoading,
      value: value ?? this.value,
    );
  }
}