import 'dart:io';

int pascal(int n, int k) {
  if (k == 0 || k == n) {
    return 1;
  } else {
    return pascal(n - 1, k - 1) + pascal(n - 1, k);
  }
}

void printPascal(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j <= i; j++) {
      stdout.write("${pascal(i, j)} ");
    }
    print("");
  }
}

void main() {
  int n = 6; 
  printPascal(n);
}
