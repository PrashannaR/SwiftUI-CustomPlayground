# SwiftUI-CustomPlayground

This project provides custom implementations of **Toast**, **Snack Bar**, **Back Swipe Gesture** and **Slide Menu** for SwiftUI applications. These can be easily integrated into your app using the provided view modifiers.

## Features

- **Toast Message**: Displays a temporary message with customizable text and background colors.
- **Snack Bar**: A non-intrusive, temporary message view, also customizable.
- **Back Swipe Gesture**: Enables users to navigate back by swiping from the left edge of the screen.
- **Slide Menu**: Enables users to add a slide menu/view from leading, trailing, top and bottom edges of the screen.
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

- `SwiftUI-CustomPlayground/SwiftUI-CustomPlayground/ViewUtils/SideMenu/SlideInView.swift`:
  Contains the implementation details for **Slide Menu**.
  
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
    .toast(message: "Test Toast", show: $showToast, textColor: .white, backgroundColor: .blue, edge: .bottom)
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

---

### Slide Menu Example:

```swift
struct ExampleView: View{
    @State var showSlideMenuTrailing: Bool = false
    @State var showSlideMenuLeading: Bool = false
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()                
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSlideMenuTrailing.toggle()
                } label: {
                    Image(systemName: "sidebar.right")
                        .foregroundStyle(.blue)
                }

            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    showSlideMenuLeading.toggle()
                } label: {
                    Image(systemName: "sidebar.left")
                        .foregroundStyle(.blue)
                }

            }
        })
        .slideInView(isActive: $showSlideMenuTrailing, edge: .trailing) {
            ExampleSlideMenuContent()
        }
        .slideInView(
            isActive: $showSlideMenuLeading,
            edge: .leading,
            paddingPercentage: 0.45,
            options: SlideInViewOptions(
                paddingColor: Color.green,
                paddingColorOpacity: 0.45,
                shouldDismissUponSwipe: true,
                shouldDismissUponExternalTap: true)) {
                ExampleSlideMenuContent()
            }
    }

}

```

## Demo Video

Watch the video below to see all three features—Toast, Snack Bar, Back Swipe Gesture and Slide Menu— in action:





https://github.com/user-attachments/assets/128350cd-7abc-4d67-9f0a-214635402a29


---
### References

The implementation of the slide-in menu view in this project has been highly referenced from the tutorial by Rebeloper - Rebel Developer. You can find the original tutorial here: [YouTube Video](https://www.youtube.com/watch?v=9WKVXHgEFU8&ab_channel=Rebeloper-RebelDeveloper).





