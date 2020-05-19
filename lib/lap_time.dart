class Lap {
  final String time;
  final int index;

  Lap(this.index, this.time);
}

class LapTime {
  List<Lap> lap = [];

  void addLap(String lapTime) {
    int index = length + 1;
    lap.insert(0, Lap(index, lapTime));
  }

  int get length {
    return lap.length;
  }
}
