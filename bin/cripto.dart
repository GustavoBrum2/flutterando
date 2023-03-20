import 'dart:math';

void main(List<String> args) {
  Criptografia c1 = Criptografia("Gustavo");
  print(c1.key);

  // String teste = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  // String espaco = " ";
  // List<int> lista = [];
  // for (int i = 0; i < teste.length; i++) {
  //   lista.add(teste.codeUnitAt(i) - 64);
  // }
  // print(lista);
  // print(espaco.codeUnits);
}

class Criptografia {
  String mensagem;
  String key = '';

  Criptografia(this.mensagem) {
    gerarKey();
  }

  void gerarKey() {
    var ran = Random();

    for (int i = 0; i < mensagem.length; i++) {
      key += String.fromCharCode(65 + ran.nextInt(26));
    }
  }
}
