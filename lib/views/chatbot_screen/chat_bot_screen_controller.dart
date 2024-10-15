import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../utils/libraries/app_libraries.dart';

class ChatController extends GetxController {
  var messages = <Map<String, String>>[].obs;
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController =
      TextEditingController(); // Observable list of messages
  final messageController = ''.obs;
  var isLoading = false.obs; // Observable for loading state
  final String replicateApiUrl =
      'https://api.replicate.com/v1/models/meta/meta-llama-3.1-405b-instruct/predictions';
  final String replicateApiKey = dotenv.env['REPLICATE_API_KEY'] ?? '';
  // Move this to secure storage in production

  Future<void> sendMessage(String message) async {
    messages.add({"sender": "user", "message": message});
    messageController.value = ''; // Clear input after sending the message
    isLoading.value = true; // Set loading to true

    try {
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $replicateApiKey', // Updated to Bearer token
      };

      var body = jsonEncode({
        "input": {
          "top_k": 50,
          "top_p": 0.9,
          "prompt": message, // User's message as prompt
          "max_tokens": 1024,
          "min_tokens": 0,
          "temperature": 0.6,
          "system_prompt": "You are a helpful assistant.",
          "presence_penalty": 0,
          "frequency_penalty": 0
        }
      });

      // POST request to submit the message
      var response = await http.post(Uri.parse(replicateApiUrl),
          headers: headers, body: body);
      print('data<<<<<<<<<<<${response.body}');
      print('statusCode<<<<<<<<<<<$replicateApiKey');
      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        var predictionId = responseData['id']; // Capture the `id` field
        await getPredictionById(predictionId); // Pass the `id` to GET request
      } else {
        messages.add({
          "sender": "bot",
          "message": "Failed to send message. Please try again later."
        });
      }
    } catch (e) {
      messages.add({"sender": "bot", "message": "Error occurred: $e"});
    } finally {
      isLoading.value = false; // Set loading to false when done
    }
  }

  // Function to GET predictions using the specific `id`
  Future<void> getPredictionById(String id) async {
    final String predictionUrl =
        'https://api.replicate.com/v1/predictions/$id'; // GET request URL with `id`

    try {
      var headers = {
        'Authorization': 'Bearer $replicateApiKey', // Bearer token
        'Content-Type': 'application/json',
      };

      // Make GET request to fetch prediction by `id`
      var response = await http.get(Uri.parse(predictionUrl), headers: headers);

      if (response.statusCode == 200) {
        var predictionData = jsonDecode(response.body);
        List<dynamic> outputArray = predictionData['output'] ?? [];
        print('outPut<<<<<<<<<<<$outputArray');

        if (outputArray.isNotEmpty) {
          // Join the list into a normal string and add to messages
          String botMessage =
              outputArray.join(' '); // Join array elements with a space
          messages.add({
            "sender": "bot",
            "message": botMessage, // Display the joined message
          });
        } else {
          // If output array is empty, handle it
          messages.add({
            "sender": "bot",
            "message": "No response from the bot. Please try again.",
          });
        }
      } else {
        messages.add({
          "sender": "bot",
          "message":
              "Failed to fetch prediction. Status code: ${response.statusCode}"
        });
      }
    } catch (e) {
      // Handle errors
      messages.add({
        "sender": "bot",
        "message": "Error occurred while fetching prediction: $e"
      });
    }
  }
}
