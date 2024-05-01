// import 'package:core/domain/entities/movie.dart';
// import 'package:core/presentation/bloc/top_rated_movies_notifier.dart';
// import 'package:core/presentation/pages/sublist_page/top_rated_movies_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc/bloc.dart';

// import '../../../../core/lib/utils/state_enum.dart';
// import '../../helper/test_helper_movie.mocks.dart';

// void main() {
//   late MockTopRatedMoviesNotifier mockNotifier;

//   setUp(() {
//     mockNotifier = MockTopRatedMoviesNotifier();
//   });

//   Widget _makeTestableWidget(Widget body) {
//     return ChangeNotifierProvider<TopRatedMoviesNotifier>.value(
//       value: mockNotifier,
//       child: MaterialApp(
//         home: body,
//       ),
//     );
//   }

//   testWidgets('Page should display progress bar when loading',
//       (WidgetTester tester) async {
//     when(mockNotifier.state).thenReturn(RequestState.loading);

//     final progressFinder = find.byType(CircularProgressIndicator);
//     final centerFinder = find.byType(Center);

//     await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

//     expect(centerFinder, findsOneWidget);
//     expect(progressFinder, findsOneWidget);
//   });

//   testWidgets('Page should display when data is loaded',
//       (WidgetTester tester) async {
//     when(mockNotifier.state).thenReturn(RequestState.loaded);
//     when(mockNotifier.movies).thenReturn(<Movie>[]);

//     final listViewFinder = find.byType(ListView);

//     await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

//     expect(listViewFinder, findsOneWidget);
//   });

//   testWidgets('Page should display text with message when Error',
//       (WidgetTester tester) async {
//     when(mockNotifier.state).thenReturn(RequestState.error);
//     when(mockNotifier.message).thenReturn('Error message');

//     final textFinder = find.byKey(Key('error_message'));

//     await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

//     expect(textFinder, findsOneWidget);
//   });
// }
//TODO: jiwo
void main(){}