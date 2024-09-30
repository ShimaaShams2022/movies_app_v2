

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/Result.dart';

class ErrorStateWidget extends StatelessWidget {
  Exception? exception;
  String? retryButtonText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget(this.exception,
      {this.retryButtonText, this.retryButtonAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(extractErrorMessage()),
          retryButtonText != null ? ElevatedButton(onPressed: retryButtonAction,
              child: Text(retryButtonText ?? ""))
              : const Text('')
        ],
      ),
    );
  }

  String extractErrorMessage() {
    switch (exception) {
      case TimeoutException() :
      case SocketException() :
        {
          return "Please Check internet Connection";
        }
      case ServerErrorException():
        {
          return (exception as ServerErrorException).statusMsg ??
              "something went wrong";
        }
      default:
        {
          return "Something Went Wrong";
        }
    }
  }

}
