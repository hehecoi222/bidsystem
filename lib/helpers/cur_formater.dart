String currencyFormat(String value) {
  String display = "";
  for (int i = value.length - 1; i >= 0; i--) {
    display = display + value[i];
    if ((value.length - i) % 3 == 0 && i != 0) {
      display += " ";
    }
  }
  return display.split('').reversed.join();
}