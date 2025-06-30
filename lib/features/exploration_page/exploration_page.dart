import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'exploration_controller.dart';

class ExplorationPage extends GetView<ExplorationController> {
    
    const ExplorationPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ExplorationPage'),),
            body: Container(),
        );
    }
}