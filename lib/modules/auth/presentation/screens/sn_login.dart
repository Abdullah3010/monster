import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/utils/helpers/app_alert.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';

class SNLogin extends StatefulWidget {
  const SNLogin({super.key});

  @override
  State<SNLogin> createState() => _SNLoginState();
}

class _SNLoginState extends State<SNLogin> {
  AuthCubit cubit = Modular.get<AuthCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fLogin.init();
    cubit.fLogin.emailField.controller.text = '';
    cubit.fLogin.passwordField.controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Modular.to.navigate(RoutesNames.home.homeMain);
          } else if (state is AuthError) {
            AppAlert.error(
              state.message ?? 'An error occurred, please try again later',
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              height: context.height * 0.9,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Form(
                key: cubit.fLogin.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Welcome ',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w900,
                                    color: context.theme.colorScheme.navyBlue,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'BACK',
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w900,
                                        color: context.theme.colorScheme.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          32.verticalSpace,
                          cubit.fLogin.emailField.buildField(context),
                          16.verticalSpace,
                          cubit.fLogin.passwordField.buildField(context),
                          42.verticalSpace,
                          WAppButton(
                            title: 'Login',
                            onTap: () async {
                              if (cubit.fLogin.validate()) {
                                await cubit.login();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an Account? ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: context.theme.colorScheme.grey,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Modular.to.navigate(RoutesNames.auth.register);
                          },
                          child: Text(
                            'Register',
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
              ),
            ),
          );
        },
      ),
    );
  }
}
