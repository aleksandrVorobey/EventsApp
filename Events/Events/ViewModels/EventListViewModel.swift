//
//  EventListViewModel.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    
    enum Cell {
        case event(EventCellViewModel)
    }
    
    var onUpdate = {}
    
    private(set) var cells: [Cell] = []
    
    var coordinator: EventListCoordinator?
    private let eventService: EventServiceProtocol
    
    init(eventService: EventServiceProtocol = EventService()) {
        self.eventService = eventService
    }
    
    func viewDidLoad() {
        reload()
    }
    
    func reload() {
        EventCellViewModel.imageCache.removeAllObjects()
        let events = eventService.getEvents()
        self.cells = events.map({
            var eventCellViewModel = EventCellViewModel($0)
            if let coordinator = coordinator {
                eventCellViewModel.onSelect = coordinator.onSelect
            }
            return .event(eventCellViewModel)
        })
        onUpdate()
    }
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        cells[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .event(let eventCellViewModel):
            eventCellViewModel.didSelect()
        }
    }
}
