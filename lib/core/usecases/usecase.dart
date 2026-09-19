import '../type_defs.dart';

/// Interfaz genérica para Casos de Uso
/// [Type] es lo que retorna en caso de éxito (Right)
/// [Params] son los parámetros que necesita para ejecutarse
abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}

/// Clase auxiliar para usar cuando el UseCase no necesita parámetros
class NoParams {
  const NoParams();
}