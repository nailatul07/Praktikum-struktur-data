import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  // Metode untuk melakukan traversal pre-order
 void printPreorder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }
}

void main() {
  BinaryTree btree = BinaryTree(); 
  
  btree.root = Node('A');
  btree.root!.left = Node('B');
  btree.root!.right = Node('C');
  btree.root!.left!.left = Node('D');
  btree.root!.left!.right = Node('E');
  btree.root!.right!.left = Node('F'); 
  btree.root!.right!.right = Node('J'); 
  btree.root!.left!.right!.left = Node('G');
  btree.root!.right!.left!.left = Node('H'); 

  print("Pre-order traversal dari Binary Tree adalah: ");
  btree.printPreorder(btree.root); 
  print(""); 
}