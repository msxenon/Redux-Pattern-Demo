 import 'package:flutter_redux_pattern/redux_counter/app_state.dart';
import 'package:flutter_redux_pattern/redux_counter/posts_state.dart';
 import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class ReduxStore {
  static Store<AppState> _store ;
  static Store<AppState> get store {
    if(_store == null)
      throw Exception('Store is not initiated');
    else
      return _store;
  }

  static Future<void> init() async {
    final counterStateInitial = CounterState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(counterState: counterStateInitial),
    );
  }
}

