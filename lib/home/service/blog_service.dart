import '../../network/base_client/base_client.dart';


const String _productionURL = "https://jsonplaceholder.typicode.com";
String get url => _productionURL;

class BlogService{

  final baseClient = BaseClient();

  Future<dynamic> getPosts() async {
    try {
      return await baseClient.get(
        url,'/posts',
      );
    } catch (error) {
      return Future.error(error);
    }
  }


  getSingleBlog(){

  }

}