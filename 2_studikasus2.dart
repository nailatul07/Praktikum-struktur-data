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
  btree.root!.right!.left = Node('E');
  btree.root!.right!.right = Node('F');
  btree.root!.left!.left!.left = Node('G'); 
  btree.root!.right!.left!.left = Node('H'); 
  btree.root!.right!.left!.right = Node('I');

  print("Preorder dari Binary Tree adalah: ");
  btree.printPreorder(btree.root);
  print(""); 
}
