# flutter_ui_exam_1

A new Flutter application.

## code 1

```dart

void main() {
	final item = Item('title1', content:'content1');
  final item2 = Item('title2', content: 'title2');
  
  item.toString();
  item2.toString();
}

class Item {
  String title;
  String content;
  String imgSrc;
  
  Item(this.title, {this.content, this.imgSrc });
  
  
    
  toString() {
    print("$title,$content,$imgSrc");
  }
}





```
