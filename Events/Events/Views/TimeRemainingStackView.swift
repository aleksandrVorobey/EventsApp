//
//  TimeRemainingStackView.swift
//  Events
//
//  Created by admin on 27.07.2022.
//

import Foundation
import UIKit

final class TimeRemainingStackView: UIStackView {
    private let timeRamainingLabels = [UILabel(), UILabel(), UILabel(), UILabel()]
    
    func setup() {
        timeRamainingLabels.forEach({addArrangedSubview($0)})
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func update(with viewModel: TimeRemainingViewModel) {
        timeRamainingLabels.forEach({
            $0.text = ""
            $0.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
            $0.textColor = .white})
        
        viewModel.timeRemainingParts.enumerated().forEach({timeRamainingLabels[$0.offset].text = $0.element})
        alignment = viewModel.aligment
    }
}
