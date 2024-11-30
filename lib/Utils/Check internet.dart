import 'dart:io';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");

    if (result.isNotEmpty) {
      return true;
    } else {
      return true;
    }
  } catch (E) {
    return true;
  }
}
