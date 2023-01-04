//
//  MainView.swift
//  Logger
//
//  Created by Okan Sarp Kaya on 30.12.2022.
//

import Foundation
import UIKit

class MainView: UIView {

    private enum Constants {
        static let buttonTitle: String = "Go to vc2"
        static let buttonWidth: Double = 120
        static let buttonHeigth: Double = 50
        static let backGroundColor: UIColor = .red

    }

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = Constants.backGroundColor
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(containerView)
        containerView.addSubview(goToSecondView)
        NSLayoutConstraint.activate(staticConstraints())
    }
    
    lazy var goToSecondView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.buttonTitle, for: .normal)
        return button
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        constraints.append(contentsOf: [
            goToSecondView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            goToSecondView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            goToSecondView.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            goToSecondView.heightAnchor.constraint(equalToConstant: Constants.buttonHeigth)])
        
        return constraints
    }

}
