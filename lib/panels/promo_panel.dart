import 'package:flutter/material.dart';

class PromoPanel extends StatelessWidget {
  const PromoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 160,
      pinned: false, // не убирать AppBar совсем при скролле
      expandedHeight: 160, // на колько изначально ратягивается AppBar
      title: Container(
          color: Colors.red,
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 100,
                color: Colors.yellow,
                child: const Center(
                  child: Text('promo1'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('promo2'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.yellow,
                child: const Center(
                  child: Text('promo1'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('promo2'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.yellow,
                child: const Center(
                  child: Text('promo1'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('promo2'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.yellow,
                child: const Center(
                  child: Text('promo1'),
                ),
              ),
              Container(
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('promo2'),
                ),
              )
            ],
          )),
    );
  }
}
