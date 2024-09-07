import 'package:flutter/material.dart';
import 'dart:math';

import 'package:e_commerce_project/constants/app_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryCream,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _animation.value * 2 * pi,
                  child: child,
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Charly\'s Hideout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBurgundy,
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryBurgundy),
                backgroundColor: AppColors.secondaryGold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Loading your gear...',
              style: TextStyle(
                color: AppColors.secondaryGold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
