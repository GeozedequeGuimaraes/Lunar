//
//  MainCoordinator.swift
//  Luna
//
//  Created by ggs on 20/11/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = IntroViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    func navigateToCircleViewController() {
        let vc = CircleViewController()
        vc.coordinator = self

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        navigationController.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.rounded(ofSize: 17, weight: .semibold)
        ]

        backButton.tintColor = UIColor.white
        backButton.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.rounded(ofSize: 17, weight: .semibold)
        ], for: .normal)

        navigationController.navigationBar.topItem?.backBarButtonItem = backButton

        navigationController.pushViewController(vc, animated: true)
    }

    func navigateToEsfereViewController() {
        let vc = CircleViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
