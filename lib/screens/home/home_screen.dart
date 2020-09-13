import 'package:flutter/material.dart';
import 'package:workshopcodeconflutter/models/hw_collection.dart';
import 'package:workshopcodeconflutter/repositories/mini_collection_repository.dart';
import 'package:workshopcodeconflutter/screens/collection/collections_arguments.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final collectionRepository = MiniCollectionRepository();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      child: Container(
        child: FutureBuilder(
          future: collectionRepository.get(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                return ListView.separated(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final MiniCollection miniCollection =
                          snapshot.data[index];
                      return ListTile(
                        leading: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.network(miniCollection.imageURL)),
                        title: Text("${miniCollection.name}"),
                        subtitle: Text(
                          'Total de Minis: ${miniCollection.totalItems}',
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pushNamed(context, '/collectionDetails',
                              arguments:
                                  CollectionDetailsArguments(miniCollection));
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider());
                break;
            }

            return Text('');
          },
        ),
      ),
    ));
  }
}
