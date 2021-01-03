abstract class TrBase {
  final String code;
  const TrBase(this.code);

  static const storeCloseToYou = 'store close to you';
  String trStoreCloseToYou();

  Map<String, String> get values {
    return {
      storeCloseToYou: trStoreCloseToYou(),
    };
  }

  Map<String, Map<String, String>> get trMap => {code: values};
}