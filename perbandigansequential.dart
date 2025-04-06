int SequentialSearch(List<int> arr, int target) {
  int comparisons = 0;
  for (int i = 0; i < arr.length; i++) {
    comparisons++; 
    if (arr[i] == target) {
      return comparisons;
    }
  }
  return comparisons;
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int target = 6;

  
  int comparisonsSequential = SequentialSearch(arr, target);
  print('Linear Search: Jumlah Perbandingan = $comparisonsSequential');
}