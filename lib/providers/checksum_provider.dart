import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

class HashMethodChoice {
  final String name;
  final Hash method;

  bool isSelect;

  HashMethodChoice({
    required this.name,
    required this.method,
    this.isSelect = false,
  });
}

class ChecksumResuld {
  final File file;
  final Map<Hash, Digest> checksumMap;

  ChecksumResuld({required this.file}) : checksumMap = const {};
}

class ChecksumProvider with ChangeNotifier {
  final List<HashMethodChoice> hashMethodChoices = [
    HashMethodChoice(name: "md5", method: md5, isSelect: true),
    HashMethodChoice(name: "sha1", method: sha1),
    HashMethodChoice(name: "sha224", method: sha224),
    HashMethodChoice(name: "sha256", method: sha256, isSelect: true),
    HashMethodChoice(name: "sha384", method: sha384),
    HashMethodChoice(name: "sha512", method: sha512),
    HashMethodChoice(name: "sha512224", method: sha512224),
    HashMethodChoice(name: "sha512256", method: sha512256),
  ];

  bool _isProcessing;
  String? _pathToFile;
  final _resList = const <ChecksumResuld>[];

  ChecksumProvider() : _isProcessing = false;

  bool get isProcessin => _isProcessing;
  List<ChecksumResuld> get resList => _resList;
  String? get pathToFile => _pathToFile;

  set pathToFile(String? val) {
    if (val != null) {
      _pathToFile = val;
      notifyListeners();
    }
  }

  void onSelectHashMethods(int index) {
    hashMethodChoices[index].isSelect = !hashMethodChoices[index].isSelect;
    notifyListeners();
  }

  void _pushRes(ChecksumResuld res) {
    _resList.insert(0, res);
    _isProcessing = false;
    notifyListeners();
  }

  Future<void> calculate() async {
    _isProcessing = true;
    notifyListeners();
  }
}
