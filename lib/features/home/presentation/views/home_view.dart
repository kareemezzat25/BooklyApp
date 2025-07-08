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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CarouselSliderBooks()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(
                "Newest",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverFillRemaining(child: BestSellerItemListView()),
          ],
        ),
      ),
    );
  }
}
