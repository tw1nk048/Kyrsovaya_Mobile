import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главная')),
      body: Center(
        child: Text(
          'Добро пожаловать в систему!\n\n'
          'Здесь вы можете:\n'
          '- Получить предварительный диагноз\n'
          '- Записаться к врачу\n'
          '- Пообщаться с чат-ботом\n\n'
          'Надеемся, что наше приложение будет вам полезно!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/chat');
          if (index == 2) Navigator.pushNamed(context, '/profile');
          if (index == 3) Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    );
  }
}
