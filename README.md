To send a `POST` request using Dart (Flutter) to interact with the `ekilirelay` email API, you can use the `http` package. Here's how to write the Dart code to replicate the `curl` request you mentioned:

1. First, add the `http` package to your `pubspec.yaml`:

```yaml
dependencies:
  http: ^0.14.0
```

2. Then, use the following Dart code to send the POST request:

```dart
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
```

### Explanation:
- **URL**: The URL is taken from the cURL request, which is `https://relay.ekilie.com/api/index.php`.
- **Payload**: The data is structured in JSON format, similar to the `curl` command you provided.
- **Headers**: Set to `Content-Type: application/json` as specified.
- **POST Request**: We use `http.post` to send the request with the provided headers and body (payload).
- **Response Handling**: Checks the response status code to determine whether the email was successfully sent.
