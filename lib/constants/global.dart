class OnSpaceValues {
  OnSpaceValues({
    required this.urlScheme,
    required this.baseDomain,
    required this.hiveBoxKey,
  });

  final String urlScheme;
  final String baseDomain;
  final String hiveBoxKey;

  String get baseUrl => '$urlScheme://$baseDomain/b';

  String get hiveBoxEncryptionKey => 'locator_app _${hiveBoxKey}_key';
}

class OnSpaceConfig {
  factory OnSpaceConfig({required OnSpaceValues values}) {
    return _instance ??= OnSpaceConfig._internal(values);
  }

  OnSpaceConfig._internal(this.values);

  final OnSpaceValues values;
  static OnSpaceConfig? _instance;

  static OnSpaceConfig? get instance => _instance;
}
