library watson_assistant_v2;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WatsonAssistantResponse {
  String resultText;
  WatsonAssistantContext context;

  WatsonAssistantResponse({this.resultText, this.context});
}

class WatsonAssistantContext {
  Map<String, dynamic> context;

  WatsonAssistantContext({
    this.context,
  });

  void resetContext() {
    this.context = {};
  }
}

class WatsonAssistantV2Credential {
  String username;
  String apiKey;
  String version;
  String url;
  String assistantID;

  WatsonAssistantV2Credential({
    this.username = 'apikey',
    @required this.apiKey,
    @required this.version,
    @required this.url,
    @required this.assistantID,
  });

  static WatsonAssistantV2Credential fromJsonFile(String loadWatsonProperties) {
    Map<String, dynamic> properties = jsonDecode(loadWatsonProperties);
    return WatsonAssistantV2Credential(
      username: properties['username'],
      apiKey: properties['apiKey'],
      version: properties['version'],
      url: properties['url'],
      assistantID: properties['assistantID'],
    );
  }
}

class WatsonAssistantApiV2 {
  WatsonAssistantV2Credential watsonAssistantCredential;

  WatsonAssistantApiV2({
    @required this.watsonAssistantCredential,
  });

  Future<WatsonAssistantResponse> sendMessage(String textInput,
      WatsonAssistantContext context) async {
    try {
      var auth = 'Basic ' +
          base64Encode(utf8.encode(
              '${watsonAssistantCredential.username}:${watsonAssistantCredential
                  .apiKey}'));
      Map<String, dynamic> _body = {
        "input": {"text": textInput},
        "context": context.context
      };

      http.Response newSession = await _getSessionWatsonAssistant(auth, _body);
      var parsedJsonSession = json.decode(newSession.body);
      String sessionId = parsedJsonSession['session_id'];

      var receivedText = await http.post(
        '${watsonAssistantCredential.url}/assistants/${watsonAssistantCredential
            .assistantID}/sessions/$sessionId/message?version=${watsonAssistantCredential
            .version}',
        headers: {'Content-Type': 'application/json', 'Authorization': auth},
        body: json.encode(_body),
      );

      var parsedJson = json.decode(receivedText.body);
      var watsonResponse = parsedJson['output']['generic'][0]['text'];

      Map<String, dynamic> _result = json.decode(receivedText.body);

      WatsonAssistantContext _context =
      WatsonAssistantContext(context: _result['context']);

      WatsonAssistantResponse watsonAssistantResult = WatsonAssistantResponse(
          context: _context, resultText: watsonResponse);
      return watsonAssistantResult;
    } catch (error) {
      print(error);
      return error;
    }
  }

  Future<http.Response> _getSessionWatsonAssistant(String auth,
      Map<String, dynamic> _body) async {
    String urlWatsonAssistant =
        "${watsonAssistantCredential.url}/assistants/${watsonAssistantCredential
        .assistantID}/sessions?version=${watsonAssistantCredential.version}";

    var newSession = await http.post(urlWatsonAssistant,
        headers: {'Content-Type': 'application/json', 'Authorization': auth},
        body: json.encode(_body));
    try {
      if (newSession.statusCode != 201) {
        throw Exception('post error: statusCode= ${newSession.statusCode}');
      }
    } catch (error) {
      print('Failed to load post');
      print(newSession.statusCode);
    }
    return newSession;
  }
}
