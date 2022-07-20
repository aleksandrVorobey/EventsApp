//
//  UIViewController + Extensions.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiate<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}
