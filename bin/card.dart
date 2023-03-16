void main(List<String> args) {
  Card card1 = Card('5419 8250 0346 1210');
  print(card1.isValid());

  Card card2 = Card('4916 6418 5936 9080');
  print(card2.isValid());

  Card card3 = Card('5163 2533 9965 0586');
  print(card3.isValid());

  Card card4 = Card('5271 2010 4588 3407');
  print(card4.isValid());
}

class Card {
  String number;

  Card(this.number);

  bool isValid() {
    /// numero sem os espaços
    String numberAux = number.replaceAll(' ', '');

    ///numero sem o ultimo digito
    String number1 = numberAux.substring(0, 15);
    print(number1);

    int v1 = 0;
    int sum = 0;
    int ver = 0;
    String aux;

    for (int i = 0; i < number1.length; i++) {
      if (i % 2 == 0) {
        v1 = int.parse(number1[i]) * 2;
        if (v1 >= 10) {
          aux = v1.toString();
          sum += int.parse(aux.substring(0, 1)) + int.parse(aux.substring(1));
        } else {
          sum += v1;
        }
      } else {
        sum += int.parse(number1[i]) * 1;
      }
    }

    ver = 10 - (sum % 10);
    if (ver == 10) ver = 0;

    number1 += ver.toString();

    return (number1 == numberAux);
  }
}
