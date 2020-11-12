class ExceptionCatcher {
  static String getMessage(Object exception) {
    for (String key in _errors.keys) {
      if (exception.toString().contains(key)) {
        return _errors[key];
      }
    }

    return exception.toString();
  }

  static Map<String, String> _errors = {
    '[404]': 'API file couldn\'t be found.',
    'FormatException': 'Json data corrupted!',
    'DATA_CORRUPTED': 'Some Json fields are missing.',
    'TimeoutException': 'Check Internet Connection.',
    'SocketException': 'Check Internet Connection.',
  };
}
