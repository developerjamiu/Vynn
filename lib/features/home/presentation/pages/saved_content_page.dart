import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class SavedContentPage extends StatelessWidget {
  static const routePath = 'saved-content';
  static const routeName = 'SavedContent';

  const SavedContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Your Saved Content',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView.separated(
            itemCount: 25,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  color: color.main300,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Facebook post',
                          style: textTheme.titleSmall?.copyWith(
                            color: color.main200,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Yesterday',
                          style: textTheme.titleSmall?.copyWith(
                            color: color.grey[300],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.more_horiz_outlined, color: color.white),
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
                              style: textTheme.headlineSmall?.copyWith(
                                  color: color.grey[400], fontSize: 16),
                            ),
                          ),
                        ),
                      ),
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
