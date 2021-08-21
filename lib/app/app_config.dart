import 'package:injectable/injectable.dart';

@injectable
class AppConfig {
  final String apiDomain;

  AppConfig() : apiDomain = "jsonplaceholder.typicode.com";
}
