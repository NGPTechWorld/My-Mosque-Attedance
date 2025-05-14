import 'dart:convert';

import 'package:flutter/material.dart';

import '/core/errors/error_handler.dart';
import '/app/services/api/api_response_model.dart';
import '/app/services/api/api_services.dart';
import '/app/services/api/dio_consumer.dart';
import '/app/services/api/end_points.dart';
import '../entities/attedance_entitie.dart';

abstract class UsersRepositories {
  Future<AppResponse> attedance({required String id});
}

class ImpUsersRepositories implements UsersRepositories {
  final ApiServices api;
  ImpUsersRepositories({required this.api});

  @override
  Future<AppResponse> attedance({required String id}) async {
    AppResponse response = AppResponse(success: false);
    try {
      response.data = await api.request(
        url: EndPoints.baserUrl,
        method: Method.post,
        requiredToken: false,
        params: {
          ApiKey.id: id,
          ApiKey.date: DateTime.now().toIso8601String().split('T')[0],
        },
      );
      debugPrint(response.data.toString());
      final data = jsonDecode(response.data.toString()) as Map<String, dynamic>;
      response.data = AttedanceEntitie.fromMap(data);
      response.success = true;
    } on ErrorHandler catch (e) {
      response.networkFailure = e.failure;
    }
    return response;
  }
}
