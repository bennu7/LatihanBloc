import 'dart:async';

import 'package:flutter/material.dart';

class CounterBloc {
  // catatan BLOC
  // 1. Pertama ia akan masuk melalui sink get => StreamSink() get
  //2. Lanjut diproses menuju mesin (input) dengan controller => StreamController
  // 3. hasil dari proses mesin dijadikan output controler => StreamController()
  // 4. lanjut hasil proses nya di event listen sink get => StreamSink() get
  // 5. tahap akhir menuju ke aplikasi/output dengan Stream => Steam() dengan get

  int _counter = 0;

  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  StreamController _outputController = StreamController();
  StreamSink get _sinkOut => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      if (event == "add") {
        _counter++;
      } else if (event == "minus") {
        _counter--;
      } else {
        _counter;
      }
      _sinkOut.add(_counter);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
