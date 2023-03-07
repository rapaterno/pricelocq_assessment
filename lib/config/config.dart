abstract class Config {
  final String baseUrl;
  Config({
    required this.baseUrl,
  });
}

class StagingConfig extends Config {
  StagingConfig({required super.baseUrl});
}
