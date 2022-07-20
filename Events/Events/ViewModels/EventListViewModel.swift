//
//  EventListViewModel.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    
    var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
