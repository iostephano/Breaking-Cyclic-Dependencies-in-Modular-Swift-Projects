//
//  ViewController.swift
//  Breaking Circular Dependencies in Modular Swift Projects
//
//  Created by Stephano Portella on 02/05/25.
//
import UIKit

class ViewController: UIViewController {

    let canvasView = UIView()
    let canvasLabel = UILabel()
    var brushKit: BrushKit!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground

        canvasView.backgroundColor = .white
        canvasView.layer.borderWidth = 2
        canvasView.layer.borderColor = UIColor.systemGray.cgColor
        canvasView.layer.cornerRadius = 12
        canvasView.translatesAutoresizingMaskIntoConstraints = false

        canvasLabel.textAlignment = .center
        canvasLabel.font = .systemFont(ofSize: 16, weight: .medium)
        canvasLabel.textColor = .darkGray
        canvasLabel.translatesAutoresizingMaskIntoConstraints = false

        let canvasEngine = CanvasEngine(canvasView: canvasView, label: canvasLabel)
        brushKit = BrushKit(canvas: canvasEngine)

        let selectBrushButton = createButton(title: "🖌️ Select Brush")
        let paintButton = createButton(title: "🎯 Paint on Canvas")

        selectBrushButton.addTarget(self, action: #selector(selectBrush), for: .touchUpInside)
        paintButton.addTarget(self, action: #selector(paint), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [selectBrushButton, paintButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        [canvasView, canvasLabel, stack].forEach { view.addSubview($0) }

        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            canvasView.widthAnchor.constraint(equalToConstant: 260),
            canvasView.heightAnchor.constraint(equalToConstant: 140),

            canvasLabel.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 12),
            canvasLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stack.topAnchor.constraint(equalTo: canvasLabel.bottomAnchor, constant: 30),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }

    @objc func selectBrush() {
        let newBrush = ["Flat Brush", "Ink Pen", "Soft Airbrush"].randomElement()!
        brushKit.selectBrush(newBrush)
        canvasLabel.text = "🖌️ Brush selected: \(newBrush)"
        canvasView.backgroundColor = .white
    }

    @objc func paint() {
        brushKit.paint()
    }
}
