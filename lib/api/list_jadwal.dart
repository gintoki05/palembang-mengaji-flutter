import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/hari.dart';

Future<List<Hari>> fetchJadwalFromAPI() async {

  final response = await http
      .get('http://palembangmengaji.forkismapalembang.com/api.php?hari=senin');
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
    String pengisi = data[i]["pengisi"];
    String tema = data[i]["tema"];
    String tanggal = data[i]["tanggal"];
    String kategori = data[i]["kategori"];
    Hari jadwal = new Hari(
        masjid: masjid,
        id: id,
        waktu: waktu,
        pengisi: pengisi,
        tema: tema,
        tanggal: tanggal,
        kategori: kategori);
    list.add(jadwal);
  }
  return list;
}
