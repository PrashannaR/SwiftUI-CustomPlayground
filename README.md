# SwiftUI-CustomPlayground

This project provides custom implementations of **Toast**, **Snack Bar**, and **Back Swipe Gesture** for SwiftUI applications. These can be easily integrated into your app using the provided view modifiers.

## Features

- **Toast Message**: Displays a temporary message with customizable text and background colors.
- **Snack Bar**: A non-intrusive, temporary message view, also customizable.
- **Back Swipe Gesture**: Enables users to navigate back by swiping from the left edge of the screen.

## File Structure

- `SwiftUI-CustomPlayground/Utils/Extensions/View.swift`:  
  Contains the custom **View** extensions for **Toast**, **Snack Bar**, and **Back Swipe Gesture**.  
  You can use these modifiers in any SwiftUI view to show a toast or a snack bar and implement back swipe on any navigated view.

- `SwiftUI-CustomPlayground/SwiftUICustomPlayground/ViewUtils/SnackBar/SnackBarView.swift`:  
  Contains the implementation details for **Snack Bar**.

- `SwiftUI-CustomPlayground/SwiftUICustomPlayground/ViewUtils/SnackBar/ToastView.swift`:  
  Contains the implementation details for **Toast**.

- `SwiftUI-CustomPlayground/SwiftUI-CustomPlayground/NavigatedScreen.swift`:  
  Contains the implementation details for **Back Swipe Gesture**.

## Example Usage

To see an example of how to use these modifiers, refer to the following file:

- `SwiftUI-CustomPlayground/SwiftUICustomPlayground/ExampleView.swift`:  
  This file demonstrates how to use the **toast**, **snackBar**, and **back swipe gesture** view modifiers in your SwiftUI app.

## How to Use **Toast** and **Snack Bar**

1. Add the **Toast** or **Snack Bar** view modifier to any of your SwiftUI views.
2. Customize the message, appearance, and duration as needed.

### Toast Example:

```swift
Text("Hello, World!")
    .toast(message: "This is a toast!", show: $showToast)
```

```swift
Text("Hello, World!")
    .toast(message: "Test Toast", show: $showToast, textColor: .white, backgroundColor: .blue, showTime: 1.5)
```

### Snack Bar Example:

```swift
Text("Snack Bar Example")
    .snackBar(message: "This is a snack bar!", show: $showSnackBar)
```

```swift
Text("Snack Bar Example")
   .snackBar(message: "Test Snackbar", show: $showSnackbar, textColor: .white, backgroundColor: .blue, showTime: 1.5)
```

## How to Use **Back Swipe Gesture**

1. Use the `onBackSwipe` modifier on any view where you want to enable a back swipe action.
2. Customize the gesture to perform an action when swiping from the left edge of the screen.

### Back Swipe Gesture Example:

```swift
struct NavigatedScreen: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("This is the next screen")
                    .foregroundStyle(.black)
            }
        }
        .navigationBarBackButtonHidden()
        .onBackSwipe {
            dismiss()
        }
    }
}
```

In this example, the **Back Swipe Gesture** is applied to a navigated view (`NavigatedScreen`), and swiping from the left edge will trigger the `dismiss()` action, navigating back to the previous screen.
