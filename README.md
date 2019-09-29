

# plugfox_localstorage


### Description
Simple cross-platform universal String Key-Value local storage, works on mobile and the web.  
Has RAM caching. Great for small short values.  
  
  
### Example usage:
```dart
import 'package:plugfox_localstorage/localstorage.dart'

Future<void> main() async {
    // Create an instance of the object (singleton)
    final LocalStorage storage = LocalStorage();
    // Wait for initialization
    await storage.init();
    
    // Set key
    storage['sampleKey'] = 'sampleValue';
    // Get value
    print(storage['sampleKey']); // 'sampleKey'
    
    // (optional) Close the storage - not necessary
    await storage.close();
}
```

##### [![Flutter logo][]][flutter.dev]

[Flutter logo]: https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg
[flutter.dev]: https://flutter.dev