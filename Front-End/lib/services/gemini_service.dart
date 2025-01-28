import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService()
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: 'AIzaSyCljbPI-vy5NGuIl0o4v1fXfObZBT73jJs',
          generationConfig: GenerationConfig(
            temperature: 1,
            topK: 40,
            topP: 0.95,
            maxOutputTokens: 8192,
            responseMimeType: 'text/plain',
          ),
        );

  Future<String?> generateMealPlan(String petDetails) async {
    try {
      final chat = _model.startChat(history: []);

      final prompt = """
Suggest a healthy and balanced meal plan for a pet with the following details:
$petDetails.
Include portion sizes and feeding times.
""";

      final content = Content.text(prompt);
      final response = await chat.sendMessage(content);
      return response.text;
    } catch (e) {
      throw Exception('Failed to generate meal plan: $e');
    }
  }
}
