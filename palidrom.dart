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
}

class PalindromeChecker {
  void checkPalindrome(String sentence) {
    Stack stack = Stack();
    
    for (int i = 0; i < sentence.length; i++) {
      stack.push(sentence[i]);
    }

    String reversed = '';
    while (!stack.isEmpty()) {
      reversed += stack.pop();
    }

    print('Hasil = $reversed');

    if (sentence.replaceAll(' ', '') == reversed.replaceAll(' ', '')) {
      print('Palindrom');
    } else {
      print('Bukan palindrom');
    }
  }
}

void main() {
  print('Masukkan kalimat: ');
  String sentence = stdin.readLineSync()!;
  
  PalindromeChecker checker = PalindromeChecker();
  checker.checkPalindrome(sentence);
}