import 'package:dchisel/dchisel.dart';
import '../controllers/accessControllers.dart';

class AccessRoutes {
  DRoute route(prefix, droute) {
    //get all
    droute.get(
        '/', (Request req) async => AccessControllers().getAllAccess(req),
        prefix: prefix);
    // get:id
    droute.get(
        '/<uuid>',
        (Request req, String uuid) async => await DChiselDB()
            .getOption('access', like: false, where: ['uuid', uuid]),
        prefix: prefix);
    // insert
    droute.post('/', (Request req) async => AccessControllers().insert(req),
        prefix: prefix);
    // update
    droute.put(
        '/<uuid>',
        (Request req, String uuid) async =>
            AccessControllers().update(req, uuid),
        prefix: prefix);
    // delete
    droute.delete(
        '/<uuid>',
        (Request req, String uuid) async =>
            await DChiselDB().deleteOption('access', where: ['uuid', uuid]),
        prefix: prefix);

    return droute;
  }
}

var access = AccessRoutes();
