import 'package:demo_bloc_console/volume_bloc.dart';
import 'package:demo_bloc_console/volume_event.dart';
import 'package:demo_bloc_console/volume_state.dart';

void main(List<String> arguments) async {
  /* Tạo bloc */
  final bloc = VolumeBloc();

  /* Lắng nghe sự thay đổi state */
  bloc.stateController.stream.listen((VolumeState state) { 
    print("Âm lượng hiện tại là: ${state.volume}");
  });

  /* Chờ 1s */
  await Future.delayed(Duration(seconds: 1));
  bloc.eventController.sink.add(IncrementEvent(5));

  /* Chờ 2s */
  await Future.delayed(Duration(seconds: 2));
  bloc.eventController.sink.add(DecrementEvent(10));

  /* Chờ thêm 5s */
  await Future.delayed(Duration(seconds: 5));
  bloc.eventController.sink.add(MuteEvent());
}
