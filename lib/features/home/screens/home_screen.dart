import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flowva_app/core/resources/colors.dart';
import 'package:flowva_app/core/resources/drawables.dart';
import 'package:flowva_app/core/widgets/custom_image.dart';
import 'package:flowva_app/core/widgets/svg_image.dart';
import 'package:flowva_app/core/widgets/text_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  late Duration _timeLeft;

  final DateTime _targetDate = DateTime.now().add(const Duration(days: 4));

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeLeft();
    });
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    final difference = _targetDate.difference(now);

    if (difference.isNegative) {
      setState(() {
        _timeLeft = Duration.zero;
      });
      _timer?.cancel();
    } else {
      setState(() {
        _timeLeft = difference;
      });
    }
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeColor,
      body: Stack(
        children: [
          Row(
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.14159),
                    child: CustomImage(asset: imgHomeOverlay, color: white),
                  ),
                ),
              ),

              Flexible(
                child: Align(
                  alignment: Alignment.topRight,
                  child: CustomImage(asset: imgHomeOverlay, color: white),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back, size: 20, color: white),
                      Flexible(
                        child: BoldText(
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          text: 'Enter to win the Oraimo OpenSnap!',
                          fontSize: 24,
                          fontColor: white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Column(
                              children: [
                                CustomImage(asset: imgEarpod),
                                SvgImage(asset: icBox),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'DRAW ENDS IN',
                                  style: TextStyle(
                                    color: white.withValues(alpha: 0.6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildTimeBox(
                                      _formatNumber(_timeLeft.inDays),
                                      'Days',
                                    ),
                                    _buildSeparator(),
                                    _buildTimeBox(
                                      _formatNumber(_timeLeft.inHours % 24),
                                      'Hours',
                                    ),
                                    _buildSeparator(),
                                    _buildTimeBox(
                                      _formatNumber(_timeLeft.inMinutes % 60),
                                      'Mins',
                                    ),
                                    _buildSeparator(),
                                    _buildTimeBox(
                                      _formatNumber(_timeLeft.inSeconds % 60),
                                      'Secs',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5D2E95),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '4,327 USERS HAVE ENTERED SO FAR',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(color: Color(0xFF3d1572)),
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Transform.rotate(
                                        angle: -pi / 12,
                                        child: CustomImage(
                                          asset: imgAnnouncement,
                                          width: 37,
                                          height: 40,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'QUALIFICATION RULE',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Invite at least 2 friends who sign up\nthrough your link to qualify.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white.withValues(alpha: 0.8),
                                          fontSize: 14,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 24,
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5A2D81),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: black.withValues(alpha: 0.2),
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0x26FFFFFF),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                        ),
                                        child: ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.person_add,
                                            color: black,
                                          ),
                                          label: Text(
                                            'Invite Friends Now',
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: white,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24,
                                              vertical: 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            elevation: 0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0x0DFFFFFF),
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 10,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomImage(
                                              asset: imgAvatar,
                                              height: 24,
                                              width: 24,
                                            ),
                                            Container(
                                              color: Color(0x0DFFFFFF),
                                              width: 2,
                                              height: 18,
                                            ),
                                            SvgImage(
                                              asset: icPerson,
                                              height: 20,
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Once your second friend joins, you\'re\nautomatically entered.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white.withValues(alpha: 0.4),
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Text(
                                        'Invite your friends quick & easy.',
                                        style: TextStyle(
                                          color: white.withValues(alpha: 0.9),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text: 'https://Bravoo.ref.12419',
                                            ),
                                          );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Link copied to clipboard!',
                                              ),
                                              backgroundColor: primaryColor,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: white.withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'https://Bravoo.ref.12419',
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SvgImage(
                                                asset: icCopy,
                                                height: 16,
                                                width: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: 16,
                                        children: [
                                          _buildSocialButton(
                                            icon: imgWhatsApp,
                                            color: Color(0xFF4CAF50),
                                            label: 'Whatsapp',
                                          ),
                                          _buildSocialButton(
                                            icon: imgTwitter,
                                            color: black,
                                            label: 'X (Twitter)',
                                          ),
                                          _buildSocialButton(
                                            icon: imgLinkedIn,
                                            color: Color(0xFF0077B5),
                                            label: 'Linkedin',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      Divider(
                                        color: white.withValues(alpha: 0.1),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            'You referred',
                                            style: TextStyle(
                                              color: white.withValues(
                                                alpha: 0.9,
                                              ),
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Icon(
                                            Icons.info_outline,
                                            color: white.withValues(alpha: 0.9),
                                            size: 16,
                                          ),
                                          Spacer(),
                                          SvgImage(
                                            asset: icMultiPerson,
                                            height: 16,
                                            width: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              color: white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF4A148C).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: white.withValues(alpha: 0.1), width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              color: white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: white.withValues(alpha: 0.6),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Text(
            ':',
            style: TextStyle(
              color: white.withValues(alpha: 0.5),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required Color color,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [primaryColor, homeColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Coming soon',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 30),
          ),
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color(0x3DFFFFFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(asset: icon, height: 32, width: 32),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: white.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
