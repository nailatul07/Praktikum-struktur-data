class Node<T> {
  T? nodeValue;
  Node<T>? next;
  Node(this.nodeValue);
}

class SingleLinkedList<T> {
  Node<T>? head;
  SingleLinkedList();
  void append(T value) {
    Node<T> newNode = Node(value);
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

  Node<T>? findNode(T data) {
    Node<T>? current = head;
    while (current != null) {
      if (current.nodeValue == data) {
        return current;
      }
      current = current.next;
    }
    return null;
  }
}

void main() {
  SingleLinkedList<int> list = SingleLinkedList<int>();
  list.append(10);
  list.append(20);
  list.append(30);
  print("List after adding elements:");

  list.display();
  
  print("\nFinding node with value 20:");
  Node<int>? foundNode = list.findNode(20);
  if (foundNode != null) {
    print("Found: ${foundNode.nodeValue}");
  } else {
    print("Node with value 20 not found");
  }
}
