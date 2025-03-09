import 'dart:io';

void kombinasi(String s, int n, String hasil) {
  if (hasil.length == n) {
    stdout.write("$hasil "); 
    return;
  }
  for (int i = 0; i < s.length; i++) {
    kombinasi(s, n, hasil + s[i]);
  }
}

void main() {
  int n = 3;
  String karakter = "abc"; 
  print("Jumlah karakter = $n");
  kombinasi(karakter, n, "");
  print("\nBUILD SUCCESSFUL\n(total time: 1 second)");
}

