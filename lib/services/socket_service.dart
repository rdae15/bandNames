
// ignore_for_file: constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings, library_prefixes



import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/foundation.dart';

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;
  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig(){
     // Dart client
  _socket = IO.io('http://10.0.2.2:3000/', {
    'transports': ['websocket'],
    'autoConnect': true
  });
  _socket.on('connect', (_) {
    print('connect');
    _serverStatus = ServerStatus.Online;
    notifyListeners();
    
  });
  _socket.on('disconnect',(_){
    print('disconnect');
    _serverStatus = ServerStatus.Offline;
    notifyListeners();
  });

  }
}