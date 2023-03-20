import 'dart:math';

void main(List<String> args) {
  Criptografia c1 = Criptografia("Gustavo Henrique de Brum");
  print(c1.key);
  print(c1.mensagem);

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
  String mensagemCripto = '';
  String key = '';

  Criptografia(this.mensagem) {
    mensagem = mensagem.toUpperCase();
    gerarKey();
  }

  void gerarKey() {
    var ran = Random();

    for (int i = 0; i < mensagem.length; i++) {
      key += String.fromCharCode(65 + ran.nextInt(26));
    }
  }

  void encode() {

    for(int i = 0; i < mensagem.length; i ++){

      

    }

  }
}
