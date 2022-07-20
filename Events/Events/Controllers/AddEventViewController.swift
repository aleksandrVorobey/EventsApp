//
//  AddEventViewController.swift
//  Events
//
//  Created by admin on 20.07.2022.
//

import UIKit

class AddEventViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "titleSubtitleCell")
        
        viewModel.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    deinit {
        print("AddEventViewController")
    }
}

extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel)
            return cell
        case .titleImage:
            return UITableViewCell()
        }
    }
}
