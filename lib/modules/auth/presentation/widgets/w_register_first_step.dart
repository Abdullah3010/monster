import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/services/routes/routes_names.dart';
import 'package:monster/core/utils/enums.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';

class WRegisterFirstStep extends StatefulWidget {
  const WRegisterFirstStep({
    super.key,
    required this.onNextTap,
  });
  final Function() onNextTap;

  @override
  State<WRegisterFirstStep> createState() => _WRegisterFirstStepState();
}

class _WRegisterFirstStepState extends State<WRegisterFirstStep> {
  AuthCubit authCubit = Modular.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text.rich(
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  color: context.theme.colorScheme.navyBlue,
                ),
                children: [
                  TextSpan(
                    text: 'Monster',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      color: context.theme.colorScheme.orange,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.only(right: context.width * 0.2),
          child: Text(
            'Before getting started, you’ll need to create a profile',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.theme.colorScheme.black,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        16.verticalSpace,
        Container(
          width: context.width,
          padding: EdgeInsets.only(right: context.width * 0.2),
          child: Text(
            'I am ',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.theme.colorScheme.black,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  authCubit.fRegister.userType = ENUserType.JobSeeker;
                });
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 34.w,
                    child: Radio<ENUserType>(
                      value: ENUserType.JobSeeker,
                      groupValue: authCubit.fRegister.userType,
                      onChanged: (value) {
                        setState(() {
                          authCubit.fRegister.userType = value ?? ENUserType.JobSeeker;
                        });
                      },
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.disabled)) {
                            return context.theme.colorScheme.orange.withValues(alpha: .32);
                          }
                          return context.theme.colorScheme.orange;
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Job Seeker',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.theme.colorScheme.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            16.horizontalSpace,
            InkWell(
              onTap: () {
                setState(() {
                  authCubit.fRegister.userType = ENUserType.Company;
                });
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 34.w,
                    child: Radio<ENUserType>(
                      value: ENUserType.Company,
                      groupValue: authCubit.fRegister.userType,
                      onChanged: (value) {
                        setState(() {
                          authCubit.fRegister.userType = value ?? ENUserType.Company;
                        });
                      },
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.disabled)) {
                            return context.theme.colorScheme.orange.withValues(alpha: .32);
                          }
                          return context.theme.colorScheme.orange;
                        },
                      ),
                    ),
                  ),
                  Text(
                    'Company',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: context.theme.colorScheme.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        WAppButton(
          title: 'Next',
          onTap: widget.onNextTap,
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
    );
  }
}
