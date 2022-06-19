import 'dart:async';
import 'dart:io';

import 'package:screen_state/screen_state.dart';

class ScreenListener{
  late Screen _screen;
  late StreamSubscription<ScreenStateEvent> _subscription;

  void onData(ScreenStateEvent event) {
    //print(event);
    if (event == ScreenStateEvent.SCREEN_OFF){
      exit(0);
    }
  }

  void startListening() {
    _screen = new Screen();
    try {
      _subscription = _screen.screenStateStream!.listen(onData);
    } on ScreenStateException catch (exception) {
      print(exception);
    }
  }
}