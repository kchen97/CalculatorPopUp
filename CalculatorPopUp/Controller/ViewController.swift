//
//  ViewController.swift
//  CalculatorPopUp
//
//  Created by Korman Chen on 2/26/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var height: CGFloat?
    
    let numbersViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackViews: [UIStackView] = {
        var stackViews = [UIStackView]()
        
        for _ in 0..<3 {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .fillEqually
//            stackView.spacing = 25
            
            stackViews.append(stackView)
        }
        
        return stackViews
    }()
    
    lazy var numberButtons: [UIButton] = {
        var buttonsArray = [UIButton]()
        
        for number in 0...9 {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("\(number)", for: .normal)
            button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 20)
            button.addTarget(self, action: #selector(handleValuePressed(sender:)), for: .touchUpInside)
            button.tag = number
            
            buttonsArray.append(button)
        }
        
        return buttonsArray
    }()
    
    lazy var equalButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 30)
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
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let outputLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.clear
        label.text = ""
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
    
    override func viewDidAppear(_ animated: Bool) {
        height = numbersViewContainer.frame.height * 1/4
        setupStackViews()
        self.view.layoutIfNeeded()
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
        container.addSubview(numbersViewContainer)
        
        container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4).isActive = true
        container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/2.3).isActive = true
        
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
        
//        equalButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8).isActive = true
//        equalButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8).isActive = true
        
        numbersViewContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        numbersViewContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        numbersViewContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
        numbersViewContainer.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10).isActive = true
        
    }

}

extension ViewController {
    
    @objc func handleEqual() {
        print("equal pressed")
    }
    
    @objc func handleValuePressed(sender: UIButton) {
        outputLabel.text?.append("\(sender.tag)")
    }
    
    func setupStackViews() {
        
        stackViews.forEach { (view) in
            numbersViewContainer.addSubview(view)
            view.spacing = self.numbersViewContainer.frame.width/4 - height!
        }
        
        stackViews[0].centerXAnchor.constraint(equalTo: numbersViewContainer.centerXAnchor).isActive = true
        stackViews[0].bottomAnchor.constraint(equalTo: numbersViewContainer.bottomAnchor).isActive = true
        stackViews[0].heightAnchor.constraint(equalToConstant: height!).isActive = true
        
        stackViews[1].centerXAnchor.constraint(equalTo: numbersViewContainer.centerXAnchor).isActive = true
        stackViews[1].bottomAnchor.constraint(equalTo: stackViews[0].topAnchor, constant: -4).isActive = true
        stackViews[1].heightAnchor.constraint(equalToConstant: height!).isActive = true
        
        stackViews[2].centerXAnchor.constraint(equalTo: numbersViewContainer.centerXAnchor).isActive = true
        stackViews[2].bottomAnchor.constraint(equalTo: stackViews[1].topAnchor, constant: -4).isActive = true
        stackViews[2].heightAnchor.constraint(equalToConstant: height!).isActive = true
        
        numberButtons.forEach { (button) in
            let tag = button.tag
            
            if tag >= 1 && tag <= 3 {
                stackViews[0].addArrangedSubview(button)
            }
            else if tag >= 4 && tag <= 6 {
                stackViews[1].addArrangedSubview(button)
            }
            else if tag >= 7 && tag <= 9 {
                stackViews[2].addArrangedSubview(button)
            }
        }
        
        stackViews[0].addArrangedSubview(equalButton)
        
        setupButtonContraints()
    }
    
    func setupButtonContraints() {
        numberButtons.forEach { (button) in
            
            button.heightAnchor.constraint(equalToConstant: height!).isActive = true
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: height!).isActive = true
            button.round(UIColor.white.cgColor, height!)
        }
        
        equalButton.widthAnchor.constraint(equalToConstant: height!).isActive = true
        equalButton.heightAnchor.constraint(greaterThanOrEqualToConstant: height!).isActive = true
        equalButton.round(UIColor.white.cgColor, height!)
    }
    
}

extension UIButton {
    
    func round(_ borderColor: CGColor, _ width: CGFloat) {
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = width * 0.5
    }
}

