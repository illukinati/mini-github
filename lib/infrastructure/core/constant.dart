class MyConstant {
  ///====================IMPORTANT========================================= ///
  ///
  /// トークンをこのように定数として記述することは、普段は決して行っておりません。
  /// 今回はあくまでテストのために行っただけです。
  /// 通常は.envファイルに保存し、それを.gitignoreで無視するように設定しています。
  /// さらに、このトークンは30日間だけ有効な一時的なもので、
  ///「read user」と「read repo」の権限しかありません。
  ///
  /// I never usually hard-code tokens as constants like this.
  /// I only did this for testing purposes.
  /// Also, I never usually hard-code tokens as constants like this.
  /// Normally, I store it in a .env file and ignore it using .gitignore.
  /// In addition, this token is temporary and valid for only 30 days,
  /// with permissions limited to "read user" and "read repo".
  ///
  ///====================================================================///

  static String myToken = "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";
}
