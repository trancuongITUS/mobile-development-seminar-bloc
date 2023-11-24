abstract class VolumeEvent {}

class IncrementEvent extends VolumeEvent {
  
  IncrementEvent(this.increment);

  final int increment;
}

class DecrementEvent extends VolumeEvent {
  
  DecrementEvent(this.descrement);

  final int descrement;
}

class MuteEvent extends VolumeEvent {}