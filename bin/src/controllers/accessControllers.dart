import 'package:dchisel/dchisel.dart';
import 'dart:developer';
import 'package:uuid/uuid.dart';

class AccessControllers {
  Future<Response> getAllAccess(Request request) async {
    var access = await DChiselDB().getAll('access');
    var logs = await access;
    log(logs.statusCode.toString());
    return access;
  }

  Future<Response> insert(Request request) async {
    var uuid = Uuid();
    var body = await request.body.asJson;
    var data = DChiselDB().create('access', data: {
      'uuid': uuid.v4(),
      'access_name': body['access_name'],
      'allowed': body['allowed']
    });
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  Future<Response> update(Request request, String uuid) async {
    var jsonData = await request.body.asJson;
    var data =
        DChiselDB().update('access', data: jsonData, where: ['uuid', uuid]);
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }
}
