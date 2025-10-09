import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/user_model.dart';
import 'package:unit_test/user_repository.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:mocktail/mocktail.dart';


// ----- Using MockTail package -----
// class MockHttpClient extends Mock implements Client {}

// void main() {
//   late UserRepository userRepository;
//   late MockHttpClient mockHttpClient;
//
//   setUp(() {
//     mockHttpClient = MockHttpClient();
//     userRepository = UserRepository(mockHttpClient);
//   });
//   group('UserRepository - ', () {
//     group('getUser - ', () {
//       test('given UserRepository class when getUser is called and status code is 200 then a user model should be returned', () async{
//         // Arrange
//         when(mockHttpClient.get(
//               Uri.parse('https://dummyjson.com/users/1'),
//             ),
//         ).thenAnswer((_) async {
//           return Response(
//             '''
//             {
//               "id":1,
//               "firstName":"Emily",
//               "lastName":"Johnson",
//               "age":28,
//               "gender":"female",
//               "email":"emily.johnson@x.dummyjson.com"
//             }
//             ''',
//             200);
//         });
//         // Act
//         final user = await userRepository.getUser();
//         // Assert
//         expect(user, isA<User>());
//       });
//
//       test('given UserRepository class when getUser is called and status code is not 200 then an exception should be thrown', () async{
//         // Arrange
//         when(
//           () => mockHttpClient.get(
//             Uri.parse('https://dummyjson.com/users/1'),
//           ),
//         ).thenAnswer((invocation) async {
//           return Response('Some Error Occurred', 404);
//         });
//         // Act
//         final user = userRepository.getUser();
//         // Assert
//         expect(user, throwsException);
//       });
//     });
//   });
// }




// ----- Using Mockito package -----
@GenerateMocks([http.Client])
import 'user_repository_test.mocks.dart';

void main() {
  late UserRepository userRepository;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    userRepository = UserRepository(mockHttpClient);
  });
  group('UserRepository - ', () {
    group('getUser - ', () {
      test('given UserRepository class when getUser is called and status code is 200 then a user model should be returned', () async{
        // Arrange
        when(mockHttpClient.get(
          Uri.parse('https://dummyjson.com/users/1'),
        ),
        ).thenAnswer((_) async {
          return Response(
              '''
            {
              "id":1,
              "firstName":"Emily",
              "lastName":"Johnson",
              "age":28,
              "gender":"female",
              "email":"emily.johnson@x.dummyjson.com"
            }
            ''',
              200);
        });
        // Act
        final user = await userRepository.getUser();
        // Assert
        expect(user, isA<User>());
      });

      test('given UserRepository class when getUser is called and status code is not 200 then an exception should be thrown', () async{
        // Arrange
        when(mockHttpClient.get(
          Uri.parse('https://dummyjson.com/users/1'),
        ),
        ).thenAnswer((_) async => Response('Some Error Occurred', 404));
        // Act
        final user = userRepository.getUser();
        // Assert
        expect(user, throwsException);
      });
    });
  });
}