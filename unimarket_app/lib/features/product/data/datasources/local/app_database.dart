import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:unimarket_app/features/product/data/datasources/local/dao/product_dao.dart';
import 'package:unimarket_app/features/product/data/models/product_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ProductModel])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
}
