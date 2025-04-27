import 'dart:io';

class Stack {
  List<String> elements = [];

  void push(String data) {
    elements.add(data);
  }

  String pop() {
    if (isEmpty()) {
      return '';
    } else {
      return elements.removeLast();
    }
  }

  bool isEmpty() {
    return elements.isEmpty;
  }

  void clear() {
    elements.clear();
  }
}

class Converter {
  void convertDecimal(int decimal) {
    String binary = decimal.toRadixString(2);
    String octal = decimal.toRadixString(8);
    String hexadecimal = decimal.toRadixString(16).toUpperCase();

    print('Hasil nilai biner = $binary');
    print('Hasil nilai oktal = $octal');
    print('Hasil nilai heksadesimal = $hexadecimal');
  }
}

void main() {
  print('Masukkan nilai desimal: ');
  int decimal = int.parse(stdin.readLineSync()!);

  Converter converter = Converter();
  converter.convertDecimal(decimal);
}