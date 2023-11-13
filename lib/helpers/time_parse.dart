String toDisplay(String UTCTime) {
  if (UTCTime.isEmpty) {
    return "";
  }
  final temp = DateTime.parse(UTCTime);
  return "${temp.hour}:${temp.minute}:${temp.second} ${temp.day}/${temp.month}/${temp.year}";
}

Pair calculateRemaining(String start, String end) {
  final dStart = DateTime.parse(start);
  final dEnd = DateTime.parse(end);
  final duRemaining = dEnd.difference(DateTime.now());
  if (duRemaining.isNegative) {
    return Pair("Closed", 1);
  }
  final portion = duRemaining.inSeconds / dEnd.difference(dStart).inSeconds;
  return Pair(
    "${duRemaining.inDays > 1 ? duRemaining.inDays.toString() + " days" : duRemaining.inHours > 1 ? duRemaining.inHours.toString() + " hours" : duRemaining.inMinutes > 1 ? duRemaining.inMinutes.toString() + " minutes" : duRemaining.inSeconds.toString() + " seconds"}",
      portion);
}

class Pair {
  final String first;
  final double second;
  Pair(this.first, this.second);
}
