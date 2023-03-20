import 'dart:math';

void main(List<String> args) {
  Criptografia c1 = Criptografia("CACHORRO VERDE AMARELO AZUL E ADADADAAD");
  print(c1.key);
  print(c1.mensagem);

  c1.encode();
  print(c1.mensagemCripto);
  c1.decode();
  print(c1.mensagemCripto);

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
    int aux;

    for (int i = 0; i < mensagem.length; i++) {
      if (mensagem.codeUnitAt(i) < 65 || mensagem.codeUnitAt(i) > 90) {
        mensagemCripto += mensagem[i];
      } else {
        aux = (mensagem.codeUnitAt(i) + (key.codeUnitAt(i) - 65));

        if (aux > 90) {
          mensagemCripto += String.fromCharCode(aux - 26);
        } else {
          mensagemCripto += String.fromCharCode(aux);
        }
      }
    }
  }

  void decode() {
    int aux;
    String mensagemAux = '';
    if (mensagem == mensagemCripto) return;
    for (int i = 0; i < mensagem.length; i++) {
      if (mensagemCripto.codeUnitAt(i) < 65 || mensagemCripto.codeUnitAt(i) > 90) {
        mensagemAux += mensagemCripto[i];
      } else {
        aux = (mensagemCripto.codeUnitAt(i) - (key.codeUnitAt(i) - 65));

        if (aux < 65) {
          mensagemAux += String.fromCharCode(aux + 26);
        } else {
          mensagemAux += String.fromCharCode(aux);
        }
      }
    }

    mensagemCripto = mensagemAux;
  }
}
