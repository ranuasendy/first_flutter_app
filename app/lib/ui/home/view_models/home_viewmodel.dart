import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel() {}

  WordPair _pair = WordPair.random();
  WordPair get pair => _pair;

  void getNext() {
    _pair = WordPair.random();
    notifyListeners();
  }
}