import 'package:dchisel/dchisel.dart';
import 'dart:developer';
import 'package:uuid/uuid.dart';

class CategoryControllers {
  Future<Response> getAllCategory(Request request) async {
    var category = await DChiselDB().getAll('category');
    var logs = await category;
    log(logs.statusCode.toString());
    return category;
  }

  Future<Response> insert(Request request) async {
    var uuid = Uuid();
    var body = await request.body.asJson;
    var data = DChiselDB().create('category', data: {
      'uuid': uuid.v4(),
      'category_name': body['category_name'],
    });
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  Future<Response> update(Request request, String uuid) async {
    var jsonData = await request.body.asJson;
    var data =
        DChiselDB().update('category', data: jsonData, where: ['uuid', uuid]);
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }
}
