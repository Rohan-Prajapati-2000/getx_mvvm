import 'package:get/get_navigation/get_navigation.dart';

class Languages extends Translations{

  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'email_hint' : "Enter Email",
      'password_hint' : "Enter Password",
      'internet_exception' : "We are unable to connect with internet\n Please check your internet",
      'splash_text' : "Welcome"
    },
    'hi_IN' : {
      'email_hint' : "ईमेल दर्ज करें",
      "internet_exception" : "हम इंटरनेट से कनेक्ट नहीं हो पा रहे हैं \n कृपया अपने इंटरनेट कनेक्शन की जाँच करें",
      'splash_text' : "स्वागत"
    }
  };

}