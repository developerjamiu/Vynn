import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vynn/core/exception/app_exception.dart';
import 'package:vynn/features/home/models/content_model.dart';
import 'package:vynn/features/home/models/content_params.dart';

class ContentIdeasRepository {
  ContentIdeasRepository({
    required GenerativeModel model,
  }) : _model = model;

  final GenerativeModel _model;

  Future<ContentModel> getContentIdeas(ContentParams params) async {
    try {
      final prompt = _constructPromptFromParameters(
        companyType: params.companyType,
        contentFocus: params.contentFocus,
        contentTone: params.contentTone,
        targetAudience: params.targetAudience,
      );

      final response = await _model.generateContent(
        [Content.text(prompt)],
      );

      if (response.text == null) {
        throw ContentIdeasException(
          'There was a problem generating content ideas',
          stackTrace: StackTrace.current,
        );
      }

      final Map<String, dynamic> contentResponse = json.decode(response.text!);

      return ContentModel.fromJson(contentResponse);
    } on FormatException catch (ex, stackTrace) {
      throw ContentIdeasException(
        ex.message,
        stackTrace: stackTrace,
      );
    } catch (ex, stackTrace) {
      throw ContentIdeasException(
        ex.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  String _constructPromptFromParameters({
    required String companyType,
    String? contentFocus = 'Lead Generation',
    String? contentTone = 'Informative',
    String? targetAudience = 'All',
  }) {
    return """
      You are playing the role of a content creator. You will be given some information and you will generate social media content ( posts / tweets ) from the information provided.

      Steps: 
      1. You will be provided with the industry type, you will be given the context focus, content tone and target audience 
      2. You will generate 5 social media content ( posts/ tweet ) 
      3. You are meant to bear into account the  Content length limit of each platform
      4. You are to use hashtags and other content lead generation techniques
      5. You are to generate three social media posts on each post for each of the post there should be three versions of it Facebook, Twitter and Whatsapp.
      6. The response should be encoded in JSON format

      Context: You have experience developing content that is SEO sharp and customer lead generation. Your content created should be out of the blue and interesting and eye catching. You are a content generation app that helps businesses generate leads

      Output Format: 

      You must always return a json encoded text like the following

      {\\"twitter\\": [\\"Sample is Good\\", \\"Sample is Good\\", \\"Sample is Good\\"], \\"facebook\\": [\\"Sample is Good\\", \\"Sample is Good\\", \\"Sample is Good\\"], \\"whatsapp\\": [\\"Sample is Good\\", \\"Sample is Good\\", \\"Sample is Good\\"]}


      It should the tweet in its variation for each platform

      In order for your output to be correct: 

      1. Your output must be in json encoded format
      2. It must be 5 posts with 3 variations each

      Now here is your company type, age target market, budget target market class, similar company  and profession, generate the object

      Company Type: $companyType
      Content Focus: $contentFocus
      Content Tone: $contentTone
      Target Audience: $targetAudience
    """;
  }
}

final contentIdeasRepositoryProvider = Provider<ContentIdeasRepository>(
  (ref) => ContentIdeasRepository(
    model: GenerativeModel(
      model: 'gemini-pro',
      apiKey: "AIzaSyCE5Q4X3pNYHdZDxW4-QMNL-4QTqVQC7fI",
    ),
  ),
);
