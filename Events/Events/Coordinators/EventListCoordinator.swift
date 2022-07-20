//
//  EventListCoordinator.swift
//  Events
//
//  Created by admin on 19.07.2022.
//

import Foundation
import UIKit

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewController.viewModel = eventListViewModel
        eventListViewModel.coordinator = self
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {$0 === childCoordinator}) {
            childCoordinators.remove(at: index)
        }
    }
    
    
}
