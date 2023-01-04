//
//  MainViewController.swift
//  Logger
//
//  Created by Okan Sarp Kaya on 30.12.2022.
//

import Foundation
import UIKit
class ViewController: UIViewController {
    
    private var customView = MainView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureButton()
    }
    
    
    private func configureButton(){
        customView.goToSecondView.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

    }
    @objc private func buttonAction(sender: UIButton!) {
        navigationController?.pushViewController(ViewController2(), animated: true)
        MockLogData.generateMockLogs()
    }
    
    override func loadView() {
        view = self.customView
    }
}
