import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  final String fullName = "Иванов Иван Иванович";
  final String dateOfBirth = "12.04.1985"; // Рандомная дата
  final String omsNumber = "1234 5678 9012 3456"; // Рандомный номер

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Информация о пользователе",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            Table(
              columnWidths: {
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
              },
              border: TableBorder.all(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              children: [
                _buildTableRow("ФИО:", fullName),
                _buildTableRow("Дата рождения:", dateOfBirth),
                _buildTableRow("Полис ОМС:", omsNumber),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Редактирование данных временно недоступно. Свяжитесь с техподдержкой для изменения информации.",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/home');
          if (index == 1) Navigator.pushNamed(context, '/chat');
          if (index == 3) Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
