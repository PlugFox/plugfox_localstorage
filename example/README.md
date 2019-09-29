# Example usage:
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