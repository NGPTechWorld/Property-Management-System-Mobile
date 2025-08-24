import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:property_ms/core/utils/widgets/app_button.dart';
import 'package:property_ms/features/onboarding/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        //  1
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Lottie.asset(
                  "assets/animations/Login.json",
                  height: 300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "مرحبًا بك في Propoly",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "اكتشف العقارات، وابحث عن أي عقار في مدينتك مع مزود خدمات بكل سهولة.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //  2
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Lottie.asset("assets/animations/Home.json", height: 300),
              ),
              const SizedBox(height: 20),
              const Text(
                "ابحث عن عقارك المثالي",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "تصفح المنازل والمكاتب والشقق في أي وقت ومن أي مكان.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //  3
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Lottie.asset(
                  "assets/animations/Login.json",
                  height: 300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "حفظ ومقارنة العقارات",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "ضع العلامة على المفضلة وقارن بين عقارين  بسهولة.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //  4
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Lottie.asset(
                  "assets/animations/Login.json",
                  height: 300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "ادِر قوائمك",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "أضف عقارات جديدة، وتابع المبيعات، ونظّم قوائمك بسهولة.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //  5
        PageViewModel(
          titleWidget: const SizedBox(),
          bodyWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Lottie.asset(
                  "assets/animations/Login.json",
                  height: 300,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "ابقَ على اطلاع",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "تلقى إشعارات فورية حول العقارات الجديدة، والرسائل، والتحديثات المهمة.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
      onDone: controller.completeOnboarding,
      onSkip: controller.completeOnboarding,
      showSkipButton: true,
      skip: const Text('تخطي'),
      next: const AppButton(text: 'التالي'),
      done: AppButton(text: 'ابدأ', onPressed: controller.completeOnboarding),
      globalBackgroundColor: Colors.white,
    );
  }
}
