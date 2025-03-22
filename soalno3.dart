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
  static int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
    int i, j;
    T pivot, temp;
    pivot = arr[p];
    i = p;
    j = r;
    while (i <= j) {
      while (pivot.compareTo(arr[j]) < 0) j--;
      while (pivot.compareTo(arr[i]) > 0) i++;
      if (i < j) {
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        j--;
        i++;
      } else {
        return j;
      }
    }
    return j;
  }

  static void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
    int q;
    if (p < r) {
      q = partition(arr, p, r);
      quickSort(arr, p, q); 
      quickSort(arr, q + 1, r);
    }
  }

  static void tampil<T>(List<T> data) {
    for (T Object in data) {
      print('$Object');
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

  DateTime startTime = DateTime.now();
  Latihan.quickSort(arr8, 0, arr8.length - 1);
  Duration elapsedTime = DateTime.now().difference(startTime);

  Latihan.tampil(arr8);
  print('Waktu: ${elapsedTime.inMilliseconds} ');
}
