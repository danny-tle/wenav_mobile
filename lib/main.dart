import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/verify_email_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/change_password_screen.dart';
import 'screens/onboarding/add_caregiver_onboarding_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/walk/recording_screen.dart';
import 'screens/walk/report_problem_screen.dart';
import 'screens/caregiver/caregiver_screen.dart';
import 'screens/caregiver/pairing_code_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/settings/privacy_policy_screen.dart';
import 'screens/settings/terms_screen.dart';
import 'screens/settings/delete_account_screen.dart';

void main() {
  runApp(const WeNavApp());
}

class WeNavApp extends StatelessWidget {
  const WeNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeNav',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5C00F2),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/verify-email': (context) => const VerifyEmailScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/onboarding/caregiver': (context) => const AddCaregiverOnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/walk/recording': (context) => const RecordingScreen(),
        '/walk/report': (context) => const ReportProblemScreen(),
        '/caregiver': (context) => const CaregiverScreen(),
        '/caregiver/pairing-code': (context) => const PairingCodeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/settings/privacy-policy': (context) => const PrivacyPolicyScreen(),
        '/settings/terms': (context) => const TermsScreen(),
        '/settings/delete-account': (context) => const DeleteAccountScreen(),
      },
    );
  }
}
