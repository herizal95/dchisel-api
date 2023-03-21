import 'package:dchisel/dchisel.dart';

class Database {
  void config() {
    DChiselDB().configDB('postgre',
        host: 'localhost',
        db: 'dbname',
        port: 5432,
        username: 'userDB',
        password: 'passwordDB');
  }
}
