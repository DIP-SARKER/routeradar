import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/pages/menu.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _balance = 0.0;

  final _amountController = TextEditingController();
  final List<Map<String, dynamic>> _transactions = [
    {"amount": 50.0, "type": "credit", "date": "2025-04-01"},
    {"amount": 30.0, "type": "debit", "date": "2025-04-02"},
    {"amount": 120.0, "type": "credit", "date": "2025-04-03"},
    {"amount": 25.0, "type": "debit", "date": "2025-04-04"},
    {"amount": 75.0, "type": "credit", "date": "2025-04-05"},
    {"amount": 40.0, "type": "debit", "date": "2025-04-05"},
    {"amount": 60.0, "type": "credit", "date": "2025-04-06"},
    {"amount": 35.0, "type": "debit", "date": "2025-04-06"},
    {"amount": 100.0, "type": "credit", "date": "2025-04-07"},
    {"amount": 45.0, "type": "debit", "date": "2025-04-07"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    database.value.getUserinfo("balance").then((value) {
      setState(() {
        _balance = double.parse(value);
      });
    });
  }

  void _addBalance() {
    final amount = double.tryParse(_amountController.text);
    if (amount != null && amount > 0) {
      setState(() {
        _balance += amount;
        database.value.UpdateBalance(amount); //, "Credit", Timestamp.now()
        _transactions.insert(0, {
          'amount': amount,
          'type': 'Credit',
          'date': DateTime.now().toIso8601String().split('T').first,
        });
      });
      _amountController.clear();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                )),
            content: Text("Balance added successfully!",
                style: TextStyle(color: Colors.white, fontSize: 15)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wallet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        toolbarHeight: 100,
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(HeroIcons.bars_4),
                onPressed: () {
                  Get.to(
                    () => MenuPage(),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(milliseconds: 1300),
                  );
                }),
          )
        ],
        bottom: TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.account_balance_wallet), text: 'Overview'),
            Tab(icon: Icon(Icons.add), text: 'Add Balance'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildAddBalanceView(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBalanceView(),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transaction History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildTransactionHistory(),
        ],
      ),
    );
  }

  Widget _buildBalanceView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 15, bottom: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.account_balance_wallet, size: 40, color: Colors.white),
              Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
              Text(
                '৳ ${_balance.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        final txn = _transactions[index];
        final isCredit = txn['type'] == 'credit';
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            leading: Icon(
              isCredit ? Icons.arrow_downward : Icons.arrow_upward,
              color: isCredit ? Colors.green : Colors.red,
            ),
            title: Text(
              '${txn['type']} - ৳${txn['amount']}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text('Date: ${txn['date']}'),
            trailing: Text(
              isCredit ? '+${txn['amount']}' : '-${txn['amount']}',
              style: TextStyle(
                color: isCredit ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddBalanceView() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Balance',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Enter amount (৳)',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.attach_money),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: _addBalance,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ),
                label: Text(
                  'Add Balance',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
