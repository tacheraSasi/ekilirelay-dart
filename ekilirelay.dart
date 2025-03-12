import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendEmail() async {
  // Set the API URL and the payload data
  final url = Uri.parse('https://relay.ekilie.com/api/index.php');
  final payload = json.encode({
    'apikey': 'API_KEY',  // Replace with your actual API key
    'to': 'curl@example.com',
    'subject': 'cURL Test',
    'message': 'Hello from command line!',
    'headers': 'From: cURL User ',
  });

  // Set headers
  final headers = {
    'Content-Type': 'application/json',
  };

  // Send the POST request
  try {
    final response = await http.post(
      url,
      headers: headers,
      body: payload,
    );

    // Check the response status
    if (response.statusCode == 200) {
      print('Email sent successfully');
    } else {
      print('Failed to send email: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() {
  sendEmail();
}

