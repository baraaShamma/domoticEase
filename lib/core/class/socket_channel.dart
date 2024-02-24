import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketChannel {
  SocketChannel(this._getIOWebSocketChannel) {
    _startConnection();
  }

  final WebSocketChannel Function() _getIOWebSocketChannel;

  late WebSocketChannel _ioWebSocketChannel;

  WebSocketSink get _sink => _ioWebSocketChannel.sink;

  late Stream<dynamic> _innerStream;

  final _outerStreamSubject = BehaviorSubject<dynamic>();

  Stream<dynamic> get stream => _outerStreamSubject.stream;

  bool _isFirstRestart = false;
  bool _isFollowingRestart = false;
  bool _isManuallyClosed = false;

  void _handleLostConnection() {
    if (_isFirstRestart && !_isFollowingRestart) {
      Future.delayed(const Duration(seconds: 5), () {
        _isFollowingRestart = false;
        _startConnection();
      });
      _isFollowingRestart = true;
    } else {
      _isFirstRestart = true;
      _startConnection();
    }
  }

  void _startConnection() async {
    _ioWebSocketChannel = _getIOWebSocketChannel();
    try {
      await _ioWebSocketChannel.ready;
    } catch (e) {
      print("WebsocketChannel was unable to establish connection");
    }
    _innerStream = _ioWebSocketChannel.stream;
    _innerStream.listen(
      (event) {
        _isFirstRestart = false;
        _outerStreamSubject.add(event);
      },
      cancelOnError: true,
      onError: (error) {
        _handleLostConnection();
      },
      onDone: () {
        if (!_isManuallyClosed) {
          _handleLostConnection();
        }
      },
    );
  }

  void sendMessage(String message) => _sink.add(message);

  void close() {
    _isManuallyClosed = true;
    _sink.close();
  }
}
