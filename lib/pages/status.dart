
// ignore_for_file: avoid_print

import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    
    return Scaffold(
      body: Center(
        child: Text('ServerStatus: ${socketService.serverStatus}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: (){
          socketService.emit('emitir-mensaje', {
            'nombre': 'flutter', 
            'mensaje': 'Hola desde flutter'
          });
        }
      ),
    );
  } 
}