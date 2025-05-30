# Breaking-Cyclic-Dependencies-in-Modular-Swift-Projects
## Description

This UIKit-based demo project showcases how to solve **cyclic dependencies** in modular Swift codebases by applying the **Dependency Inversion Principle**.  
It visually simulates the interaction between two fictional modules: `BrushKit` and `CanvasEngine`, where one selects a brush and the other draws a stroke.

Instead of direct dependencies between modules, we introduce a protocol to decouple them and prevent build-time issues.

---

## Project Structure

```swift
SeparationRenderingLogic/
├── AppDelegate.swift             // App launch and window setup
├── SceneDelegate.swift           // Scene setup and root view controller configuration
├── ViewController.swift          // UIKit interface: buttons, canvas, and interaction logic
├── CanvasEngine.swift            // Concrete implementation of CanvasEngineProtocol, draws strokes
├── CanvasEngineProtocol.swift    // Protocol abstraction used to decouple CanvasEngine from BrushKit
├── BrushKit.swift                // Selects brushes and delegates drawing to the canvas via protocol
```

---

## How It Works

- `CanvasEngine` conforms to a protocol: `CanvasEngineProtocol`
- `BrushKit` receives a reference to the protocol, not the concrete class
- `BrushKit` selects a brush and triggers a "paint" action
- `CanvasEngine` handles the draw logic and updates the screen

This clean separation avoids circular references between modules.

---

## Preview

<p align="center">
  <img src="preview-simulator.gif" alt="Simulator preview showing UI flow" width="300"/>
</p>

> The app shows a brush being selected and applied to a canvas, simulating communication between two decoupled modules.

---

## Ideas for Extension

- Add `BrushSettings` module to simulate cross-module configuration
- Introduce `UndoManager` to simulate state restoration
- Implement unit tests using mocks of `CanvasEngineProtocol`
- Convert the demo to use Combine or async/await
- Expand UI into a real drawing surface (using Core Graphics)

---

## License

This project is licensed under the [MIT License](LICENSE).

---
