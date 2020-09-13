import 'package:flutter/widgets.dart';
import 'package:workshopcodeconflutter/screens/collection/collection_details.dart';
import 'package:workshopcodeconflutter/screens/collection/collections_arguments.dart';
import 'package:workshopcodeconflutter/screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomeScreen(),
  '/collectionDetails': (BuildContext context) {
    final CollectionDetailsArguments args =
        ModalRoute.of(context).settings.arguments;

    return CollectionDetails(
      miniCollection: args.miniCollection,
    );
  },
};
