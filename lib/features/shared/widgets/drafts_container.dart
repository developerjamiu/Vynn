import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vynn/core/theme/app_theme.dart';

import 'app_image.dart';

class DraftsContainer extends StatelessWidget {
  final String text;

  const DraftsContainer({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return Container(
      height: 323,
      decoration: BoxDecoration(
        color: color.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Draft 1/3',
                style: textTheme.titleSmall?.copyWith(color: color.grey[500], fontSize: 14),
              ),
              Row(
                children: [
                  Container(
                    width: 59,
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                      color: color.grey[700],
                    ),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: color.white,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    width: 59,
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                      color: color.grey[700],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: AppImage.arrows(),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    '''Is writer's block getting you down?

Struggling to come up with fresh ideas for your social media content?  We've all been there!  Conheça o VYNN (Know VYNN in Portuguese, assuming your target audience is Brazilian) -  a new AI assistant that can help you generate engaging content for all your platforms!

Here's what VYNN can do for you:
Craft creative blog posts, social media captions, and email newsletters.
Personalize content to your target audience and brand voice.
Beat writer's block and get inspired with new ideas.''',
                    style: textTheme.headlineSmall?.copyWith(color: color.grey[400], fontSize: 16),
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
