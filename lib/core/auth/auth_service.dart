import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;



  AuthService() {
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Error al inicializar el inicio de sesión de Google: $e');
    }
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }


  /// Login con Google
  Future<String?> signInWithGoogleFirebase() async {
    await _ensureGoogleSignInInitialized();

    final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate(
      scopeHint: ['email'],
    );

    if (googleUser == null) throw Exception('Cancelado por el usuario');

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final authClient = _googleSignIn.authorizationClient;
    final authorization = await authClient.authorizationForScopes(['email']);

    final credential = GoogleAuthProvider.credential(
      accessToken: authorization?.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user?.getIdToken();
  }


  /// Login con email y contraseña
  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user?.getIdToken();
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      print('Error en inicio sesión con email: $e');
    }
    return null;
  }

  /// Registro con email y contraseña
  Future<String?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseAuth.instance.setLanguageCode("es");
      await userCredential.user!.sendEmailVerification();
      return userCredential.user?.getIdToken();
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      print('Error en registro con email: $e');
      return null;
    }
  }

  ///Enviar correo electronico de recuperación de cuenta
  Future<bool> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('last_email_sent_time', DateTime.now().millisecondsSinceEpoch);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  final int cooldownTime = 20;

  ///
  Future<bool> canSendEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSendMillis = prefs.getInt('last_email_sent_time') ?? 0;

    final lastSend = DateTime.fromMillisecondsSinceEpoch(lastSendMillis);
    final difference = DateTime.now().difference(lastSend).inSeconds;

    return difference >= cooldownTime;
  }


  /// 1. Obtener el usuario actual
  /// Devuelve el objeto User de Firebase si hay una sesión activa, o null si no hay nadie.
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  /// 2. Stream del estado de autenticación
  /// Este es el más importante para la UI. Escucha en tiempo real si el usuario
  /// entra o sale de la app.
  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  /// 3. Obtener el token de Firebase del usuario actual
  /// Útil para mandarlo a tu backend (Django) y validar que la petición es legítima.
  Future<String?> getIdToken() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // forceRefresh: true asegura que el token no esté expirado
        return await user.getIdToken(true);
      }
      return null;
    } catch (e) {
      print('Error al obtener el ID Token: $e');
      return null;
    }
  }

  /// 4. Cerrar sesión
  /// Limpia tanto la sesión de Firebase como la de Google para permitir cambiar de cuenta.
  Future<void> signOut() async {
    try {
      await _ensureGoogleSignInInitialized();
      // Es vital cerrar ambos para que la próxima vez Google te deje elegir cuenta
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
  }

}