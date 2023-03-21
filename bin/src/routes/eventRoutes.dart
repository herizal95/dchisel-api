import 'package:dchisel/dchisel.dart';
import '../controllers/eventControllers.dart';

class EventRoutes {
  DRoute route(prefix, droute) {
    //get all
    droute.get('/', (Request req) async => EventControllers().getAllEvent(req),
        prefix: prefix);
    // get:id
    droute.get(
        '/<uuid>',
        (Request req, String uuid) async => await DChiselDB()
            .getOption('events', like: false, where: ['uuid', uuid]),
        prefix: prefix);
    // insert
    droute.post('/', (Request req) async => EventControllers().insert(req),
        prefix: prefix);
    // update
    droute.put(
        '/<uuid>',
        (Request req, String uuid) async =>
            EventControllers().update(req, uuid),
        prefix: prefix);
    // delete
    droute.delete(
        '/<uuid>',
        (Request req, String uuid) async =>
            await DChiselDB().deleteOption('events', where: ['uuid', uuid]),
        prefix: prefix);

    return droute;
  }
}

var events = EventRoutes();
