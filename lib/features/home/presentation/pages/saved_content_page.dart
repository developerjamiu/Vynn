import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/home/presentation/pages/home_page.dart';
import 'package:vynn/features/shared/widgets/app_button.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class SavedContentPage extends StatelessWidget {
  static const routePath = '/saved_content';
  static const routeName = 'SavedContent';

  const SavedContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView.separated(
            itemCount: 25,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  color: color.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Facebook post',
                          style: textTheme.titleSmall?.copyWith(
                            color: color.tangerine,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Yesterday',
                          style: textTheme.titleSmall?.copyWith(
                            color: color.grey[300],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
