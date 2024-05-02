import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vynn/features/home/models/content_model.dart';
import 'package:vynn/features/home/models/content_params.dart';
import 'package:vynn/features/home/repositories/content_ideas_repository.dart';

final userProvider =
    FutureProvider.family.autoDispose<ContentModel, ContentParams>(
  (ref, params) {
    return ref.watch(contentIdeasRepositoryProvider).getContentIdeas(params);
  },
);
