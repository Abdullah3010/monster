import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/utils/helpers/app_alert.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:monster/modules/auth/presentation/widgets/w_register_first_step.dart';
import 'package:monster/modules/auth/presentation/widgets/w_register_step_two.dart';

class SNRegister extends StatefulWidget {
  const SNRegister({super.key});

  @override
  State<SNRegister> createState() => _SNRegisterState();
}

class _SNRegisterState extends State<SNRegister> {
  int currentStep = 1;
  AuthCubit authCubit = Modular.get<AuthCubit>();

  @override
  void initState() {
    super.initState();
    authCubit.fRegister.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Modular.to.navigate(RoutesNames.home.homeMain);
        } else if (state is AuthError) {
          AppAlert.error(
            state.message ?? 'An error occurred, please try again later',
          );
        }
      },
      child: WSharedScaffold(
        // resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Step $currentStep of 2',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: context.theme.colorScheme.grey,
                      ),
                    ),
                  ],
                ),
              ),
              34.verticalSpace,
              currentStep == 1
                  ? Expanded(
                      child: WRegisterFirstStep(
                        onNextTap: () {
                          setState(() {
                            currentStep = 2;
                          });
                        },
                      ),
                    )
                  : const Expanded(
                      child: WRegisterSecondStep(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
