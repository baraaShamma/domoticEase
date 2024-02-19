import 'package:domotic_ease/core/class/crud.dart';
import 'package:domotic_ease/link_api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Socket {

  Socket();

  connectSocket() async {
    final channel = WebSocketChannel.connect(
      Uri.parse(AppLink.webSocket),
    );
  }
}
