//
//  ImagePickerCoordinator.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import Foundation
import UIKit

final class ImagePickerCoordinator: NSObject, Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var onFinishPicker: (UIImage) -> Void = { _ in }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        navigationController.present(imagePickerController, animated: true, completion: nil)
    }
    
    deinit {
        print("ImagePickerCoordinator")
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ImagePickerCoordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            onFinishPicker(image)
        }
        parentCoordinator?.childDidFinish(self)
    }
}
