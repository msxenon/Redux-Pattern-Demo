import 'package:flutter/foundation.dart';
import 'package:flutter_redux_pattern/redux_counter/posts_actions.dart';
import 'package:flutter_redux_pattern/redux_counter/posts_reducer.dart';
import 'package:flutter_redux_pattern/redux_counter/posts_state.dart';
AppState appReducer(AppState state, dynamic action) {
  if (action is SetCounterState) {
    final nextPostsState = postsReducer(state.counterState, action);

    return state.copyWith(postsState: nextPostsState);
  }

  return state;
}


@immutable
class AppState {
  final CounterState counterState;

  AppState({
    @required this.counterState,
  });

  AppState copyWith({
    CounterState postsState,
  }) {
    return AppState(
      counterState: postsState ?? this.counterState,
    );
  }
}