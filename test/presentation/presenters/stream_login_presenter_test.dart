import 'package:faker/faker.dart';
import 'package:fordev/presentation/presenters/presenters.dart';
import 'package:fordev/presentation/protocols/validation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';




class ValidationSpy extends Mock implements Validation {}

void main() {

  StreamLoginPresenter sut;
  ValidationSpy validation;
  String email;

  PostExpectation mockValidationCall(String field) => 
    when(validation.validate(field: field == null ? anyNamed('field') : field, value: anyNamed('value')));

  void mockValidation({String field, String value}) {
    mockValidationCall(field).thenReturn(value);
  }

  setUp(() {
     validation = ValidationSpy();
     sut = StreamLoginPresenter(validation: validation);
     email = faker.internet.email();
     mockValidation();
  });

  


  test('Should call Validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

//Testando uma Stream
  test('Should call Validation with correct email', () {
   mockValidation(value: 'error');

    expectLater(sut.emailErrorStream, emits('error'));

    sut.validateEmail(email);
  });
}