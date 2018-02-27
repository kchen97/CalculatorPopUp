//
//  ViewController.swift
//  CalculatorPopUp
//
//  Created by Korman Chen on 2/26/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var equalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 50)
        button.addTarget(self, action: #selector(handleEqual), for: .touchUpInside)
        
        return button
    }()
    
    let blurEffect: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let view = UIVisualEffectView(effect: effect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let outputLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.clear
        label.text = "Hello"
        label.textAlignment = .right
        
        return label
    }()
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(container)
        container.addSubview(blurEffect)
        container.addSubview(outputLabel)
        container.addSubview(separator)
        container.addSubview(equalButton)
        
        container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/2.5).isActive = true
        
        blurEffect.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        blurEffect.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        blurEffect.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        blurEffect.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        outputLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        outputLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8).isActive = true
        outputLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        outputLabel.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        
        separator.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        separator.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        separator.topAnchor.constraint(equalTo: outputLabel.bottomAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        equalButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12).isActive = true
        equalButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12).isActive = true
        equalButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        equalButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        equalButton.round(UIColor.white.cgColor, 70)
    }

}

extension ViewController {
    
    @objc func handleEqual() {
        print("equal pressed")
    }
}

extension UIButton {
    
    func round(_ borderColor: CGColor, _ width: CGFloat) {
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = width * 0.5
    }
}

