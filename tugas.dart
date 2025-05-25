import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  void insertRoot(T newValue) {
    Node<T> newNode = Node(newValue);
    if (root == null) {
      root = newNode;
    } else {
      print("Root Binary Tree sudah terisi");
    }
  }

  // Insert berdasarkan level order
  void levelOrderInsertion(T newValue) {
    Node<T> newNode = Node(newValue);
    if (root == null) {
      root = newNode;
      return;
    }
    List<Node<T>> queue = [];
    queue.add(root!);
    while (queue.isNotEmpty) {
      Node<T> current = queue.removeAt(0);
      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }
      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

  // Insert berdasarkan target
  bool insertByTarget(T dataBaru, T target) {
    Node<T>? nodeTarget = _linearSearch(root, target);
    if (nodeTarget == null) return false;

    if (nodeTarget.left == null) {
      nodeTarget.left = Node(dataBaru);
      return true;
    } else if (nodeTarget.right == null) {
      nodeTarget.right = Node(dataBaru);
      return true;
    }
    return false;
  }

  Node<T>? _linearSearch(Node<T>? node, T target) {
    if (node == null) return null;
    if (node.nodeValue == target) {
      return node;
    }
    Node<T>? foundNode = _linearSearch(node.left, target);
    if (foundNode != null) return foundNode;
    return _linearSearch(node.right, target);
  }

  // Traversal pre-order non-rekursif
  void preOrderNonRekursif(Node<T>? root) {
    if (root == null) return;

    List<Node<T>> stack = [root];

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      stdout.write('${current.nodeValue} ');

      if (current.right != null) {
        stack.add(current.right!);
      }
      if (current.left != null) {
        stack.add(current.left!);
      }
    }
  }

  // Traversal in-order non-rekursif
  void inOrderNonRekursif(Node<T>? node) {
    if (node == null) return;

    List<Node<T>> s = [];
    Node<T>? curr = node;

    while (curr != null || s.isNotEmpty) {
      while (curr != null) {
        s.add(curr);
        curr = curr.left;
      }
      curr = s.removeLast();
      stdout.write('${curr.nodeValue} ');
      curr = curr.right;
    }
  }

  // Traversal post-order non-rekursif
  void postorderNonRekursif(Node<T>? root) {
    if (root == null) return;

    List<Node<T>> stack = [];
    Node<T>? lastVisited = null;

    while (stack.isNotEmpty || root != null) {
      while (root != null) {
        stack.add(root);
        root = root.left;
      }
      Node<T> current = stack.last;
      if (current.right == null || current.right == lastVisited) {
        stdout.write('${current.nodeValue} ');
        stack.removeLast();
        lastVisited = current;
      } else {
        root = current.right;
      }
    }
  }

  // Pre-order traversal rekursif
  void printPreorder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  // In-order traversal rekursif
  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue} ');
      printInOrder(node.right);
    }
  }

  // Post-order traversal rekursif
  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }
}

void main() {
  BinaryTree Btree = BinaryTree();

  Btree.root = Node("a");
  Btree.root!.left = Node(1);
  Btree.root!.left!.left = Node(3);
  Btree.root!.left!.right = Node(4);
  Btree.root!.right = Node(2);
  Btree.root!.right!.left = Node(5);

  print("PreOrder traversal: ");
  Btree.printPreorder(Btree.root);

  print("\nInorder traversal: ");
  Btree.printInOrder(Btree.root);

  print("\nPostOrder traversal: ");
  Btree.printPostOrder(Btree.root);

  print("\nnPreOrder Non-Rekursif: ");
  Btree.preOrderNonRekursif(Btree.root);

  print("\nInOrder Non-Rekursif: ");
  Btree.inOrderNonRekursif(Btree.root);

  print("\PostOrder Non-Rekursif: ");
  Btree.postorderNonRekursif(Btree.root);

  Btree.levelOrderInsertion(7);
  print('\nPost Order Traversal setelah Level Order: ');
  Btree.printPostOrder(Btree.root);

  Btree.insertByTarget(6, 3);
  print("\nPre Order Non-rekursif setelah insertByTarget: ");
  Btree.preOrderNonRekursif(Btree.root);
}
