import 'package:flutter/material.dart';

class WSharedScaffold extends StatelessWidget {
  const WSharedScaffold({
    required this.body,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.bottomSheet,
    this.withSafeArea = true,
    super.key,
  });

  final Widget body;
  final bool withSafeArea;
  final bool? resizeToAvoidBottomInset;
  final Widget? appBar;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
        appBar: appBar == null
            ? null
            : AppBar(
                title: appBar,
                leading: const SizedBox(),
                leadingWidth: 0,
                backgroundColor: Colors.transparent,
                forceMaterialTransparency: true,
              ),
        body: SafeArea(
          child: body,
        ),
        bottomSheet: bottomSheet,
      ),
    );
  }
}
