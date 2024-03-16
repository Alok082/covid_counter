import 'package:get/get.dart';

import '../../firebaseimplementation/firebase_auth_services.dart';

class EmailVerification extends GetxController {
  FirebaseAuthServices _auth = Get.put(FirebaseAuthServices());
  void onInit() {
    super.onInit();
    emailverificationsend();
  }

  Future<void> emailverificationsend() async {
    try {
      await _auth.sendemailverification();
    } catch (e) {
      Get.snackbar("Error", "email verification failed");
    }
  }
}
