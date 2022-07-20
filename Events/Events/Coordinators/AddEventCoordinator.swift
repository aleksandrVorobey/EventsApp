//
//  AddEventCoordinator.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation
import UIKit

final class AddEventCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController: AddEventViewController = .instantiate()
        //addEventViewController.view.backgroundColor = .blue
        let addEventViewModel = AddEventViewModel()
        addEventViewController.viewModel = addEventViewModel
        addEventViewModel.coordinator = self
        navigationController.present(addEventViewController, animated: true)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("AddEventCoord")
    }
    
}
