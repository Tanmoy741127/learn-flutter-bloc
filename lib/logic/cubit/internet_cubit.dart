import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.Wifi);
      }else if(result == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.Mobile);
      }else if(result == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected (ConnectionType _connectionType) {
    emit(InternetConnected(connectionType: _connectionType));
  }

  void emitInternetDisconnected () {
    emit(InternetDisconnected());
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
