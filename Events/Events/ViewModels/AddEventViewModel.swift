//
//  AddEventViewModel.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation
import UIKit

final class AddEventViewModel {
    var coordinator: AddEventCoordinator?
    
    var onUpdate: () -> () = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name")),
            .titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date"))
        ]
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> AddEventViewModel.Cell {
        return cells[indexPath.row]
    }
    
    deinit {
        print("viewModel")
    }
}
