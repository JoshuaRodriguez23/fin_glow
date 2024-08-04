import 'package:fin_glow/presentation/screens/movement_transfer_screen.dart';
import 'package:fin_glow/presentation/screens/new_account_screen.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  TransferScreenState createState() => TransferScreenState();
}

class TransferScreenState extends State<TransferScreen> {
  final List<Map<String, String>> _accounts = [];

  @override
  void initState() {
    super.initState();
    _loadAccounts();
  }

  void _loadAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? accountsString = prefs.getString('accounts');

    if (accountsString != null) {
      final List<dynamic> accountsJson = json.decode(accountsString);
      setState(() {
        _accounts.clear();
        _accounts.addAll(
            accountsJson.map((account) => Map<String, String>.from(account)));
      });
    }
  }

  void _saveAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accounts', json.encode(_accounts));
  }

  void _addAccount(String name, String accountNumber) {
    setState(() {
      _accounts.add({'name': name, 'accountNumber': accountNumber});
    });
    _saveAccounts();
  }

  void _navigateToAccountDetailScreen(String name, String accountNumber) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            AccountDetailScreen(name: name, accountNumber: accountNumber),
      ),
    );
  }

  void _navigateToNewAccountScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewAccountScreen(onSave: _addAccount),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromRGBO(1, 19, 48, 1),
                Color.fromRGBO(4, 38, 92, 1),
              ],
              center: Alignment.center,
              radius: 1.0,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const CustomAppBar(title: 'Transferir dinero'),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(76, 16, 57, 121),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF40A2F1),
                      width: 2,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF40A2F1),
                        Color(0xFF103979),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'A cuenta FinGlow',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Con e-mail, celular o nombre.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Bootstrap.chevron_right,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF40A2F1),
                        thickness: 2,
                      ),
                      GestureDetector(
                        onTap: _navigateToNewAccountScreen,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'A cuenta bancaria o digital',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Con CLABE o tarjeta.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Bootstrap.chevron_right,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Volver a transferir',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Icon(
                        Bootstrap.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _accounts.length,
                    itemBuilder: (context, index) {
                      final account = _accounts[index];
                      return GestureDetector(
                        onTap: () => _navigateToAccountDetailScreen(
                            account['name']!, account['accountNumber']!),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(76, 16, 57, 121),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF40A2F1),
                              width: 2,
                            ),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF40A2F1),
                                Color(0xFF103979),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                account['accountNumber']!,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
