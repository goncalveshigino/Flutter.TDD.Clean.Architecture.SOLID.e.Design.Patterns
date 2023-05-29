import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:fordev/domain/usecases/authentication.dart';
import 'package:fordev/domain/helpers/helpers.dart';

import 'package:fordev/data/usecases/usecases.dart';
import 'package:fordev/data/http/http.dart';





class HttpClientSpy extends Mock implements HttpClient {}

void main() {

  RemoteAuthentication sut;
  HttpClient httpClient;
  String url;
  AuthenticationParams params;

  setUp((){
     httpClient = HttpClientSpy();
     url = faker.internet.httpUrl();
     sut = RemoteAuthentication(httpClient: httpClient, url: url);
     params = AuthenticationParams( email: faker.internet.email(), password: faker.internet.password() );
  });

  test('should call HttpClient with correct values', () async {
  
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
       .thenAnswer((_) async => {'accessToken': faker.guid.guid(), 'name': faker.person.name()});
  
  
  

    await sut.auth( params );

    verify(httpClient.request(
      url: url,
      method: 'post', 
      body: {
        'email': params.email, 
        'password': params.password
      }
      ));
  });


  test('should throw UnexpectedError if HttpClient return 400', () async {
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
       .thenThrow(HttpError.badRequest);
  


    final future = sut.auth( params );

     expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError if HttpClient return 404', () async {
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
       .thenThrow(HttpError.notFound);
  


    final future = sut.auth( params );

     expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError if HttpClient return 500', () async {
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
       .thenThrow(HttpError.serverError);
  


    final future = sut.auth( params );

     expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw InvalidCredentialsError if HttpClient return 401', () async {
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
       .thenThrow(HttpError.unauthorized);
  


    final future = sut.auth( params );

     expect(future, throwsA(DomainError.invalidCredetials));
  });


  test('should return an Account if HttpClient return 200', () async {
    final accessToken = faker.guid.guid();
    when(httpClient.request(url: anyNamed('url'), method: anyNamed('method'), body: anyNamed('body')))
       .thenAnswer((_) async => {'accessToken': accessToken, 'name': faker.person.name()});
  


    final account =  await sut.auth( params );

     expect(account.token,  accessToken);
  });


}
