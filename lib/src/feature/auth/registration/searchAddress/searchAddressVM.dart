import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchAddressVmProvider =
    ChangeNotifierProvider.autoDispose<SearchAddressVm>((ref) {
  return SearchAddressVm();
});

class SearchAddressVm extends ChangeNotifier {
  TextEditingController searchAddress = TextEditingController();

  onNext(context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => SearchAddressScreen()));
  }
}
