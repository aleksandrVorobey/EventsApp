//
//  EventListCoordinator.swift
//  Events
//
//  Created by admin on 19.07.2022.
//

import Foundation
import UIKit
import CoreData

final class EventListCoordinator: Coordinator, EventUpdatingCoordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var onUpdateEvent = {}
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewController.viewModel = eventListViewModel
        eventListViewModel.coordinator = self
        onUpdateEvent = eventListViewModel.reload
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func onSelect(_ id: NSManagedObjectID) {
        let eventDetailCoordinator = EventDetailCoordinator(eventId: id, navigationController: navigationController)
        eventDetailCoordinator.parentCoordinator = self
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: {$0 === childCoordinator}) {
            childCoordinators.remove(at: index)
        }
    }
    
    
}
