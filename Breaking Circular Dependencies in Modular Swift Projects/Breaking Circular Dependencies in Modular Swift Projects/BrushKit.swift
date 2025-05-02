//
//  FeatureAProtol.swift
//  Breaking Circular Dependencies in Modular Swift Projects
//
//  Created by Stephano Portella on 02/05/25.
//
import Foundation

class BrushKit {
    var currentBrush: String = "Basic Round"
    private var canvas: CanvasEngineProtocol?

    init(canvas: CanvasEngineProtocol?) {
        self.canvas = canvas
    }

    func selectBrush(_ name: String) {
        currentBrush = name
    }

    func paint() {
        canvas?.drawStroke(with: currentBrush)
    }
}
