import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
 import 'package:flutter_redux_pattern/redux_counter/app_state.dart';
import 'package:flutter_redux_pattern/redux_counter/posts_actions.dart';
import 'package:flutter_redux_pattern/redux_counter/redux_store.dart';


void main() async {
  await ReduxStore.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Redux Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider<AppState>(
        store: ReduxStore.store,
        child: MyHomePage(title: 'Flutter Redux Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onFetchPostsPressed() {
    ReduxStore.store.dispatch(increaseCounter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StoreConnector<AppState, bool>(
              distinct: true,
              converter: (store) => store.state.counterState.isLoading,
              builder: (context, isLoading) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!isLoading)
                 RaisedButton(
                   child: Text( 'Increase'),
                   onPressed:  _onFetchPostsPressed,
                 ),
                  if (isLoading)
                    CircularProgressIndicator(),

               ],
                );
              },
            ),
            StoreConnector<AppState, int>(
              distinct: true,
              converter: (store) => store.state.counterState.value,
              builder: (context, counter) {
                return Center(child: Text('$counter',style: TextStyle(fontSize: 20),));
              },
            ),
          ],
        ),
      ),
    );
  }

}