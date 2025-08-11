import 'package:dio/dio.dart';
import 'package:my_app/models/article_model.dart';

class NewsService {
  NewsService(this.dio);
  final Dio dio;
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=822875b491544084b5df5bd93c7a5331&category=$category&country=us',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articleJson = jsonData['articles'];
      List<ArticleModel> articles = [];
      for (var article in articleJson) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articles.add(articleModel);
      }
      return articles;
    } catch (e) {
      return [];
    }
  }
}
