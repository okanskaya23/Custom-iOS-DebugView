//
//  LogTableViewCell.swift
//  Debug
//
//  Created by Okan Sarp Kaya on 26.12.2022.
//

import Foundation
import UIKit


extension LogTableViewCell {
    func configure(with viewModel: LogViewModel) {
        logDescriptionLabel.text = viewModel.title
    }
}

class LogTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let backGroundColor: UIColor = .white
        static let textColor: UIColor = .black
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: Overrides
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
  
    private func commonInit() {
        containerView.backgroundColor = Constants.backGroundColor
        contentView.addSubview(containerView)
        containerView.addSubview(logDescriptionLabel)
        NSLayoutConstraint.activate(staticConstraints())
    }
    
    //MARK: Elements
    private let logDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = Constants.textColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
            constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
        constraints.append(contentsOf: [
            logDescriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor,
                                               constant:4.0),
            logDescriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                  constant: -4.0),
            logDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                   constant: 5),
            logDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        return constraints
    }
}
