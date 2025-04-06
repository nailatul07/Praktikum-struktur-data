int binarySearch(List<int> arr, int target) {
  int left = 0;
  int right = arr.length - 1;
  int comparisons = 0; 

  while (left <= right) {
    int mid = (left + right) ~/ 2;
    comparisons++; 
    if (arr[mid] == target) {
      return comparisons; 
    } else if (arr[mid] < target) {
      left = mid + 1; 
    } else if (arr[mid] > target) {
      right = mid - 1;
    }
  }
  return comparisons;
}
void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int target = 8;

  int comparisonsBinary = binarySearch(arr, target);
  print('Binary Search: Jumlah Perbandingan = $comparisonsBinary');
}