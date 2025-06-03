import 'dart:io'; 

class Node<T> {
  T nodeValue; 
  Node<T>? left,right;
  
  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root; 

  BinaryTree() {
    root = null; 
  }

  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left); 
      printPostOrder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }
}

void main() {
  BinaryTree<String> btree = BinaryTree<String>();

  Node<String> nodeA = Node('a');
  Node<String> nodeB = Node('b');
  Node<String> nodeC = Node('c');
  Node<String> nodeD = Node('d');
  Node<String> nodeE = Node('e');

  Node<String> nodeMultiply = Node('*');
  nodeMultiply.left = nodeA;
  nodeMultiply.right = nodeB;

  Node<String> nodeSubtract = Node('-');
  nodeSubtract.left = nodeC;
  nodeSubtract.right = nodeD;

  Node<String> nodeDivide = Node('/');
  nodeDivide.left = nodeSubtract;
  nodeDivide.right = nodeE;

  btree.root = Node('+');
  btree.root!.left = nodeMultiply;
  btree.root!.right = nodeDivide;


  print("Post-order traversal (Postfix):");
  btree.printPostOrder(btree.root);
  print("\n(Expression: a b * c d - e / +)\n");
}