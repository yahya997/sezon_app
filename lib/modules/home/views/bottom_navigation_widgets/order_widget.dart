import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/core/widgets/custom_app_bar.dart';
import 'package:sezon_app/modules/home/views/widgets/complete_orders.dart';
import 'package:sezon_app/modules/home/views/widgets/pending_orders.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _MyOrderWidgetState();
}

class _MyOrderWidgetState extends State<OrderWidget>
    with SingleTickerProviderStateMixin {
  static  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'pending_orders'.tr,
    ),
    Tab(text: 'completed_orders'.tr),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'orders'.tr,
        withLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.red,
            controller: _tabController,
            tabs: myTabs,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children:const [
              PendingOrders(),

              CompletedOrders(),
            ]),
          ),
        ],
      ),
    );
  }
}



