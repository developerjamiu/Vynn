import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:vynn/core/theme/app_theme.dart';
import 'package:vynn/features/home/presentation/pages/saved_content_page.dart';
import 'package:vynn/features/shared/widgets/app_image.dart';
import 'package:vynn/features/shared/widgets/app_menu_button.dart';
import 'package:vynn/features/shared/widgets/circular_button.dart';
import 'package:vynn/features/shared/widgets/component_page/app_colors.dart';
import 'package:vynn/features/shared/widgets/drafts_container.dart';
import 'package:vynn/features/shared/widgets/socials.dart';

import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dropdown_form_field.dart';
import '../../../shared/widgets/app_text_form_field.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  static const routePath = '/';
  static const routeName = 'Home';

  HomePage({super.key});

  List<DraftsContainer> cards = [
    const DraftsContainer(text: 'text'),
    const DraftsContainer(text: 'text'),
    const DraftsContainer(text: 'text'),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final color = context.colors;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Hi, ',
                            style:
                                textTheme.headlineSmall?.copyWith(color: color.black, fontSize: 24),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'see what we have \nfor you today!',
                                style: textTheme.headlineSmall
                                    ?.copyWith(color: color.grey[600], fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        CircularIconButton(onPressed: () {}, icon: Icons.more_horiz_outlined)
                      ],
                    ),
                    const SizedBox(height: 37),
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SocialsContainer(icon: AppImage.facebook(), title: 'Facebook post'),
                          const SizedBox(width: 8),
                          SocialsContainer(icon: AppImage.x(), title: 'Twitter tweet'),
                          const SizedBox(width: 8),
                          SocialsContainer(icon: AppImage.facebook(), title: 'Instagram feed'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 420,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CardSwiper(
                            cardsCount: cards.length,
                            numberOfCardsDisplayed: 3,
                            cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
                                cards[index],
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFE5631A),
                                  Color(0xFFF5BE08),
                                ],
                                begin: FractionalOffset(0.0, 1.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.ios_share_outlined,
                                  color: color.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Post this one',
                                  style: textTheme.headlineSmall
                                      ?.copyWith(color: color.white, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage.swipe(),
                        const SizedBox(width: 8),
                        Text(
                          'Swipe to see other drafts',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall
                              ?.copyWith(color: color.grey[500], fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      bottom: 16,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: color.primary,
                          style: BorderStyle.solid,
                        ),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              onPressed: () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      AppImage.bottomTitle(),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'APP MENU',
                                          textAlign: TextAlign.center,
                                          style: textTheme.headlineSmall?.copyWith(
                                              color: color.grey[800],
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 40),
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: color.white,
                                          borderRadius: const BorderRadius.vertical(
                                            top: Radius.circular(24),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 24),
                                        child: Column(
                                          children: [
                                            AppMenuButton.outline(
                                              onPressed: () {
                                                context.push(SavedContentPage.routePath);
                                                // context.push(
                                                //   '${HomePage.routePath}/${SavedContentPage.routePath}',
                                                // );
                                              },
                                              label: 'Your Saved Content',
                                              prefixIcon: Icon(
                                                Icons.favorite_border_outlined,
                                                color: color.grey[800],
                                                size: 24,
                                              ),
                                              suffixIcon: Icon(
                                                Icons.arrow_forward_ios_outlined,
                                                color: color.grey[400],
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            AppMenuButton.outline(
                                              onPressed: () {},
                                              label: 'My Business Profile',
                                              prefixIcon: Icon(
                                                Icons.person_outline_outlined,
                                                color: color.grey[800],
                                              ),
                                              suffixIcon: Icon(
                                                Icons.arrow_forward_ios_outlined,
                                                color: color.grey[400],
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              label: 'Regenerate Content',
                              icon: AppImage.cycle(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    AppImage.bottomTitle(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'CONNECT OPTIONS',
                                        textAlign: TextAlign.center,
                                        style: textTheme.headlineSmall?.copyWith(
                                            color: color.grey[800],
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 40),
                                      height: 800,
                                      decoration: BoxDecoration(
                                        color: color.white,
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(24),
                                        ),
                                      ),
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const AppTextFormField(
                                            hintText: 'Type your prompt here',
                                            labelText: 'Content focus',
                                          ),
                                          SizedBox(height: 16),
                                          const AppDropdownFormField(
                                            hintText: 'Content tone',
                                            labelText: 'Content tone',
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            'Length of the content',
                                            textAlign: TextAlign.start,
                                            style: textTheme.titleSmall?.copyWith(
                                              color: color.grey.shade700,
                                            ),
                                          ),
                                          // const SizedBox(height: 8),
                                          SliderTheme(
                                            data: const SliderThemeData(
                                              trackShape: CustomSliderTrackShape(),
                                              thumbShape: CustomSliderThumbShape(),
                                              overlayShape: CustomSliderOverlayShape(),
                                            ),
                                            child: Slider(
                                              activeColor: color.tangerine,
                                              value: 30,
                                              min: 0.0,
                                              max: 100,
                                              onChanged: (value) {},
                                              divisions: 3,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(),
                                              Text(
                                                'Short',
                                                textAlign: TextAlign.start,
                                                style: textTheme.titleSmall?.copyWith(
                                                  color: color.tangerine,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Medium',
                                                textAlign: TextAlign.start,
                                                style: textTheme.titleSmall?.copyWith(
                                                  color: color.tangerine,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Long',
                                                textAlign: TextAlign.start,
                                                style: textTheme.titleSmall?.copyWith(
                                                  color: color.tangerine,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          AppButton(
                                            onPressed: () {},
                                            label: 'Save New Options',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            child: Container(
                              // height: ,
                              decoration: BoxDecoration(
                                color: color.grey[300],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Icon(
                                Icons.settings_outlined,
                                color: color.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({super.enabledThumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context, center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class CustomSliderOverlayShape extends RoundSliderOverlayShape {
  final double thumbRadius;
  const CustomSliderOverlayShape({this.thumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context, center.translate(-(value - 0.5) / 0.5 * thumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}
