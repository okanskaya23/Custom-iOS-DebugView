//
//  LogsView.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 29.12.2022.
//

import Foundation
import UIKit


class LogTableView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(containerView)
        containerView.addSubview(tableView)
        NSLayoutConstraint.activate(staticConstraints())
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        return tv
    }()
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
            constraints.append(contentsOf: [
                containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        constraints.append(contentsOf: [
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

        ])
        
        return constraints
    }

}
