To build macOS **apps**, **frameworks**, and **libraries** using **Objective-C**, you’ll need to use **Xcode** and macOS developer tools. Below is a step-by-step breakdown tailored for each component:

---

## ✅ 1. Prerequisites

- **Install Xcode**
  ```bash
  xcode-select --install
  ```
- Make sure you have:
  - `clang` compiler
  - macOS SDK
  - Interface Builder (for GUI apps)

---

## 🧱 2. Build a macOS App in Objective-C

### 🔧 App Structure
```plaintext
MyApp/
├── AppDelegate.h/.m
├── main.m
├── Info.plist
├── Assets.xcassets
└── MainMenu.xib or Main.storyboard
```

### 🔤 `main.m`
```objc
#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    return NSApplicationMain(argc, argv);
}
```

### 📥 `AppDelegate.h`
```objc
#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@end
```

### ⚙️ `AppDelegate.m`
```objc
#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"App Launched");
}

@end
```

### 🛠 Compile from Terminal (optional)
```bash
clang -framework Cocoa main.m AppDelegate.m -o MyApp
```

---

## 🧩 3. Create a Framework in Objective-C

### 🔧 Folder Structure
```plaintext
MyFramework/
├── MyFramework.h
├── MyClass.h/.m
├── Info.plist
└── module.modulemap
```

### Example Header and Class
#### `MyClass.h`
```objc
#import <Foundation/Foundation.h>

@interface MyClass : NSObject
- (void)sayHello;
@end
```

#### `MyClass.m`
```objc
#import "MyClass.h"

@implementation MyClass
- (void)sayHello {
    NSLog(@"Hello from framework");
}
@end
```

### `MyFramework.h`
```objc
#import <Foundation/Foundation.h>
#import "MyClass.h"
```

### `module.modulemap`
```cpp
framework module MyFramework {
    header "MyFramework.h"
    export *
}
```

### 🏗 Build as Dynamic Framework with `clang`
```bash
clang -framework Foundation -fmodules -dynamiclib \
    MyClass.m -o MyFramework.framework/MyFramework
```

---

## 📦 4. Build a Static or Dynamic Library

### Static `.a` Library
```bash
clang -c MyClass.m -o MyClass.o
libtool -static -o libMyLib.a MyClass.o
```

### Dynamic `.dylib` Library
```bash
clang -dynamiclib -o libMyLib.dylib MyClass.m
```

### Use in App
```bash
clang main.m -L. -lMyLib -o MyApp
```

---

## 🧪 5. Link and Use in Xcode

- **Create a new Xcode project**
  - Select “macOS > App” for applications
  - Select “Framework” for frameworks
  - Use `Objective-C` as the language

- **Link your .a or .dylib**
  - Go to “Build Phases > Link Binary with Libraries”
  - Drag your `.a` or `.dylib` file

---

## 🪄 6. Optional: Code Signing & Notarization

If distributing:
```bash
codesign -s "Developer ID Application: Your Name" MyApp
xcrun altool --notarize-app ...
```

---

Would you like:
- 🧰 A working template repository?
- 🧪 A test app that uses a custom dylib/framework?
- 💻 A GUI version with `.xib` or `.storyboard`?

Let me know and I’ll scaffold one for you.
