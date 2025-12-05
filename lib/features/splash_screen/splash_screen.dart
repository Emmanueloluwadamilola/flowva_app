import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flowva_app/core/extensions/navigation.dart';
import 'package:flowva_app/core/resources/colors.dart';
import 'package:flowva_app/core/resources/drawables.dart';
import 'package:flowva_app/core/widgets/svg_image.dart';
import 'package:flowva_app/features/auth/screens/login_screen.dart';
import 'package:flowva_app/features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward();
    _checkSession();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkSession() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final session = Supabase.instance.client.auth.currentSession;
    final prefs = await SharedPreferences.getInstance();
    final hasLoggedExplicitly =
        prefs.getBool('has_logged_in_explicitly') ?? false;

    if (session != null && hasLoggedExplicitly) {
      context.pushReplacement(const HomeScreen());
    } else {
      context.pushReplacement(const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FadeTransition(
            opacity: _controller,
            child: SvgImage(asset: icAppLogo),
          ),
        ),
      ),
    );
  }
}
