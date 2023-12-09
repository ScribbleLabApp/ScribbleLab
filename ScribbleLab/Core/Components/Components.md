# Components

Components that are used in ScribbleLab to establish a better UI/UX.

## Overview

The SLComponents contains Shaders, Buttons, Modifier and other protocols or Models

### Table Of Contents
| Name                            |  Art          | Support        |
| :-----------------------------: | :-----------: | :------------: |
| SLButton                        |  func()       |    ✅          |
| SLButton+Image                  |  func()       |    ✅          |
| ParticleEffect                  |  modifier     |    ✅          |
| IGTextFieldModifier             |  modifier     |    ✅          |
| IGButtonModifier `(DEPRECATED)` |  modifier     |    ❌          |
| Shaders                         |  Metal Shader |    ✅          |

### SLButton
Creates a styled button with customizable appearance and action.
Use this function to create a button with specific text, font, colors, corner radius, and an associated action.

- Parameters:
    - text: The text to display on the button.
    - font: The font to apply to the button text.
    - color: The background color of the button.
    - textColor: The color of the button's text.
    - cornerRadius: The corner radius of the button.
    - action: The action to perform when the button is tapped.
    
    - Returns: A view representing the styled button.


    ```swift
    SLButton(text: String, 
    font: Font,
    backgroundColor: Color,
    textColor: Color,
    cornerRadius: CGFloat,
    action: @escaping () -> Void)
    ```

### SLButton+Image

Creates a styled button with an image on the left side.
Use this function to create a button with a specific text, font, colors, corner radius, an associated action, and an image on the left side.

- Parameters:
    - text: The text to display on the button.
    - font: The font to apply to the button text.
    - backgroundColor: The background color of the button.
    - textColor: The color of the button's text.
    - cornerRadius: The corner radius of the button.
    - action: The action to perform when the button is tapped.
    - imageName: The name of the system image to display on the left side.
    - imageWidth: The width of the image.
    - imageHeight: The height of the image.

    - Returns: A view representing the styled button with an image on the left side.

If you want to use this Button with a custom Image you need to use this code:
```swift
SLImageButton(text: "Press Me",
font: .system(size: 18),
backgroundColor: .blue,
textColor: .white,
cornerRadius: 10,
image: Image("customImage"), // Provide your custom image
imageWidth: 30,
imageHeight: 30) {
    // action to perform when the button is tapped
}
```

If you want to use this Button with a system Image you need to use this code:
```swift
SLImageButton(text: "Press Me",
font: .system(size: 18),
backgroundColor: .blue,
textColor: .white,
cornerRadius: 10,
systemImageName: "heart.fill", // Provide system image name
imageWidth: 30,
imageHeight: 30) {
    // The action to perform when the button is tapped comes here.
}
```

> Important: To use this Button for Auth use as background Color .clear

### ParticleEffect
A modififer that creates with a systemImage a particleEffect.
Use this modifier to create a particleEffect with a specific systemImage, font, activeTint, an inactiveTint, and status.

- Parameters:
    - systemImage: The text to display on the button.
    - font: The font to apply to the ParticleEffect.
    - status: A Boolean value that is responsible for the excecution of the effect
    - activeTint: A Color that is applied to the active particles
    - inactiveTint: A Color that is applied to the inactive particles

    ```swift
    ParticleModifier(systemImage: String, font: Font, status: Bool, activeTint: Color, inActiveTint: Color)
    ```

### IGTextFieldModifier
A Modifier that is responsible for the styling of the TextFields.

