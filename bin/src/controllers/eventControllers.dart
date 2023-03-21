import 'package:dchisel/dchisel.dart';
import 'dart:developer';
import 'package:uuid/uuid.dart';

class EventControllers {
  // get all
  Future<Response> getAllEvent(Request request) async {
    var data = await DChiselDB().getAll('events');
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  // create new
  Future<Response> insert(Request req) async {
    var uuid = Uuid();
    var body = await req.body.asJson;
    var data = DChiselDB().create('events', data: {
      "uuid": uuid.v4(),
      "event_name": body["event_name"],
      "description": body["description"],
      "organizer": body["organizer"],
      "location_adress": body["location_adress"],
      "latitude": body["latitude"].toString(),
      "longitude": body["longitude"].toString(),
      "date_time_start": body["date_time_start"],
      "date_time_end": body["date_time_end"]
    });
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  // update
  Future<Response> update(Request req, String uuid) async {
    var jsonData = await req.body.asJson;
    var data =
        DChiselDB().update('events', data: jsonData, where: ['uuid', uuid]);
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }
}
