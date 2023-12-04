import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimarket_app/core/common/horizontal_space.dart';
import 'package:unimarket_app/core/common/vertical_space.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Icon(
                                Icons.menu,
                                // size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          horizontalSpace(10),
                          const Column(
                            children: [
                              Text("Welcome back"),
                              Text("  Resten Madzalo")
                            ],
                          )
                        ],
                      ),
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/shoes_1.png"),
                      ),
                    ],
                  ),
                  verticalSpace(15),
                  SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(10),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.filter_tilt_shift,
                              // size: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  const Text(
                    "New Arrivals",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(5),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 170,
                              height: 200,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(95, 194, 143, 186),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 4))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.23,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/shoes_1.png"))),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Sneakers",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("K25000",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.add_shopping_cart,
                                              // color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  verticalSpace(10),
                  const Text(
                    "Top Selling",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(5),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products!.length,
                        itemBuilder: (context, index) {
                          final product = state.products![index];
                          print(product);
                          print(product.images);
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 170,
                              height: 200,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(95, 194, 143, 186),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 4))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.23,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    product.images![0]))),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${product.name}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${product.price}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.add_shopping_cart,
                                              // color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
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
