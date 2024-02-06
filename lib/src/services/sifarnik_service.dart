// package we need for json encode/decode
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_ticket_ris/src/data/models/response/sifarnik/sifarnik_model/sifarnik_model.dart';
import 'package:e_ticket_ris/src/services/base_service.dart';

import '../constants/esifarnik.dart';

class SifarnikService extends BaseService {
  Future<List<SifarnikModel>> get(ESifarnik type) async {
    try {
      final response =
          await dio.get('/sifarnik', queryParameters: {"sifarnik": type.name});
      //Iterable l = json.decode(response.data);
      List<SifarnikModel> sifarnik = List<SifarnikModel>.from(
          (response.data as Iterable)
              .map((model) => SifarnikModel.fromJson(model)));
      return sifarnik;
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }
}
