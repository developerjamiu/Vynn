import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vynn/core/extensions/snackbar_extension.dart';
import 'package:vynn/core/theme/app_theme.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    required this.text,
    required this.index,
    required this.length,
    super.key,
  });

  final String text;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: color.main300,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Column(
        children: [
          SizedBox(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Draft $index/$length',
                  style: textTheme.titleSmall?.copyWith(
                    color: color.main320,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: text));

                    context.showSuccessSnackbar('Content Copied!');
                  },
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color.main310,
                    ),
                    child: Icon(
                      Icons.copy,
                      color: color.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    text,
                    style: textTheme.bodyMedium?.copyWith(
                      color: color.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
