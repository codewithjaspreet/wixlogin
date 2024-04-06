import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wixlogin/utils/api_service.dart';

class HomeController extends GetxController {
  RxString userName = ''.obs;
  RxString email = ''.obs;
  RxString clientId = ''.obs;
  RxString id = ''.obs;

  userDetails() async {
    try {
      final response = await THttpHelper.get('user');

      if (response.elementAt(0) == 200) {
        print(response.elementAt(1)['id']);

        id.value = response.elementAt(1)['id'];
        userName.value = response.elementAt(1)['userName'];
        email.value = response.elementAt(1)['email'];
        clientId.value = response.elementAt(1)['clientId'];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onInit() {
    userDetails();
    super.onInit();
  }
}
