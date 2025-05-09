class DNode {
  dynamic data;
  DNode? prev;
  DNode? next;
  DNode(this.data);
}

class DoubleLinkedList {
  DNode? head;

  void tambahNode_SebelumBacaMundur(DNode newNode, DNode? target) {
    if (head == null) {
      head = newNode;
      return;
    }
    DNode? current = head;
    while (current != null && current != target) {
      current = current.next;
    }
    if (current == null && target != null) {
      print("Node target tidak ditemukan dalam list.");
      return;
    }
    if (current?.prev != null) {
      current!.prev!.next = newNode;
      newNode.prev = current.prev;
    } else {
      head = newNode;
    }
    newNode.next = current;
    current?.prev = newNode;
  }

  void display() {
    DNode? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  DoubleLinkedList list = DoubleLinkedList();
  DNode node1 = DNode(1);
  DNode node2 = DNode(2);
  DNode node3 = DNode(3);

  list.tambahNode_SebelumBacaMundur(node3, null);
  list.tambahNode_SebelumBacaMundur(node2, list.head); 
  list.tambahNode_SebelumBacaMundur(node1, list.head);

  print("List:");
  list.display();
}