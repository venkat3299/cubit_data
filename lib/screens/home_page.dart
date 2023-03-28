
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_1/models/model.dart';
import 'package:proj_1/state/home_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

 class BeerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')
    ,
    centerTitle: true,),
      body: BlocProvider(
        create: (_) => BeerCubit()..getAles(),
        child: BlocBuilder<BeerCubit, List<Beer>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final beer = state[index];
                  return GestureDetector(
                    onTap: () {
                      
                    },
                    child: 
                    ListTile(
                      leading: Image.network(beer.image,
                       
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Image.network("https://www.totalwine.com/media/sys_master/twmmedia/hd2/hfd/11348869382174.png");
                        },
                        ),
                        trailing: Text(beer.price.toString()),
                      title: Text(beer.name.toString()),
                      subtitle: Row(
                        children: [
                          RatingBar.builder(
                        initialRating:  double.parse(beer.rating["average"].toString()),
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                     Text(" (Reviews: "+beer.rating["reviews"].toString()+")")   ],
                      )
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

