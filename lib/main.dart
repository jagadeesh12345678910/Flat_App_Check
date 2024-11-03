import 'package:flutter/material.dart';

void main() {
  runApp(FlatApp());
}

class FlatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flat Details App",
    theme: ThemeData(primarySwatch: Colors.blue,),
    home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  final List<int> flatNumbers = List.generate(10, (index)=>index+1);
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Flat'),
        ),
    body: GridView.builder(
      padding: EdgeInsets.all(10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      ),
    itemCount: flatNumbers.length,
    itemBuilder: (context,index){
      return ElevatedButton(
        onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>FlatDetailsPage(flatNumber: flatNumbers[index]),
        ),
        );
      },
      child: Text('Flat ${flatNumbers[index]}'),
      );
    },
    ),
    );
  }
}

class FlatDetailsPage extends StatelessWidget{
  final int flatNumber;
  FlatDetailsPage({required this.flatNumber});
  @override    
  Widget build(BuildContext context) {
    return Scaffold(           
      appBar: AppBar(
        title: Text('Flat $flatNumber Details'),

      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details for Flat $flatNumber',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Location: Building A, Floor ${flatNumber % 5 + 1}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Area: ${flatNumber * 100} sqft',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Price: \$${flatNumber * 1000}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}