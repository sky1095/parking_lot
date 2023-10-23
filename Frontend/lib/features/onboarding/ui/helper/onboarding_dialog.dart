import 'package:flutter/material.dart';

import '../onboarding_page.dart';

class OnboardingDialog {
  static Future<void> showOnboardingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialoagContext) {
        return const OnbordingPage();
      },
    );
  }
}
