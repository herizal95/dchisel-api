import 'package:dchisel/dchisel.dart';

import '../controllers/ticketControllers.dart';

class TicketRoutes {
  DRoute route(prefix, droute) {
    // get all
    droute.get(
        '/', (Request req) async => TicketControllers().getAllTicket(req),
        prefix: prefix);

    // get:id
    droute.get(
        '/<uuid>',
        (Request req, String uuid) async => await DChiselDB()
            .getOption('ticket', like: false, where: ['uuid', uuid]),
        prefix: prefix);

    // by category
    droute.get(
        '/filter/<uuid>',
        (Request req, String uuid) async => await DChiselDB()
            .getOption('ticket', like: false, where: ['uuid', uuid]),
        prefix: prefix);

    // insert
    droute.post('/', (Request req) async => TicketControllers().insert(req),
        prefix: prefix);

    // update
    droute.put(
        '/<uuid>',
        (Request req, String uuid) async =>
            TicketControllers().update(req, uuid),
        prefix: prefix);

    // delete
    droute.delete(
        '/<uuid>',
        (Request req, String uuid) async =>
            await DChiselDB().deleteOption('ticket', where: ['uuid', uuid]),
        prefix: prefix);

    return droute;
  }
}

var ticket = TicketRoutes();
