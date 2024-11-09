
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ProviderLogger extends ProviderObserver {
  final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0, // Number of method calls to be displayed
        errorMethodCount: 4, // Number of method calls if stacktrace is provided
        lineLength: 100, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
    ),
  );

  @override
  void didAddProvider(ProviderBase provider, Object? value,
      ProviderContainer container) {
    logger.i('[AddProvider]: name: $provider, value: $value ');
  }

  @override
  void didDisposeProvider(
      ProviderBase provider, ProviderContainer container) {
        logger.i("[DisposeProvider] name: $provider");
  }

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
      logger.i('[UpdateProvider]: name: $provider, prev: $previousValue new: $newValue');
    }
}