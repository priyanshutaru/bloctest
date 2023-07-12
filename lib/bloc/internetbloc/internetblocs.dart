import 'dart:async';

import 'package:bloctest/bloc/internetbloc/internet_event.dart';
import 'package:bloctest/bloc/internetbloc/internet_states.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetStates> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubcription;

  InternetBloc() : super(InternetInsitialStates()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedStates()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostStates()));

    connectivitySubcription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubcription?.cancel();
    return super.close();
  }
}
