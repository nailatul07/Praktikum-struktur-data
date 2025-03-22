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
static void insertionSort<T extends Comparable<T>>(List<T> arr) {
  for (int i = arr.length - 1; i >= 0; i--) {
    for (int j = i + 1, k = i; j < arr.length; j++) {
      if (arr[j].compareTo(arr[k]) > 0) {
        break;
      } else {
        T temp = arr[k];
        arr[k] = arr[j];
        arr[j] = temp;
        k = j;
      }
    }
  }
}

  static void display<T>(List<T> data) {
    for (T obj in data) {
      print(obj);
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
  Latihan.insertionSort(arr8);
  Duration elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Pengurutan:');
  Latihan.display(arr8);
  print('Waktu: ${elapsedTime.inMilliseconds} ms');
}
