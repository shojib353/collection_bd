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
  //var allRecordModel = AllRecordModel().obs;
  RxString? name =" ".obs;






  var allRecordModel = AllRecordModel(data: Data(dataList: [])).obs;
  var isLoading = false.obs;
  var page = 1.obs; // Current page
  final int perPage = 100; // Items per API call
  var newData;


  Future<void> fetchRecords() async {

    if (isLoading.value) return;
    isLoading.value = true;

    String url =
        "http://collection.bangla.gov.bd/api/campaign/record?campaign-id=1&per-page=$perPage&page=${page.value}";
    var token = await getSavedToken();
    var userId = await getSavedUserId();

    try {
      if (token != null && userId != null) {
        final response = await provider.getAllrecord(url, token);
        print("length########## ${response}");


        if (response!=null) {
           newData = AllRecordModel.fromJson(response);
          print("length########## ${newData.data?.dataList?.length}");
          if(newData.data?.dataList?.length==null) return;
          allRecordModel.update((val) {
            val?.data!.dataList ??= [];

            val?.data!.dataList!.addAll(newData.data!.dataList!); // newData.data?.dataList ?? []; // Ensure it's not null
          });
          isLoading.value = false;
          page.value++; // Increase page number for next call
        } else {
          print("Error fetching data: ${response.statusCode}");
        }
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }


  // Future<void> fetchRecords({bool isInitial = false}) async {
  //   if (isLoading.value) return; // Prevent duplicate calls
  //   isLoading.value = true;
  //
  //   String url =
  //       "http://collection.bangla.gov.bd/api/campaign/record?campaign-id=1&per-page=$perPage&page=${page.value}";
  //     var token = await getSavedToken(); // Retrieve saved token
  //     var userId = await getSavedUserId(); // Retrieve saved user ID
  //
  //   try {
  //     if (token != null && userId != null) {
  //       final response = await provider.getAllrecord(url, token);
  //
  //
  //       if (response != null && response != null && response.isNotEmpty) {
  //         allRecordModel.value = AllRecordModel.fromJson(response);
  //
  //         var newData = Data.fromJson(response['data']);
  //
  //
  //         // If it's the first call, replace the list; otherwise, append
  //         if (isInitial) {
  //           allRecordModel.value.data!.dataList = newData.dataList;
  //         } else {
  //           allRecordModel.update((val) {
  //             val!.data!.dataList!.addAll(newData.dataList!);
  //           });
  //         }
  //
  //         page.value++; // Increase page number for next call
  //       } else {
  //         print("Error fetching data: ${response.statusCode}");
  //       }
  //     }
  //   } catch (e) {
  //     print("Exception: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }






  @override
  void onInit() {
    super.onInit();
    //getAllRecord();
    fetchRecords();
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

  // void getAllRecord() async {
  //
  //   var token = await getSavedToken(); // Retrieve saved token
  //   var userId = await getSavedUserId(); // Retrieve saved user ID
  //   String url= all_record_url;
  //   print("profile userid =$userId");
  //
  //
  //   // Redirect to login if no token
  //
  //
  //   if (token != null && userId != null) {
  //     print("profile token =$token");
  //     final AllRecord = await provider.getAllrecord(url,token);
  //
  //     if (AllRecord != null && AllRecord != null && AllRecord.isNotEmpty) {
  //       allRecordModel.value=AllRecordModel.fromJson(AllRecord);
  //
  //       print("name${allRecordModel.value.data!.dataList![3].user?.name}");
  //
  //
  //
  //     } else {
  //
  //
  //       print("Failed to fetch user profile.");
  //     }
  //   } else {
  //
  //     print("No token or user ID found.");
  //   }
  // }

  final AudioPlayer player = AudioPlayer(); // Global instance

  void playAudio(String audioUrl) async {
    await player.play(UrlSource(audioUrl));
  }

}
