import 'package:dchisel/dchisel.dart';

import '../controllers/usersControllers.dart';

class UsersRoutes {
  DRoute route(prefix, droute) {
    // get all
    droute.get('/', (Request req) async => UsersControllers().getAllUser(req),
        prefix: prefix);

    // get:id
    droute.get(
        '/<uuid>',
        (Request req, String uuid) async => await DChiselDB()
            .getOption('users', like: false, where: ['uuid', uuid]),
        prefix: prefix);

    // insert
    droute.post('/', (Request req) async => UsersControllers().insert(req),
        prefix: prefix);

    // update
    droute.put(
        '/<uuid>',
        (Request req, String uuid) async =>
            UsersControllers().update(req, uuid),
        prefix: prefix);

    // delete
    droute.delete(
        '/<uuid>',
        (Request req, String uuid) async =>
            await DChiselDB().deleteOption('users', where: ['uuid', uuid]),
        prefix: prefix);

    return droute;
  }
}

var users = UsersRoutes();
