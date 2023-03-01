import 'dart:io';

void main(List<String> arguments) {
  List<int> sequencia = [];
  double peso;
  double altura;
  int quantidade;
  double resultado;

  resultado = regraDeTres(
    x1: 4,
    x2: 5,
    y1: 2,
  );
  print(resultado);

  String? resposta = '1';

  while ((int.parse(resposta!) > 0 && int.parse(resposta) < 4)) {
    print("Qual operação deseja realizar?");
    print("1 - IMC.");
    print("2 - Fibonacci com for.");
    print("3 - Fibonacci recursiva.");
    print("Qualquer outro valor irá finalizar o programa.");
    resposta = stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H");

    switch (int.parse(resposta!)) {
      case 1:
        stdout.write("Digite sua altura em centímetros: ");
        altura = double.parse(stdin.readLineSync()!);
        stdout.write("Digite seu peso em kg: ");
        peso = double.parse(stdin.readLineSync()!);
        calcularIMC(altura: altura, peso: peso);
        stdin.readLineSync();
        print("\x1B[2J\x1B[0;0H");
        break;

      case 2:
        stdout.write("Quantos termos você deseja na sequencia de Fibonacci? ");
        quantidade = int.parse(stdin.readLineSync()!);
        sequenciaFibonacciFor(quantidade, sequencia);
        sequencia.isEmpty ? print('Sequência vazia.') : print(sequencia);
        stdin.readLineSync();
        sequencia.clear();
        print("\x1B[2J\x1B[0;0H");
        break;

      case 3:
        stdout.write("Quantos termos você deseja na sequencia de Fibonacci? ");
        quantidade = int.parse(stdin.readLineSync()!);
        sequenciaFibonacciRecursiva(quantidade, sequencia);
        sequencia.isEmpty ? print('Sequência vazia.') : print(sequencia);
        stdin.readLineSync();
        sequencia.clear();
        print("\x1B[2J\x1B[0;0H");
        break;

      default:
        break;
    }
  }
  print('PROGRAMA FINALIZADO!');
}

List<int> sequenciaFibonacciFor(int quantidade, List<int> sequencia) {
  int atual = 0;
  int anterior = 0;

  for (int i = 0; i < quantidade; i++) {
    if (i == 1 || i == 2) {
      atual = 1;
      anterior = 0;
    }
    atual = atual + anterior;
    anterior = atual - anterior;
    sequencia.add(atual);
  }

  return sequencia;
}

List<int> sequenciaFibonacciRecursiva(int quant, List<int> sequencia) {
  int atual;
  if (quant == 0) return sequencia;
  if (sequencia.isEmpty) {
    sequencia.add(0);
    if (quant == 1) return sequencia;
  } else {
    if (sequencia.length == 1) {
      sequencia.add(1);
    } else {
      if (sequencia.length < quant) {
        atual = sequencia.last + sequencia[sequencia.length - 2];
        sequencia.add(atual);
      } else {
        if (sequencia.length == quant) return sequencia;
      }
    }
  }
  return sequenciaFibonacciRecursiva(quant, sequencia);
}

void calcularIMC({required double altura, required double peso}) {
  if (peso == 0 || altura == 0) {
    print('Valoes inválidos.');
    return;
  }

  altura = altura / 100;
  double imc = peso / (altura * altura);

  if (imc < 18.5) {
    print("Seu IMC é: ${imc.toStringAsFixed(2)}. Você está abaixo do peso ideal.");
  } else {
    if (imc >= 18.5 && imc < 25) {
      print("Seu IMC é: ${imc.toStringAsFixed(2)}. Você está no peso ideal.");
    } else {
      if (imc >= 25 && imc < 30) {
        print("Seu IMC é: ${imc.toStringAsFixed(2)}. Você está levemente acima do peso ideal.");
      } else {
        if (imc >= 30 && imc < 35) {
          print("Seu IMC é: ${imc.toStringAsFixed(2)}. Você está com obesidade grau I.");
        } else {
          if (imc >= 35 && imc < 40) {
            print("Seu IMC é: ${imc.toStringAsFixed(2)}. Você está com obesidade grau II.");
          } else {
            if (imc > 40) {
              print("Seu IMC é: ${imc.toStringAsFixed(2)}. Você está com obesidade grau III.");
            }
          }
        }
      }
    }
  }
}

double regraDeTres({double x1 = 0, double x2 = 0, double y1 = 0, double y2 = 0}) {
  // x1/x2 = y1/y2
  if (x1 == 0 && x2 != 0 && y1 != 0 && y2 != 0) {
    x1 = (y1 * x2) / y2;
    return x1;
  } else {
    if (x1 != 0 && x2 == 0 && y1 != 0 && y2 != 0) {
      x2 = (x1 * y2) / y1;
      return x2;
    } else {
      if (x1 != 0 && x2 != 0 && y1 == 0 && y2 != 0) {
        y1 = (x1 * y2) / x2;
        return y1;
      } else {
        if (x1 != 0 && x2 != 0 && y1 != 0 && y2 == 0) {
          y2 = (y1 * x2) / x1;
          return y2;
        } else {
          print("Valores inválidos.");
          return 0;
        }
      }
    }
  }
}

