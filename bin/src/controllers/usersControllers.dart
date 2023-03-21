import 'package:dchisel/dchisel.dart';
import 'dart:developer';

class UsersControllers {
  // get all
  Future<Response> getAllUser(Request request) async {
    var users = await DChiselDB().mappedQuery(
        query:
            'SELECT users.*, access.* FROM users LEFT OUTER JOIN access ON users.access_id=access.uuid',
        substitution: {});
    var logs = await users;
    log(logs.statusCode.toString());
    return users;
  }

  // create new
  Future<Response> insert(Request req) async {
    var body = await req.body.asJson;
    var data = DChiselDB().create('users', data: body);
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  // fucn update
  Future<Response> update(Request request, String uuid) async {
    var jsonData = await request.body.asJson;
    var data =
        DChiselDB().update('users', data: jsonData, where: ['uuid', uuid]);
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }
}
