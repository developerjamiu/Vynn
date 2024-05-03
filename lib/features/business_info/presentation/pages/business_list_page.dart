import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/shared/widgets/custom_app_bar.dart';

class BusinessListPage extends ConsumerWidget {
  static const routePath = 'business-list';
  static const routeName = 'BusinessList';

  const BusinessListPage({
    super.key,
    this.businessList = const [
      'Café or Coffee Shop',
      'Fitness Studio',
      'Pet Grooming Salon',
      'Event Planning Service',
      'Graphic Design Agency',
      'Home Cleaning Service',
      'Food Truck',
      'Landscaping and Lawn Care',
      'Boutique Fitness Studio',
      'Handmade Crafts Store',
      'Digital Marketing Agency',
      'Interior Design Firm',
      'Tutoring Service',
      'Mobile Car Wash and Detailing',
      'E-commerce Store',
      'Childcare Center',
      'Food Delivery Service',
      'Personal Training Studio',
      'Bakery',
      'Financial Planning Firm',
    ],
  });

  final List<String> businessList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'What industry are you in?',
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: businessList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final business = businessList[index];

            return GestureDetector(
              onTap: () => context.pop(business),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      business,
                      style: textTheme.titleMedium,
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
