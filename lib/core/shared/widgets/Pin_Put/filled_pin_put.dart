import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

//Filled
class FilledPinPut extends StatefulWidget {
  const FilledPinPut({super.key});

  @override
  State<FilledPinPut> createState() => _FilledPinPutState();

  @override
  String toStringShort() => 'Filled';
}

class _FilledPinPutState extends State<FilledPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: TextStyle(fontSize: 20, color: Colors.white),
      decoration: BoxDecoration(color: Color.fromRGBO(159, 132, 193, 0.8)),
    );

    return Container(
      width: 243,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Pinput(
        length: 6,
        controller: controller,
        focusNode: focusNode,
        separatorBuilder:
            (index) => Container(height: 64, width: 1, color: Colors.white),
        defaultPinTheme: defaultPinTheme,
        showCursor: true,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(124, 102, 152, 1),
          ),
        ),
      ),
    );
  }
}
