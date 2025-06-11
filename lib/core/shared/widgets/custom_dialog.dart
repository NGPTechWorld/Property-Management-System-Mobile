// import 'package:flutter/material.dart';

// import '../../../features/auth/presentation/widgets/animated_raised_button.dart';

// class SuccessDialog extends StatelessWidget {
//   final String title;
//   final String? message;
//   final String buttonText;
//   final VoidCallback onButtonPressed;
//   final IconData icon;
//   final Duration transitionDuration;
//   final bool barrierDismissible;
//   final Color? backgroundColor;
//   final Color? iconBackgroundColor;
//   final Color? iconColor;
//   final Color? buttonBackgroundColor;
//   final Color? buttonForegroundColor;
//   final Color? buttonShadowColor;

//   const SuccessDialog({
//     Key? key,
//     required this.title,
//     this.message,
//     required this.buttonText,
//     required this.onButtonPressed,
//     this.icon = Icons.check_circle_outline,
//     this.transitionDuration = const Duration(milliseconds: 400),
//     this.barrierDismissible = false,
//     this.backgroundColor,
//     this.iconBackgroundColor,
//     this.iconColor,
//     this.buttonBackgroundColor,
//     this.buttonForegroundColor,
//     this.buttonShadowColor,
//   }) : super(key: key);

//   /// Shows the success dialog
//   static Future<void> show({
//     required BuildContext context,
//     required String title,
//     String? message,
//     required String buttonText,
//     required VoidCallback onButtonPressed,
//     IconData icon = Icons.check_circle_outline,
//     Duration transitionDuration = const Duration(milliseconds: 400),
//     bool barrierDismissible = false,
//     Color? backgroundColor,
//     Color? iconBackgroundColor,
//     Color? iconColor,
//     Color? buttonBackgroundColor,
//     Color? buttonForegroundColor,
//     Color? buttonShadowColor,
//   }) {
//     return showGeneralDialog(
//       context: context,
//       barrierDismissible: barrierDismissible,
//       transitionDuration: transitionDuration,
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return ScaleTransition(
//           scale: CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeInOut,
//           ),
//           child: SuccessDialog(
//             title: title,
//             message: message,
//             buttonText: buttonText,
//             onButtonPressed: onButtonPressed,
//             icon: icon,
//             backgroundColor: backgroundColor,
//             iconBackgroundColor: iconBackgroundColor,
//             iconColor: iconColor,
//             buttonBackgroundColor: buttonBackgroundColor,
//             buttonForegroundColor: buttonForegroundColor,
//             buttonShadowColor: buttonShadowColor,
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
    
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       backgroundColor: backgroundColor,
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: iconBackgroundColor ?? theme.colorScheme.primary.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon,
//               size: 48,
//               color: iconColor ?? theme.colorScheme.primary,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           if (message != null) ...[
//             const SizedBox(height: 8),
//             Text(
//               message!,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: theme.colorScheme.outline,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//           const SizedBox(height: 24),
//           _buildButton(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(BuildContext context) {
//     final theme = Theme.of(context);
    
//     // Check if AnimatedRaisedButton is available
//     try {
//       return AnimatedRaisedButton(
//         onPressed: onButtonPressed,
//         text: buttonText,
//         backgroundColor: buttonBackgroundColor ?? theme.colorScheme.primary,
//         foregroundColor: buttonForegroundColor ?? theme.colorScheme.onPrimary,
//         shadowColor: buttonShadowColor,
//       );
//     } catch (e) {
//       // Fallback to ElevatedButton if AnimatedRaisedButton is not available
//       return ElevatedButton(
//         onPressed: onButtonPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: buttonBackgroundColor ?? theme.colorScheme.primary,
//           foregroundColor: buttonForegroundColor ?? theme.colorScheme.onPrimary,
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//         ),
//         child: Text(buttonText),
//       );
//     }
//   }
// }