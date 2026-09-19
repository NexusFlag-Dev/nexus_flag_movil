import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../type_defs.dart';
import 'failures.dart';
import 'exceptions.dart';

/// Clase estática manejar excepciones
class ExceptionHandler {

  /// llamadas a API (Dio/Retrofit)
  static FutureEither<T> handleRemote<T>(Future<T> Function() apiCall) async {
    try {
      final result = await apiCall();
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on SocketException {
      return const Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  /// llamadas a Base de Datos Local (ObjectBox)
  static FutureEither<T> handleLocal<T>(Future<T> Function() dbCall) async {
    try {
      final result = await dbCall();
      return Right(result);
    } catch (e) {
      // ObjectBox a veces lanza excepciones nativas, las atrapamos aquí
      return Left(CacheFailure(e.toString()));
    }
  }

  /// Lógica interna para mapear errores de Dio a Failures limpios
  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('Tiempo de espera agotado');

      case DioExceptionType.connectionError:
        return const NetworkFailure('Error de conexión con el servidor');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        // Obtener el mensaje de error que manda el backend
        String message = 'Error en el servidor';
        if (data is Map && data.containsKey('message')) {
          message = data['message'];
        } else if (data is String) {
          message = data;
        }

        return ServerFailure(message, statusCode: statusCode);

      case DioExceptionType.cancel:
        return const UnknownFailure('La petición fue cancelada');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NetworkFailure();
        }
        return const UnknownFailure();

      default:
        return const UnknownFailure();
    }
  }
}