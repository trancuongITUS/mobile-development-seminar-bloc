import 'package:demo_flutter_ui/volume_bloc.dart';
import 'package:demo_flutter_ui/volume_event.dart';
import 'package:demo_flutter_ui/volume_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* Thay vì xử lý logic ở đây, chúng ta khởi tạo BLoc và để nó giúp ta việc này */
  final bloc = VolumeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<VolumeState>(
          stream: bloc.stateController.stream, 
          initialData: bloc.state, 
          builder: (BuildContext context, AsyncSnapshot<VolumeState> snapshot) {
            return Text("Âm lượng hiện tại: ${snapshot.data?.volume}");
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: () => bloc.eventController.sink.add(IncrementEvent(5)),
          child: const Icon(Icons.volume_up),
          ),
          FloatingActionButton(onPressed: () => bloc.eventController.sink.add(DecrementEvent(5)),
          child: const Icon(Icons.volume_down),
          ),
          FloatingActionButton(onPressed: () => bloc.eventController.sink.add(MuteEvent()),
          child: const Icon(Icons.volume_mute),
          )
        ],
      ),
    );
  }
}
