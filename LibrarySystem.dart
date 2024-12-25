import 'dart:async';

class libraryUser {
List<int> borrowedIds=[];
List<String> borrowedBooks=[];
int userId;
String Status;


libraryUser(this.userId, this.Status);

//*********************************************** */
void borrow(int Id , String bookName ){
this.userId=Id;
if(!borrowedBooks.contains(bookName)){
  borrowedIds.add(this.userId);
 borrowedBooks.add(bookName);
 print("Book '$bookName' borrowed by user $Id.");

}
else{
  print("Book is borrowed.");
}
}
//**************************************** */
void lend(int Id , String bookName ){
this.userId=Id;
if(borrowedBooks.contains(bookName)){
borrowedBooks.remove(bookName);
}
if (!borrowedBooks.contains(bookName)) {
      borrowedIds.remove(Id); // Remove the user ID if no books remain
        print("Book '$bookName' has been returned by user $Id.");
    }
  
  else {
    print("Book '$bookName' is not currently borrowed.");
  }
}
}

// void main(){

//   libraryUser user = libraryUser(1, "Active");

//   // Borrow books
//   user.borrow(1, "Dart Programming");
//   user.borrow(1, "Flutter Basics");
//   user.lend(1,"Flutter Basics");
//   // Print final state
//   print("Borrowed IDs: ${user.borrowedIds}");
//   print("Borrowed Books: ${user.borrowedBooks}");
// }
//********************************************************************************** */
// class Books {
//   int Id;
//   String name ;
//   List<String> borrowed;
//   Books(this.Id, this.borrowed, this.name);
//    void displayInfo(int id , String name ){
//     this.Id=id;
//     this.name=name;
//     print(" this is Id $id and this is the name $name");
//    }
// }
// class User {
//   int id ;
//   String name;
// User(this.id, this.name);
// // void userInfo(int id , String name ){
// //   print("this is an id $id , and the user name is $name");
// // }
// // }
// // class library{
//   List<String> Books;
//   List<String>BorrowedBooks;
//   library(this.Books, this.BorrowedBooks);
// void addBook(){}
// void returnBook(){}
// void borrowBook (){}
// void displayInfo(){}
// }
//****************************************** */



//****************************************************************************** */

class Books {
  int id; 
  String name; 
  List<String> borrowed; 

  Books(this.id, this.name, this.borrowed);
  void displayInfo() {
    print("Book ID: $id, Name: $name, Borrowed by: ${borrowed.join(', ')}");
  }
}

class User {
  int id; 
  String name; 

  User(this.id, this.name);

  void userInfo() {
    print("User ID: $id, Name: $name");
  }
}

class Library {
  List<Books> books = [];
  List<Books> borrowedBooks = []; 

  Library();
//**************************************************************** */
  void addBook(int bookId, String bookName) {
    books.add(Books(bookId, bookName, []));
    print("Book '$bookName' with ID $bookId has been added to the library.");
  }

//***************************************************************** */
void borrowBook(int userId, String userName, int bookId) {
 
  Books book = books.firstWhere((b) => b.id == bookId);
  if (!borrowedBooks.contains(book)) {
    book.borrowed.add(userName); 
    borrowedBooks.add(book);   
    print("User '$userName' (ID: $userId) borrowed the book '${book.name}'.");
  } else {
    print("The book '${book.name}' is already borrowed.");
  }
}


//***************************************************************** */
  void returnBook(int userId, String userName, int bookId) {
    Books book = books.firstWhere(
  (b) => b.id == bookId,
  orElse: () => Books(-1, "Unknown Book",[]),
);

      book.borrowed.remove(userName);
      if (book.borrowed.isEmpty) {
        borrowedBooks.remove(book);
      }
      print("User '$userName' (ID: $userId) returned the book '${book.name}'.");
    }
  }
//******************************************************************** */
 void displayInfo(List<Books> books, List<Books> borrowedBooks) {
  print("Books in the Library:");
  for (var book in books) {
    print("Book ID: ${book.id}, Name: ${book.name}, Borrowed by: ${book.borrowed.join(', ')}");
  }

  print("\nBorrowed Books:");
  for (var book in borrowedBooks) {
    print("Book ID: ${book.id}, Name: ${book.name}, Borrowed by: ${book.borrowed.join(', ')}");
  }
}


//******************************************************* */
void main() {
  List<Books> books = [
    Books(1, "Dart ", []),
    Books(2, "Flutter Basics", []),
    Books(3, "API integration", []),
  ];

  List<Books> borrowedBooks = [
    Books(2, "Flutter Basics", ["sara"]),
    Books(3, "API integration", ["waleed"]),
  ];

  displayInfo(books, borrowedBooks);
}
