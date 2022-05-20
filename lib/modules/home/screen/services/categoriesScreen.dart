import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/Categories.dart';
import 'package:tourista/modules/home/screen/homePagesNav/camera.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/edit_profile.dart';
import 'package:tourista/modules/home/screen/homePagesNav/favouritScreen/favourite.dart';
import 'package:tourista/modules/home/screen/services/products_screen.dart';
import 'package:tourista/modules/home/screen/services/BazzarsServices.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  List<CategoriesModel> model = [
    CategoriesModel(
        name: 'Restaurants', image: "assets/images/Cairo-McDonalds.jpg"),
    CategoriesModel(
        name: 'Bazaars',
        image:
            "assets/images/bazaar-asswan-egypt-spices-food-cool-drinks-shop-old-town-aswan-200338605.jpg"),
    CategoriesModel(
        name: 'Night Life', image: "assets/images/Cairo-McDonalds.jpg"),
    CategoriesModel(
        name: 'Daily Services', image: "assets/images/pharmacy.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body : ListView.separated(
            itemBuilder: (context, index) => buildCatItem(model[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: model.length,
          ),
        );
      },
    );
  }

  Widget buildCatItem(CategoriesModel model, context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              switch (model.name) {
                case "Restaurants":
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => favourite()),
                    );
                    break;
                  }
                case "Bazaars":
                  {
                    navigateTo(context, BazzarServices());
                    break;
                  }
                case "Night Life":
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BazzarServices()),
                    );
                    break;
                  }
                case "Daily Services":
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => camera()),
                    );
                    break;
                  }
              }
              ;
            },
            child: Row(
              children: [
                Image.asset(
                  "${model.image}",
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  "${model.name}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      );
}
