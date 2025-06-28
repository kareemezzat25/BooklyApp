import 'package:bookly_app/features/home/presentation/widgets/best_seller_itemlist.dart';
import 'package:bookly_app/features/home/presentation/widgets/carousel_slider.dart';
import 'package:bookly_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSliderBooks(),
            SizedBox(height: 20),
            Text("Best Seller", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 12),
            Expanded(child: BestSellerItemListView()),
          ],
        ),
      ),
    );
  }
}
