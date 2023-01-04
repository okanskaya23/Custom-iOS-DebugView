//
//  SecondView.swift
//  Logger
//
//  Created by Okan Sarp Kaya on 30.12.2022.
//

import Foundation
import UIKit

final class SecondView: UIView {
    
    private enum Constants {
        static let backGroundColor: UIColor = .yellow
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Constants.backGroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
