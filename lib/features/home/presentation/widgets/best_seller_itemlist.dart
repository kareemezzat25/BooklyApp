import 'package:bookly_app/features/home/presentation/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerItemListView extends StatelessWidget {
  const BestSellerItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BestSellerItem();
      },
      itemCount: 10,
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
    );
  }
}
