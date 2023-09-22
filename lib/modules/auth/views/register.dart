import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/core/routes/app_pages.dart';
import 'package:sezon_app/modules/auth/views/widgets/app_elevation_button.dart';
import 'package:sezon_app/modules/auth/views/widgets/app_text_form_field.dart';
import 'package:sezon_app/modules/auth/views/widgets/top_auth_widget.dart';
import 'package:sezon_app/core/utils/extensions/sized_box_extension.dart';

import '../../../core/widgets/custom_text_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final _key = GlobalKey<FormState>();

  var controller = Get.find<AuthGetXController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GetX<AuthGetXController>(
              builder: (controller) => controller.loading.value
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const TopAuthWidget(),
                            CustomTextWidget(
                              text: 'create_new_account'.tr,
                              fontWeight: FontWeight.w700,
                              fontSize: 30.sp,
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: emailController,
                              label: 'email'.tr,
                              keyboardType: TextInputType.emailAddress,
                              validator: (v) {
                                if (emailController.text.isEmpty) {
                                  return 'email_is_required'.tr;
                                }
                                return null;
                              },
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: phoneNumberController,
                              label: 'phone_number'.tr,
                              keyboardType: TextInputType.phone,
                              validator: (v) {
                                if (phoneNumberController.text.isEmpty) {
                                  return 'phone_number_required'.tr;
                                }
                                return null;
                              },
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: passwordController,
                              label: 'password'.tr,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (v) {
                                if (passwordController.text.isEmpty) {
                                  return 'please_enter_password'.tr;
                                }
                                return null;
                              },
                            ),
                            20.ph(),
                            AppTextFormField(
                              textEditingController: confirmPasswordController,
                              label: 'confirm_password'.tr,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (v) {
                                if (confirmPasswordController.text.isEmpty) {
                                  return 'Please Confirm Password'.tr;
                                }
                                return null;
                              },
                            ),
                            30.ph(),
                            AppElevationButton(
                              label: 'create_account'.tr,
                              onTap: () async {
                                if (_key.currentState!.validate()) {
                                  await createAccount(context);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'do_you_have_account'.tr,
                                style: TextStyle(color: Colors.black87, fontSize: 16.sp),
                                children: [
                                  TextSpan(
                                    text: 'login'.tr,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
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
                            30.ph()
                          ],
                        ),
                      ),
                    ))),
    );
  }

  createAccount(BuildContext context) async {
    bool success = await controller.createAccount(email: emailController.text, password: passwordController.text, phone: phoneNumberController.text, context: context);

    if (success) {
      Get.offAllNamed(Routes.home);
    } else {
      print('Wrong');
    }
  }
}
