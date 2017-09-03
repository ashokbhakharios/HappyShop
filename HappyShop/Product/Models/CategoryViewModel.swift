//
//  CategoryViewModel.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

protocol CategoryViewModelDelegate: NSObjectProtocol {
    func errorOnGettingNewResults()
    func reloadViewForNewSearchResult()
    func startedPaginationCall()
    func finishedPaginationCall()
}

class CategoryViewModel: NSObject {

    var categoryName: String = ""
    var pageNo = 1
    var categoryItems = Array<CategoryItemDetails>()
    weak var delegate: CategoryViewModelDelegate?
    var currentApiStatus: APIStatus = .none
    
    enum APIStatus {
        case none, inProgress, success, failure, noMorePage
    }
    
    func getCategoryDetails() {
        let service = ProductService()
        currentApiStatus = .inProgress
        service.getCategoryDetails(categoryName, pageNo: pageNo, successBlock: {[weak self] (data) in
            if let items = data as? Array<CategoryItemDetails> {
                self?.categoryItems = items
                self?.currentApiStatus = .success
                self?.delegate?.reloadViewForNewSearchResult()
            }
            else{
                //Handle error
                self?.currentApiStatus = .failure
                self?.delegate?.errorOnGettingNewResults()
            }
        }) { [weak self](error) in
            //Error Handling
            self?.currentApiStatus = .failure
            self?.delegate?.errorOnGettingNewResults()
        }
    }
    
    func getCategoryDetailsOnPagination() {
        
        if currentApiStatus == .inProgress || currentApiStatus == .noMorePage {
            return
        }
        currentApiStatus = .inProgress
        
        self.delegate?.startedPaginationCall()
        
        let service = ProductService()
        service.getCategoryDetails(categoryName, pageNo: pageNo + 1, successBlock: {[weak self] (data) in
            if let items = data as? Array<CategoryItemDetails> {
                self?.categoryItems.append(contentsOf: items)
                if let currentpage = self?.pageNo {
                    self?.pageNo =  currentpage + 1
                }
                self?.currentApiStatus = .success
            }
            else{
                //Handle error
                self?.currentApiStatus = .failure
            }
            self?.delegate?.finishedPaginationCall()
        }) {[weak self] (error) in
            //Error Handling
            self?.currentApiStatus = .failure
            self?.delegate?.finishedPaginationCall()
        }
    }
}
