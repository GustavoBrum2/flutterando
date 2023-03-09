// 26837036190

void main(List<String> args) {
  print(validarCpf('26837036190'));
  print(validarCpf('85712496798'));
  print(validarCpf('15726569482'));
  print(validarCpf('15490187522'));
  print(validarCpf('65658543002'));
}

bool validarCpf(String cpf) {
  print('');
  print("Original: $cpf");

  String cpfAux = cpf.substring(0, 9);
  cpfAux += (calcularDigito(cpfAux, 1)).toString();
  print("Com v1 $cpfAux");
  cpfAux += (calcularDigito(cpfAux, 2)).toString();
  print("Com v2 $cpfAux");

  if (cpfAux == cpf) return true;

  return false;
}

int calcularDigito(String cpf, int number) {
  int soma = 0;
  int j = 9 + number;
  int ver;

  for (int i = 0; i < j - 1; i++) {
    soma += (int.parse(cpf[i]) * (j - i));
  }

  ver = soma % 11;
  if (ver < 2) {
    ver = 0;
  } else {
    ver = 11 - ver;
  }

  return ver;
}
