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
//    private let coreDataManager: CoreDataManager
//    
//    init(coreDataManager: CoreDataManager) {
//        self.coreDataManager = coreDataManager
//    }
    
    func viewDidLoad() {
        cells = [.event(EventCellViewModel()), .event(EventCellViewModel())]
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
}
