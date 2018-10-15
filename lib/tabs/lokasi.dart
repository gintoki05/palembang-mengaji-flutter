import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class LokasiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LokasiPageState();
  }
}

class _LokasiPageState extends State<LokasiPage> {
  Uri _staticMapUri;
  final FocusNode _addressInputFocusNode = FocusNode();

  @override
  void initState() {
    _addressInputFocusNode.addListener(_updateLocation);
    getStaticMap();
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  void getStaticMap() {
    final StaticMapProvider staticMapViewProvider =
        StaticMapProvider('AIzaSyB4Lzd6JAQbbKG3EESAXuVU_K7u39wvBqU');
    final Uri staticMapUri = staticMapViewProvider.getStaticUriWithMarkers(
        [Marker('position', 'Position', -2.939255, 104.729347)],
        center: Location(-2.939255, 104.729347),
        width: 500,
        height: 300,
        maptype: StaticMapViewType.roadmap);
    setState(() {
      _staticMapUri = staticMapUri;
    });
  }

  void _updateLocation() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Image.network(_staticMapUri.toString())],
    );
  }
}
