//
//  ViewController.swift
//  Timer
//
//  Created by mac on 31/08/2021.
//

import UIKit


class ViewController: UIViewController {
   // var timers = [TimerModel](repeating:TimerModel(), count:30)
    var timer: Timer?
  //  var timersActive = 0
    
    let groupSection = ["first", "second"]
    
    private var viewModel = ViewModel()

    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifire)
        table.register(ListTimersTableViewCell.self, forCellReuseIdentifier: ListTimersTableViewCell.identifire)
     
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table"
        
        setConstraint()
        reloadTableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setConstraint() {
        // TableView customization
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    fileprivate func reloadTableView() {
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                print("reload srction")
                self?.tableView.reloadSections(IndexSet(integer: 1), with: .none)
             //   self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupSection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return viewModel.cellViewModels.count
        default:
            return 0
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifire,
                                                           for: indexPath) as? FirstTableViewCell
            else {
                return UITableViewCell()
            }
            cell.didFinishTapButton = {
                self.viewModel.addTimerModel(name: $0, endTimeInSec: $1)
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTimersTableViewCell.identifire,
                                                           for: indexPath) as? ListTimersTableViewCell
            else {
                return UITableViewCell()
            }
         //   let timer = self.timers[indexPath.row]
            cell.cellViewModel = viewModel.cellViewModels[indexPath.row]
           // viewModel.updateCell(atIndex: indexPath)
            //cell.nameLabel.text = self.formatter.string(from: timer.elapsed) ?? "0:00:00"
           // cell.nameLabel.text = self.formatter.string(from: timer.elapsed)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return groupSection[section]
    }
}

extension ViewController {
    
   

    
 
}


