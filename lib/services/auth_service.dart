
class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isLoggedIn = false;
  bool _isSessionExpired = true; // Default to expired/no session on start

  bool get isLoggedIn => _isLoggedIn;
  bool get isSessionExpired => _isSessionExpired;

  // Mock login
  Future<void> login() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    _isLoggedIn = true;
    _isSessionExpired = false;
  }

  // Mock logout
  Future<void> logout() async {
    _isLoggedIn = false;
    _isSessionExpired = true;
  }
  
  // Mock check session
  Future<bool> checkSession() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // In a real app, we would check a token here.
    // For now, it returns the in-memory state.
    // Since state resets on restart, it will always be expired on first launch.
    return !_isSessionExpired;
  }
}
