import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

class HttpAdapter {
  final http.Client client;

  HttpAdapter(this.client);

  Future<void> request({
    @required String url,
    @required String method,
  }) async {
    final headers = {
      'content-type': 'appplication/json',
      'accept': 'application/json'
    };
    await client.post(Uri.parse(url), headers: headers);
  }
}

class ClientSpy extends Mock implements http.Client {}

void main() {

  HttpAdapter sut;
  ClientSpy client;
  String url;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });
  group('post', () {
    test('Should call post with correct values', () async {
     
      await sut.request(url: url, method: 'post');

      verify(client.post(Uri.parse(url), headers: {
        'content-type': 'appplication/json',
        'accept': 'application/json'
      }));
    });
  });
}
