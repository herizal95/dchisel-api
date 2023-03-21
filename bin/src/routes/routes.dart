import 'package:dchisel/dchisel.dart';

import '../database/config.dart';
import 'accessRoutes.dart';
import 'eventRoutes.dart';
import 'usersRoutes.dart';
import 'categoryRoutes.dart';
import 'ticketRoutes.dart';

class Routes {
  DRoute route() {
    var baseUrl = '/api/v1';
    Database().config();
    var droute = DRoute();
    droute.get('/', (Request req) async => resOk("Hello, Btix"));
    // routes
    users.route('$baseUrl/users', droute);
    access.route('$baseUrl/access', droute);
    events.route('$baseUrl/events', droute);
    category.route('$baseUrl/category', droute);
    ticket.route('$baseUrl/ticket', droute);

    return droute;
  }
}
