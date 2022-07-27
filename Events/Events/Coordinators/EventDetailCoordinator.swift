//
//  EventDetailCoordinator.swift
//  Events
//
//  Created by admin on 22.07.2022.
//

import Foundation
import UIKit
import CoreData

class EventDetailCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let eventId: NSManagedObjectID
    var parentCoordinator: EventListCoordinator?
    
    init(eventId:NSManagedObjectID, navigationController: UINavigationController) {
        self.eventId = eventId
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController: EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventId)
        eventDetailViewModel.coordinator = self
        detailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func onEditEvent(event: Event) {
        let editEventCoordinator = EditEventCoordinator(event: event, navigationController: navigationController)
        childCoordinators.append(editEventCoordinator)
        editEventCoordinator.start()
    }
    
    deinit {
        print("EventDetailCoordinator")
    }
}
