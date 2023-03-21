import 'dart:io';

import 'package:dchisel/dchisel.dart';
import 'dart:developer';
import 'package:uuid/uuid.dart';

class TicketControllers {
  // get all
  Future<Response> getAllTicket(Request request) async {
    var ticket = await DChiselDB().mappedQuery(
        query:
            'SELECT ticket.*, events.*, category.* FROM ticket LEFT OUTER JOIN events ON ticket.events_id = events.uuid LEFT JOIN category ON ticket.category_id = category.uuid',
        substitution: {});
    var logs = await ticket;
    log(logs.statusCode.toString());
    return ticket;
  }

  // Filter by category
  Future<Response> getAllByCategory(Request request) async {
    var data = await DChiselDB().mappedQuery(
      query:
          'SELECT ticket.* FROM ticket LEFT JOIN category ON ticket.category_id = category.uuid WHERE ticket.category_id = category.uuid',
      substitution: {},
    );
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  // create new
  Future<Response> insert(Request req) async {
    var uuid = Uuid();
    var body = await req.body.asJson;
    var data = DChiselDB().create('ticket', data: {
      "uuid": uuid.v4(),
      "ticket_name": body['ticket_name'],
      "order_date": body['order_date'],
      "organizer": body['organizer'],
      "latitude": body['latitude'].toString(),
      "longitude": body['longitude'].toString(),
      "qr_code_order": body['qr_code_order'],
      "users_id": body['users_id'],
      "ticket_price": body['ticket_price'],
      "category_id": body['category_id'],
      "events_id": body['events_id'],
    });
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }

  // fucn update
  Future<Response> update(Request request, String uuid) async {
    var jsonData = await request.body.asJson;
    var data =
        DChiselDB().update('ticket', data: jsonData, where: ['uuid', uuid]);
    var logs = await data;
    log(logs.statusCode.toString());
    return data;
  }
}
