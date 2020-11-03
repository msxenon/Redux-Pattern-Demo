
import 'package:flutter_redux_pattern/redux_counter/posts_actions.dart';
import 'package:flutter_redux_pattern/redux_counter/posts_state.dart';

postsReducer(CounterState prevState, SetCounterState action) {
  final payload = action.counterState;
  return prevState.copyWith(
     isLoading: payload.isLoading,
    value: payload.value,
  );
}