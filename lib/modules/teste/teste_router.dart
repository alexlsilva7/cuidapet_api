import 'package:cuidapet_api/application/routes/i_rounter.dart';
import 'package:cuidapet_api/modules/teste/teste_controller.dart';
import 'package:shelf_router/shelf_router.dart';

class TesteRouter implements IRouter {
  @override
  void configureRoutes(Router router) {
    router.mount('/hello/', TesteController().router);
  }
}
