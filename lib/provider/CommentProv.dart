import 'package:flutter/material.dart';
import 'package:insta/util/CommentsModel.dart';
import 'package:insta/util/commentmodel.dart';

class CommentProv extends ChangeNotifier {
  List<Comment> _items = [];

  List<Comment> get items {
    return _items;
  }

  int get count {
    return _items.length;
  }

  void setComment(List<Comment> items) {
    _items = items;
    notifyListeners();
  }
}
