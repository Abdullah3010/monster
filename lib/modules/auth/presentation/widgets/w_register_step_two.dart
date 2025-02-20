import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';

class WRegisterSecondStep extends StatefulWidget {
  const WRegisterSecondStep({
    super.key,
  });

  @override
  State<WRegisterSecondStep> createState() => _WRegisterSecondStepState();
}

class _WRegisterSecondStepState extends State<WRegisterSecondStep> {
  final AuthCubit authCubit = Modular.get<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: authCubit.fRegister.formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.navyBlue,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.icons.user.path,
                            width: 50.w,
                            height: 50.h,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 38.w,
                          height: 38.w,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(50.r),
                            border: Border.all(
                              color: context.theme.colorScheme.navyBlue,
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.icons.camera.path,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                32.verticalSpace,
                authCubit.fRegister.fullNameField.buildField(context),
                16.verticalSpace,
                authCubit.fRegister.phoneField.buildField(context),
                16.verticalSpace,
                authCubit.fRegister.emailField.buildField(context),
                16.verticalSpace,
                authCubit.fRegister.passwordField.buildField(context),
                16.verticalSpace,
                authCubit.fRegister.dateOfBirthField.buildField(context),
                16.verticalSpace,
                authCubit.fRegister.addressField.buildField(
                  context,
                  param: ParamsCustomInput(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        Assets.icons.location.path,
                        colorFilter: ColorFilter.mode(
                          context.theme.colorScheme.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          // const Spacer(),
          WAppButton(
            title: 'Register',
            onTap: () async {
              if (authCubit.fRegister.validate()) {
                await authCubit.register();
              }
            },
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an Account? ',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: context.theme.colorScheme.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  Modular.to.navigate(RoutesNames.auth.login);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: context.theme.colorScheme.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
