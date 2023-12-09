import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
import 'package:unimarket_app/features/home/product_details_screen.dart';
import 'package:unimarket_app/features/home/widgets/product_widget.dart';
import 'package:unimarket_app/features/home/widgets/searchbar_widget.dart';
import 'package:unimarket_app/features/home/widgets/topbar_widget.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:unimarket_app/features/product/presentation/bloc/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home-screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = [
    "All",
    "Watches",
    "Headphones",
    "Speakers",
    "Earphones",
    "Ladies Bags",
    "Electronic",
    "Men Shoes",
    "Women Shoes",
    "Dresses",
    "Shirts"
  ];

  final TextEditingController _searchController = TextEditingController();

  late String selectedFilter = filters[0];

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: SingleChildScrollView(
          child:
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is ProductsLoadingDone) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopBarWidget(),
                  verticalSpace(15),
                  SearchBarWidget(searchController: _searchController),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filters.length,
                        itemBuilder: (context, index) {
                          final filter = filters[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFilter = filter;
                                });
                              },
                              child: Chip(
                                elevation: 4,
                                backgroundColor: selectedFilter == filter
                                    ? const Color.fromARGB(255, 24, 43, 185)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                label: Text(
                                  filter,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: selectedFilter == filter
                                          ? Colors.white
                                          : null),
                                ),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 20, 70, 219),
                                    width: 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                              ),
                            ),
                          );
                        }),
                  ),
                  verticalSpace(10),
                  SizedBox(
                    height: 500,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.9,
                                // crossAxisSpacing: 8,
                                mainAxisSpacing: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: state.products!.length,
                        itemBuilder: (context, index) {
                          final product = state.products![index];
                          print(product);
                          print(product.images);
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                                product: product)));
                              },
                              child: ProductWidget(product: product));
                        }),
                  )
                ],
              );
            }

            if (state is ProductsLoadingDoneError) {
              return Text(state.error?.response?.statusMessage as String);
            }

            return Container();
          }),
        ),
      ),
    );
  }
}
