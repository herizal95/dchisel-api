import 'package:dchisel/dchisel.dart';

import 'src/routes/routes.dart';

Future<void> main(List<String> arguments) async {
  withHotreload(
      (() => DChisel().serve(getroutes: Routes().route(), serverPort: 8080)));
}
