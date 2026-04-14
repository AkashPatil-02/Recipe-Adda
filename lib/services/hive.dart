import 'dart:io';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HiveServices {
  final _uuid = const Uuid();
  final Box _dataBox = Hive.box('bookmarks');

 
  String writeData(File image, Map<String, dynamic> recipe) {
    final id = _uuid.v4();
    _dataBox.put(id, {
      'imagePath': image.path,   
      'recipe': recipe,
    });
    return id;
  }

  Map<String, dynamic>? readData(String id) {
    final data = _dataBox.get(id);
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }


  List<Map<String, dynamic>> readAll() {
    return _dataBox.keys.map((key) {
      final data = Map<String, dynamic>.from(_dataBox.get(key));
      data['id'] = key; // attach the key so you can delete it later
      return data;
    }).toList();
  }

  void deleteData(String id) {
    _dataBox.delete(id);
  }

  void clearAll() {
    _dataBox.clear();
  }
}