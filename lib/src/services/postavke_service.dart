import 'package:dio/dio.dart';
import 'package:e_ticket_ris/src/services/base_service.dart';

import '../data/models/response/base/postavke/postavke_model.dart';

class PostavkeService extends BaseService {
  Future<PostavkeModel> ucitajPostavke() async {
    try {
      final response = await dio.get('/postavke');
      return PostavkeModel.fromJson(response.data);
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }
}
