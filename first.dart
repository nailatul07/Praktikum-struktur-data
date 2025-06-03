class TreeNode {
  int value;
  TreeNode? left, right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int value) {
    root = _insertRec(root, value);
  }

  TreeNode? _insertRec(TreeNode? root, int value) {
    if (root == null) {
      return TreeNode(value);
    }

    if (value < root.value) {
      root.left = _insertRec(root.left, value);
    } else if (value > root.value) {
      root.right = _insertRec(root.right, value);
    }

    return root;
  }

  int first() {
    TreeNode? current = root;

    while (current!.left != null) {
      current = current.left;
    }

    return current.value;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print("Nilai terkecil dalam BST: ${bst.first()}");
}
