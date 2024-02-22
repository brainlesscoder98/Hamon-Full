import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamon/core/constants/ui_colors.dart';
import 'package:hamon/core/views/widgets/hAppbar.dart';
import 'controller/dashboard_controller.dart';
import 'molecules/molecules.dart';

class Dashboard extends StatelessWidget {
  final DashboardController _controller = Get.put(DashboardController());

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(
        titleText: 'Hello,',
        subtitle: Obx(() => Text(_controller.greetingMessage.value)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                _controller.toggleMenu();
              },
              child: Obx(() => _controller.isMenuOpened.value?
                  Image.asset(
                      'assets/png/menu.png',
                      width: 20,
                      height: 20,
                      color: UIColors.black,
                    ):  const Icon(Icons.menu, color: UIColors.black, size: 30)
            ),
            ),
          )
        ],
      ),
      body: Obx(() =>
          _controller.isMenuOpened.value ?  buildListView() : buildGridView()),
    );
  }
}
