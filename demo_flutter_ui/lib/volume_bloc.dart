import 'dart:async';

import 'package:demo_flutter_ui/volume_event.dart';
import 'package:demo_flutter_ui/volume_state.dart';

class VolumeBloc {
  /* Âm lượng khởi đầu mặc định là 70 */
  var state = VolumeState(70);

  /* Tạo 2 StreamController để quản lý event và state */
  final eventController = StreamController<VolumeEvent>();
  final stateController = StreamController<VolumeState>();

  VolumeBloc() {
    eventController.stream.listen((VolumeEvent event) { 
      if (event is IncrementEvent) {
        state = VolumeState(state.volume + event.increment);
      } else if (event is DecrementEvent) {
        state = VolumeState(state.volume - event.descrement);
      } else {
        state = VolumeState(0);
      }

      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}