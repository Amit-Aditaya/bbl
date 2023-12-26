import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  void monitorInternetConnection() async {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      try {
        if (connectivityResult == ConnectivityResult.wifi) {
          emitInternetConnected(ConnectionType.wifi);
        } else if (connectivityResult == ConnectivityResult.mobile) {
          emitInternetConnected(ConnectionType.mobileData);
        } else if (connectivityResult == ConnectivityResult.none) {
          emitInternetDisconnected();
        }
      } on SocketException catch (_) {
        emitInternetDisconnected();
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
