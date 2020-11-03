
import 'package:flutter_redux_pattern/redux_counter/posts_state.dart';
 import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

import 'app_state.dart';


@immutable
class SetCounterState {
  final CounterState counterState;

  SetCounterState(this.counterState);
}

Future<void> increaseCounter(Store<AppState> store) async {
  store.dispatch(SetCounterState(CounterState(isLoading: true)));

  await Future.delayed(Duration(seconds: 2),(){
    store.dispatch(
      SetCounterState(
        CounterState(
          isLoading: false,
          value: store.state.counterState.value + 1),
        ),
      );
  })  ;


}