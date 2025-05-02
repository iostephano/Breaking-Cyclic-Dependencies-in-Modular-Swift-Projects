//
//  FeatureA.swift
//  Breaking Circular Dependencies in Modular Swift Projects
//
//  Created by Stephano Portella on 02/05/25.
//
import UIKit

class CanvasEngine: CanvasEngineProtocol {
    private let canvasView: UIView
    private let label: UILabel

    init(canvasView: UIView, label: UILabel) {
        self.canvasView = canvasView
        self.label = label
    }

    func drawStroke(with brush: String) {
        label.text = "🎨 Canvas updated with brush: \(brush)"
        canvasView.backgroundColor = .systemGreen
    }
}
