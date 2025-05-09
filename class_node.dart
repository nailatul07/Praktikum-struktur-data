class Node<T> {
  T? nodeValue;
  Node<T>? next;

  Node() {
    nodeValue = null;
    next = null;
  }

  Node.withValue(T item) {
    nodeValue = item;
    next = null;
  }
}

class SingleLinkedList<T> {
  Node<T>? head;

  SingleLinkedList() {
    head = null;
  }

  void append(T value) {
    Node<T> newNode = Node.withValue(value);
    if (head == null) {
      head = newNode;
    } else {
      Node<T>? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
    }
  }

  void display() {
    Node<T>? current = head;
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }

  Node<T>? find(T value) {
    Node<T>? current = head;
    while (current != null) {
      if (current.nodeValue == value) {
        return current;
      }
      current = current.next;
    }
    return null;
  }

  void delete(T value) {
    if (head == null) return;

    // Jika head perlu dihapus
    if (head!.nodeValue == value) {
      head = head!.next;
      return;
    }

    Node<T>? current = head;
    while (current!.next != null) {
      if (current.next!.nodeValue == value) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }
}

void main() {
  SingleLinkedList<int> list = SingleLinkedList<int>();
  list.append(10);
  list.append(20);
  list.append(30);
  
  print("Daftar setelah menambahkan elemen:");
  list.display();
  
  print("\nMencari 20 dalam daftar:");
  Node<int>? foundNode = list.find(20);
  if (foundNode != null) {
    print("Ditemukan: ${foundNode.nodeValue}");
  } else {
    print("Tidak ditemukan");
  }
  
  print("\nDaftar setelah menghapus 20:");
  list.delete(20);
  list.display();
}