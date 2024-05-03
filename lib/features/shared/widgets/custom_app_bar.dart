import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/features/shared/widgets/circular_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.onBackPressed,
    this.title,
  });

  final VoidCallback? onBackPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircularIconButton(
            onPressed: onBackPressed ?? context.pop,
            icon: Icons.arrow_back,
          ),
        ),
      ),
      title: title == null ? null : Text(title!),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
