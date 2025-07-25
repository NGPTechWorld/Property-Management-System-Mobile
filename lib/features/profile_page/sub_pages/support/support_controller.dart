import 'package:get/get.dart';

class SupportController extends GetxController {
  var faqItems =
      <FAQItem>[
        FAQItem(
          question: 'هل يوجد تجول 360 درجة',
          answer: 'لا, عمو حسن لا يريد',
        ),
        FAQItem(
          question: 'هل يمكنني جدولة زيارة للعقار؟',
          answer:
              'نعم، يمكنك اختيار "طلب زيارة" على صفحة العقار وتحديد التاريخ والوقت المناسب.',
        ),
        FAQItem(
          question: 'ما هي طرق الدفع المتاحة؟',
          answer:
              'يمكنك الدفع عن طريق البطاقة الائتمانية، التحويل البنكي، أو الدفع عند الاستلام حسب سياسة المعلن.',
        ),
        FAQItem(
          question: 'هل الإعلانات موثوقة؟',
          answer:
              'نقوم بمراجعة العقارات المعلنة ونعرض فقط العقارات التي تم التحقق من معلوماتها.',
        ),
        FAQItem(
          question: 'كيف أبلغ عن إعلان مخالف؟',
          answer:
              'اضغط على زر "تبليغ" الموجود في صفحة الإعلان واختر سبب المخالفة.',
        ),
        FAQItem(
          question: 'هل يتوفر التطبيق باللغة الإنجليزية؟',
          answer: 'في نية إن شاء الله',
        ),
        FAQItem(
          question: 'هل يمكنني حفظ العقارات المفضلة؟',
          answer:
              'بالتأكيد! فقط اضغط على أيقونة القلب لحفظ العقار في المفضلة الخاصة بك.',
        ),
        FAQItem(
          question: 'هل توجد رسوم على استخدام التطبيق؟',
          answer:
              'التصفح مجاني تمامًا. قد يتم تطبيق رسوم عند حجز أو شراء العقار.',
        ),
        FAQItem(
          question: 'هل يمكنني التفاوض على السعر؟',
          answer:
              'يعتمد ذلك على المالك أو الوسيط. يمكنك التواصل معهم مباشرة والتفاوض.',
        ),
        FAQItem(
          question: 'كيف أعدل معلومات حسابي؟',
          answer:
              'من صفحة الحساب، اختر "تعديل المعلومات الشخصية" وقم بتحديث بياناتك.',
        ),
        FAQItem(
          question: 'كيف أحذف حسابي؟',
          answer:
              'يرجى التواصل مع فريق الدعم عبر "تواصل مع الدعم" لحذف حسابك نهائيًا.',
        ),
      ].obs;

  void toggleFAQ(int index) {
    faqItems[index].isExpanded = !faqItems[index].isExpanded;
    faqItems.refresh();
  }
}

class FAQItem {
  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  final String question;
  final String answer;
  bool isExpanded;
}
