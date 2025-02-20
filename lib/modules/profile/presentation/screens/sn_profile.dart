import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monster/core/assets/assets.gen.dart';
import 'package:monster/core/config/params/params_custom_input.dart';
import 'package:monster/core/extension/color_extension.dart';
import 'package:monster/core/extension/context_extension.dart';
import 'package:monster/core/extension/text_theme_extension.dart';
import 'package:monster/core/utils/helpers/app_dialogs.dart';
import 'package:monster/core/widgets/w_app_button.dart';
import 'package:monster/core/widgets/w_shared_scaffold.dart';
import 'package:monster/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:monster/modules/profile/presentation/cubit/profile_cubit.dart';

class SnProfile extends StatefulWidget {
  const SnProfile({super.key});

  @override
  State<SnProfile> createState() => _SnProfileState();
}

class _SnProfileState extends State<SnProfile> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<ProfileCubit>();
    cubit.initProfile();
  }

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: context.textTheme.navyBlue16w900,
        ),
        backgroundColor: context.theme.colorScheme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: cubit,
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.all(22.w),
            children: [
              30.verticalSpace,
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
              cubit.editProfile.fullNameField.buildField(
                context,
                param: const ParamsCustomInput(
                  enabled: false,
                ),
              ),
              16.verticalSpace,
              cubit.editProfile.phoneField.buildField(
                context,
                param: const ParamsCustomInput(
                  enabled: false,
                ),
              ),
              16.verticalSpace,
              cubit.editProfile.dateOfBirthField.buildField(
                context,
                param: const ParamsCustomInput(
                  enabled: false,
                ),
              ),
              16.verticalSpace,
              cubit.editProfile.addressField.buildField(
                context,
                param: ParamsCustomInput(
                  enabled: false,
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
              60.verticalSpace,
              Center(
                child: WAppButton(
                  title: 'Logout',
                  bottonColor: context.theme.colorScheme.red,
                  onTap: () {
                    AppDialogs.dialog(
                      titleText: 'Are you sure you want to logout?',
                      mainActionTitle: 'Logout',
                      secondActionTitle: 'Cancel',
                      onMainAction: () async {
                        await Modular.get<AuthCubit>().logout();
                      },
                      onSecondAction: () {
                        Modular.to.pop();
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
