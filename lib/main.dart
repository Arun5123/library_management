import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Book {
  final String title;
  final String author;

  Book({required this.title, required this.author});
}

class Student {
  final String name;
  final String rollNo;

  Student({required this.name, required this.rollNo});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LibraryHomePage(),
    );
  }
}

class LibraryHomePage extends StatefulWidget {
  @override
  _LibraryHomePageState createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  List<Book> books = [];
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddBooksPage()),
                );
                if (result != null) {
                  setState(() {
                    books.add(result);
                  });
                }
              },
              child: Text('Add New Books'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBooksPage(books: books)),
                );
              },
              child: Text('View Added Books'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddStudentPage()),
                );
                if (result != null) {
                  setState(() {
                    students.add(result);
                  });
                }
              },
              child: Text('Add New Student'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewStudentsPage(students: students)),
                );
              },
              child: Text('View Students'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddBooksPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Book(
                    title: titleController.text,
                    author: authorController.text,
                  ),
                );
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewBooksPage extends StatelessWidget {
  final List<Book> books;

  ViewBooksPage({required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
          );
        },
      ),
    );
  }
}

class AddStudentPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: rollNoController,
              decoration: InputDecoration(labelText: 'Roll No'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Student(
                    name: nameController.text,
                    rollNo: rollNoController.text,
                  ),
                );
              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewStudentsPage extends StatelessWidget {
  final List<Student> students;

  ViewStudentsPage({required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('Roll No: ${student.rollNo}'),
          );
        },
      ),
    );
  }
}
