import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/modules/auth/controllers/auth_controller.dart';
import 'package:sezon_app/modules/auth/views/register.dart';
import 'package:sezon_app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/modules/auth/views/widgets/top_auth_widget.dart';
import 'package:sezon_app/core/routes/app_pages.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../../core/widgets/loading_widget.dart';

class LoginScreen extends GetView<AuthGetXController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
             () => controller.loading.value
                ? const Center(
              child: LoadingWidget(),
            )
                : Form(
              key: controller.key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TopAuthWidget(),
                    CustomTextWidget(text: 'login'.tr, fontSize: 30.sp, fontWeight: FontWeight.bold),
                    20.ph(),
                    AppTextFormField(
                      textEditingController: controller.emailController,
                      label: 'email'.tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (controller.emailController.text.isEmpty) {
                          return 'email_required'.tr;
                        }
                        return null;
                      },
                    ),
                    20.ph(),
                    AppTextFormField(
                      textEditingController: controller.passwordController,
                      label: 'password'.tr,
                      keyboardType: TextInputType.name,
                      validator: (v) {
                        if (controller.passwordController.text.isEmpty) {
                          return 'please_enter_password'.tr;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child:  Text(
                              'forget_password'.tr,
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.ph(),
                    AppElevationButton(
                      label: 'login'.tr,
                      onTap: () async {
                        if (controller.key.currentState!.validate()) {
                          await login(context);
                        }
                      },
                    ),
                    30.ph(),
                    RichText(
                      text: TextSpan(
                        text: 'dont_have_account'.tr,
                        style: const TextStyle(color: Colors.black87, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'new_account'.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                            style: const TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  login(BuildContext context) async {

    bool loggedIn = await controller.signIn(email: controller.emailController.text, password: controller.passwordController.text, context: context);

    if (loggedIn ) {

      Get.offAllNamed(Routes.home);
    } else {
      print('Wrong');
    }
  }
}
