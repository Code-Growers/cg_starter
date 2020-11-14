import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
      methodCount: 4,
      errorMethodCount: 8,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      printTime: true // Should each log print contain a timestamp
      ),
);
