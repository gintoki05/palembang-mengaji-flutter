import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/info.dart';

Future<List<Info>> fetchInfoFromAPI() async {
  final response =
      await http.get('http://palembangmengaji.forkismapalembang.com/info.php');
  print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<Info> infoList = createInfoList(responseJson);
  return infoList;
}

List<Info> createInfoList(List data) {
  List<Info> list = new List();
  for (int i = 0; i < data.length; i++) {
    String id = data[i]["id"];
    String judul = data[i]["judul"];
    String deskripsi = data[i]["deskripsi"];
    String image = data[i]["image"];
    String tanggal = data[i]["tanggal"];
    String foto = data[i]["foto"];
    Info jadwal = new Info(
        id: id,
        judul: judul,
        deskripsi: deskripsi,
        image: image,
        tanggal: tanggal,
        foto: foto);
    list.add(jadwal);
  }
  return list;
}
