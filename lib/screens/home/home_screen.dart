import 'package:api_calling/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ProductController lisenableW =
        Provider.of<ProductController>(context, listen: false);
    ProductController lisenableR = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Api Calling'),
      ),
      body: GridView.builder(
        itemCount: lisenableW.productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 3),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            height: size.height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(3, 3),
                    blurRadius: 4,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    '${lisenableW.productList[index].image}',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '${lisenableW.productList[index].title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  '${lisenableW.productList[index].description}',
                  style: TextStyle(color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${lisenableW.productList[index].price} \$',
                  style: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  textAlign: TextAlign.center,
                  '${lisenableW.productList[index].ratingModel?.rate} ⭐',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.yellow,
                    fontSize: 12,
                  ),
                ),
                // RatingBar.builder(
                //   initialRating: mutable.allcategoryProduct[index].rating,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 5,
                //   itemBuilder: (context, _) => const Icon(
                //     Icons.star,
                //     color: Colors.amber,
                //   ),
                //   itemSize: size.height * 0.025,
                //   onRatingUpdate: (rating) {},
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
