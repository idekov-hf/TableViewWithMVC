//
//  DRHTableViewController.swift
//  TableViewWithMVC
//
//  Created by Iavor Dekov on 10/15/16.
//  Copyright © 2016 Iavor Dekov. All rights reserved.
//

import UIKit

class DRHTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    fileprivate var dataArray = [DRHTableViewDataModelItem]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private let dataSource = DRHTableViewDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(DRHTableViewCell.nib, forCellReuseIdentifier: DRHTableViewCell.identifier)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        dataSource.delegate = self
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 130
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        dataSource.requestData()
    }
}

extension DRHTableViewController: UITableViewDelegate {
    
}

extension DRHTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:
            DRHTableViewCell.identifier, for: indexPath) as? DRHTableViewCell {
            
            cell.configureWithItem(item: dataArray[indexPath.item])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
}

extension DRHTableViewController: DRHTableViewDataModelDelegate {
    
    func didFailDataUpdateWithError(error: Error) {
        // handle error case appropriately (display alert, log an error, etc.)
        print("Error updating")
    }
    
    func didRecieveDataUpdate(data: [DRHTableViewDataModelItem]) {
        
        dataArray = data
    }
}
