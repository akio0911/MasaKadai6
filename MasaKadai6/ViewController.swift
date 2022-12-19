//
//  ViewController.swift
//  MasaKadai6
//
//  Created by Mina on 2022/12/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var numberOfLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!

    // private let number = arc4random_uniform(100)の書き方では
    // Legacy Random Violation: Prefer using `type.random(in:)` over legacy functions.のwarningが発生したので以下で記述
    private let number = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()

        numberOfLabel.text = String(number)
    }

    @IBAction private func judgeButton(_ sender: Any) {
        alertAction()
    }

    private func alertAction() {
        let point = Int(slider.value)
        guard let text = numberOfLabel.text else { return }

        let alert = UIAlertController(title: "結果",
                                      message: "はずれ!\nあなたの値： \(point)",
                                      preferredStyle: .alert)

        if point == Int(text) {
            alert.message = "あたり!\nあなたの値： \(point)"
        }

        let continueButton = UIAlertAction(title: "再挑戦",
                                           style: .default) { _ in
            self.clear()
        }

        alert.addAction(continueButton)
        present(alert, animated: true)
    }

    private func clear() {
        let num = Int.random(in: 1...100)
        numberOfLabel.text = String(num)
        slider.value = 50
    }
}
