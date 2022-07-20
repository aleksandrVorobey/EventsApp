//
//  TitleSubtitleCellViewModel.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation

final class TitleSubtitleCellViewModel {
    
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}
