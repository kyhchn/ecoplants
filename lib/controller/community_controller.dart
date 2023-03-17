import 'package:ecoplants/model/community.dart';
import 'package:ecoplants/services/community_service.dart';
import 'package:get/get.dart';

class CommunityController extends GetxController {
  static CommunityController get i => Get.find();
  var communityList = <Community>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  Future<void> fetch() async {
    isLoading(true);
    final data = await CommunityService().getCommunityList();
    communityList = data.obs;
    isLoading(false);
  }
}
