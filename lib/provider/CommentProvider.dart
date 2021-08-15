import 'package:flutter/material.dart';
import 'package:insta/util/commentmodel.dart';

class CommentProvider extends ChangeNotifier {
  List<CommentModel> _items = [];

  List<CommentModel> get items {
    return _items;
  }

  int get count {
    return _items.length;
  }

  void setComment(List<CommentModel> items) {
    _items = items;
    notifyListeners();
  }
}
