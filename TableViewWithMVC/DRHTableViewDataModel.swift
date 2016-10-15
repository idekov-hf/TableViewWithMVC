//
//  DRHDataModel.swift
//  TableViewWithMVC
//
//  Created by Iavor Dekov on 10/15/16.
//  Copyright © 2016 Iavor Dekov. All rights reserved.
//

import Foundation

class DRHTableViewDataModel {
    
    weak var delegate: DRHTableViewDataModelDelegate?
    
    func requestData() {
        // code to request data from API or local JSON file will go here
        // this two vars were returned from wherever:
        var response: [AnyObject]?
        let error: Error?
        
        if let filePath = Bundle.main.path(forResource: "data", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                response = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? [AnyObject]
            }
            catch {
                //Handle error
            }
        }
        
        if let error = error {
            // handle error
            delegate?.didFailDataUpdateWithError(error: error)
        } else if let response = response {
            // parse response to [DRHTableViewDataModelItem]
            setDataWithResponse(response: response)
        }
    }
    
    private func setDataWithResponse(response: [AnyObject]) {
        
        var data = [DRHTableViewDataModelItem]()
        
        for item in response {
            
            if let drhTableViewDataModelItem = DRHTableViewDataModelItem(data: item as? [String: String]) {
                
                data.append(drhTableViewDataModelItem)
            }
        }
        
        delegate?.didRecieveDataUpdate(data: data)
    }
}

protocol DRHTableViewDataModelDelegate: class {
    
    func didRecieveDataUpdate(data: [DRHTableViewDataModelItem])
    func didFailDataUpdateWithError(error: Error)
}
