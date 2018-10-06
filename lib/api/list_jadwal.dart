import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/hari.dart';


Future<List<Hari>> fetchJadwalFromAPI() async {
  final response = await http.get(
      'http://palembangmengaji.forkismapalembang.com/api.php?hari=senin');
  print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<Hari> jadwalList = createJadwalList(responseJson);
  return jadwalList;
}

List<Hari> createJadwalList(List data) {
  List<Hari> list = new List();
  for (int i = 0; i < data.length; i++) {
    String masjid = data[i]["masjid"];
    String id = data[i]["id"];
    String waktu = data[i]["waktu"];
    Hari jadwal = new Hari(masjid: masjid, id: id, waktu: waktu);
    list.add(jadwal);
  }
  return list;
}