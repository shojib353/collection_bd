import 'package:audioplayers/audioplayers.dart';
import 'package:bd_collection/app/modules/all_record/model/all_record_model.dart';
import 'package:bd_collection/app/modules/all_record/providers/all_record_provider.dart';
import 'package:bd_collection/utils/constants/urls.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllRecordController extends GetxController {
  //TODO: Implement AllRecordController
  final AllRecordProvider provider = Get.find<AllRecordProvider>();

  final count = 0.obs;
  var allRecordModel = AllRecordModel().obs;
  RxString? name =" ".obs;
  @override
  void onInit() {
    super.onInit();
    getAllRecord();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<String?> getSavedToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token"); // ✅ Returns stored token
  }
  Future<int?> getSavedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user_id"); // ✅ Returns stored user ID
  }

  void getAllRecord() async {

    var token = await getSavedToken(); // Retrieve saved token
    var userId = await getSavedUserId(); // Retrieve saved user ID
    String url= all_record_url;
    print("profile userid =$userId");


    // Redirect to login if no token


    if (token != null && userId != null) {
      print("profile token =$token");
      final AllRecord = await provider.getAllrecord(url,token);

      if (AllRecord != null && AllRecord != null && AllRecord.isNotEmpty) {
        allRecordModel.value=AllRecordModel.fromJson(AllRecord);

        print("name${allRecordModel.value.data!.dataList![3].user?.name}");



      } else {


        print("Failed to fetch user profile.");
      }
    } else {

      print("No token or user ID found.");
    }
  }

  final AudioPlayer player = AudioPlayer(); // Global instance

  void playAudio(String audioUrl) async {
    await player.play(UrlSource(audioUrl));
  }

}
