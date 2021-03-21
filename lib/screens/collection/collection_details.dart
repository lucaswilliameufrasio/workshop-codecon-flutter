import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workshopcodeconflutter/models/car.dart';
import 'package:workshopcodeconflutter/models/hw_collection.dart';
import 'package:workshopcodeconflutter/repositories/car_repository.dart';
import 'package:workshopcodeconflutter/screens/collection/components/bookmarked_icon.dart';

class CollectionDetails extends StatefulWidget {
  final MiniCollection miniCollection;

  const CollectionDetails({Key key, this.miniCollection}) : super(key: key);

  @override
  _CollectionDetailsState createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends State<CollectionDetails> {
  List<int> inCollection = <int>[];
  final carRepository = CarRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.miniCollection.name),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: carRepository.get(widget.miniCollection.id),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  continue loading;
                  break;
                loading:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.active:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    DioError error = snapshot.error;
                    print(error.error);
                    return Column(children: [
                      Expanded(
                        child: Center(
                          child: Text("Oops, algo de errado aconteceu."),
                        ),
                      ),
                    ]);
                  }
                  List<Car> cars = snapshot.data;

                  return PageView(
                    controller: PageController(initialPage: 1),
                    scrollDirection: Axis.horizontal,
                    children: cars.map((Car car) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (car.mainImages.length > 0)
                              Image.network(car.mainImages[0]['URL']),
                            Text(car.name),
                            BookmarkIcon(
                              carId: car.id,
                              inCollection: inCollection,
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
                  break;
              }

              return Text('');
            },
          ),
        ),
      ),
    );
  }
}
