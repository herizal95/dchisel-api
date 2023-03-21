import 'package:dchisel/dchisel.dart';

import '../controllers/categoryControllers.dart';

class CategoryRoutes {
  DRoute route(prefix, droute) {
    // get all
    droute.get(
        '/', (Request req) async => CategoryControllers().getAllCategory(req),
        prefix: prefix);

    // get:id
    droute.get(
        '/<uuid>',
        (Request req, String uuid) async => await DChiselDB()
            .getOption('category', like: false, where: ['uuid', uuid]),
        prefix: prefix);

    // insert
    droute.post('/', (Request req) async => CategoryControllers().insert(req),
        prefix: prefix);

    // update
    droute.put(
        '/<uuid>',
        (Request req, String uuid) async =>
            CategoryControllers().update(req, uuid),
        prefix: prefix);

    // delete
    droute.delete(
        '/<uuid>',
        (Request req, String uuid) async =>
            await DChiselDB().deleteOption('category', where: ['uuid', uuid]),
        prefix: prefix);

    return droute;
  }
}

var category = CategoryRoutes();
