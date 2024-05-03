import 'package:bloc_login_add_product/utlis/constants.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              width: screenSize.width,
              height: screenSize.height / 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Container(
                      width: screenSize.width / 4,
                      height: screenSize.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product name $index"),
                        KHeight10,
                        const Text("Description")
                      ],
                    ),
                    const Spacer(),
                    const Text("price"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
