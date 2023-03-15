import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:krystal_digital/home/service/blog_service.dart';
import 'package:krystal_digital/network/base_client/base_client.dart';

import '../../network/base_client/exceptions.dart';
import '../model/BlogModel.dart';

class BlogController {

  BaseClient _baseClient = BaseClient();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  BlogService _blogService = BlogService();

  Future<List<BlogModel>> getAlBlogs() async {
    isLoading.value = true;
    try {
      var rawdata = await _blogService.getPosts();
      List<dynamic> jsonList = rawdata;
      if(rawdata != null){
        isLoading.value = false;
      }
      List<BlogModel> blogList = jsonList.map((json) => BlogModel.fromJson(json)).toList();
      print("HELLOBLOGS: ${blogList}");
      return blogList;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = handleErrorMessage(e);
      handleError(e);

      throw e;
    }
  }
}
