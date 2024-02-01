# SnowSwiftUI ❄️

Small SPM package with snowflakes views and background built purely on SwiftUI
![](https://github.com/eeshishko/snow-swift-ui/assets/14946233/2eba9b46-823b-49e0-a5f1-f18f07893dcb)

## Add a dependency using SPM

SnowSwiftUI is accessible through [Swift Package Manager](https://swift.org/package-manager). 

To use it inside your project, add it through XCode project Settings or as a dependency within your Package.swift manifest:
```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/eeshishko/snow-swift-ui.git", from: "1.0.0")
    ],
)
```

## API

Just use SnowfallBackground SwiftUI's views in your custom views within Z stack (to render it behind)
```swift
var body: some View {
        ZStack {
            SnowfallBackground()
            ...
        }
    }
 ```
