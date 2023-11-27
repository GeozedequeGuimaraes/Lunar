//
//  Coordinator.swift
//  Luna
//
//  Created by ggs on 20/11/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
