import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/home/presentation/state/home_notifier.dart';
import 'package:vynn/features/home/presentation/widget/content_card.dart';

class ContentDataView extends ConsumerWidget {
  const ContentDataView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNotifier = ref.watch(homeNotifierProvider);

    return SizedBox(
      height: 300,
      child: CardSwiper(
        onEnd: ref.read(homeNotifierProvider.notifier).fetchContent,
        isLoop: false,
        padding: EdgeInsets.zero,
        backCardOffset: const Offset(0, 28),
        cardsCount: homeNotifier.selectedContents.length,
        numberOfCardsDisplayed: 3,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
          final content = homeNotifier.selectedContents[index];
          return ContentCard(
            text: content,
            index: index + 1,
            length: homeNotifier.selectedContents.length,
          );
        },
      ),
    );
  }
}
