import 'package:expense_manager/screens/dashboard.dart';
import 'package:expense_manager/screens/payee_home.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/data/services/injection_container.dart';
import 'package:expense_manager/util/theme/themes.dart';

Future<void> main() async {
  await initializeDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      title: 'Expense Manager',
      home: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Expense Manager"),
              ),
              body: Navigator(
                key: _navigatorKey,
                initialRoute: '/dashboard',
                onGenerateRoute: (RouteSettings settings) {
                  WidgetBuilder builder;
                  switch (settings.name) {
                    case '/dashboard':
                      builder = (context) => Dashboard();
                      break;
                    case '/payee':
                      builder = (context) => PayeeHome();
                      break;
                    default:
                      builder = (context) => Center(child: Text('Page not found'));
                  }
                  return MaterialPageRoute(builder: builder, settings: settings);
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: "Dashboard",
                      activeIcon: Icon(Icons.home_filled)
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.people),
                      label: "Payee",
                      activeIcon: Icon(Icons.list_alt)
                  ),
                ],
                onTap: (index) => {
                  if (index == 0){
                    _navigatorKey.currentState?.pushReplacementNamed('/dashboard')
                  }else if (index == 1){
                    _navigatorKey.currentState?.pushReplacementNamed('/payee')
                  }
                },
              ),
              floatingActionButton: FloatingActionButton(
                child: const Text("+"),
                onPressed: () => {Navigator.pushNamed(context,'/addTransaction')},
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
            );
          }
      ),
    );
  }
}
