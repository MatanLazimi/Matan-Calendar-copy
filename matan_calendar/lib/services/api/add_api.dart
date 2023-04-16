import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/add_model.dart';
import '../logger/logger.dart';

class AddApi {
  static Future postAddForm(AddModel data) async {
    logger.d('postAddForm' + data.toString());
    var response;
    Map<String, dynamic> body = data.toJson();
    logger.d('body: $body');
    try {
      //send data to firestore
      response = await FirebaseFirestore.instance.collection('add').add(body);
    } catch (e) {
      logger.e(e);
      return false;
    }

    return response;
  }

  static Future getAddForm() async {
    logger.d('getAddForm');
    var response;
    try {
      //get data from firestore
      response = await FirebaseFirestore.instance.collection('add').get();
    } catch (e) {
      logger.e(e);
      return false;
    }
    // change to list of AddModel
    response = response.docs.map((e) => AddModel.fromDocument(e)).toList();
    return response;
  }
}
