class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    return this.nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'NRP: $nrp, Nama: $nama';
  }
}

class Latihan {
  static void selectionSort<T extends Comparable<T>>(List<T> arr) {
    T temp;
    for (int i = arr.length - 1; i >= 0; i--) {
      int max = i;
      for (int j = i - 1; j >= 0; j--) {
        if (arr[j].compareTo(arr[max]) > 0) max = j;
      }
      temp = arr[i];
      arr[i] = arr[max];
      arr[max] = temp;
    }
  }

  static void display<T>(List<T> data) {
    for (T objek in data) {
      print('$objek');
    }
    print('');
  }
}

void main() {
  List<Mahasiswa> arr8 = [
    Mahasiswa("02", "Budi"),
    Mahasiswa("01", "Andi"),
    Mahasiswa("04", "Udin"),
    Mahasiswa("03", "Candra"),
  ];

  print('Data Sebelum Pengurutan:');
  Latihan.display(arr8);
  DateTime start = DateTime.now();
  Latihan.selectionSort(arr8);
  Duration elapsedTime = DateTime.now().difference(start);
  
  print('Data Setelah Pengurutan:');
  Latihan.display(arr8);
  print('Waktu: ${elapsedTime.inMilliseconds} ms');
}