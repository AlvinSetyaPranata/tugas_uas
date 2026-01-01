import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_uas/main.dart';
import 'package:tugas_uas/screens/login_screen.dart';

void main() {
  testWidgets('App starts at Login Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we are on the LoginScreen
    expect(find.byType(LoginScreen), findsOneWidget);
    
    // Verify that we are NOT on the SplashScreen (unless it flashes very fast, but initialRoute is login)
    // Actually, checking for 'Masuk' text which is on LoginScreen
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Buat akun baru'), findsOneWidget);
  });
}
