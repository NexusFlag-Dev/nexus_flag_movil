import 'package:fpdart/fpdart.dart';
import 'error/failures.dart';

/// Definición de tipo para acortar: Future<Either<Failure, T>>
/// Uso: FutureEither<User> en lugar de escribir t0do el tipo largo.
typedef FutureEither<T> = Future<Either<Failure, T>>;

/// Definición simple para funciones que no retornan nada (Void)
typedef FutureVoid = FutureEither<void>;

abstract class UseCaseNoParams<Type> {
  FutureEither<Type> call();
}