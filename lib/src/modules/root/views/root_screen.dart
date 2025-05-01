import 'dart:ui';

import 'package:attendease/src/modules/root/views/widgets/top_app_bar.dart';

import '../../../core/app_export.dart';
import '../../customer/controllers/customer_controller.dart';
import '../controllers/root_controller.dart';
import 'widgets/left_nav_bar.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 56.h, left: 60.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() =>
                      controller.modules[controller.selectedModuleIndex.value]),
                    ),
                  ],
                ),
              ),
                Obx(() {
                  return controller.isFullDrawerVisible.value?BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ):const SizedBox.shrink();
                }),
              Container(
                  margin: EdgeInsets.only(top: 56.h),
                  child:  const LeftNavigationBar()),
              const TopAppBar(),
            ],
          ),

        )
    );
  }

}


