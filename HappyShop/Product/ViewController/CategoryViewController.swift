//
//  CategoryViewController.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class CategoryViewController: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CategoryViewModelDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paginationActivityView: UIActivityIndicatorView!
    @IBOutlet weak var paginationActivityViewHeight: NSLayoutConstraint!
    
    var model = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doInitialConfigurtion()
        self.getCategoryData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Initial Setup
    
    func doInitialConfigurtion(){
        model.delegate = self
        collectionView.reloadData()
    }
    
    func getCategoryData(){
        self.activityIndicator.startAnimating()
        self.model.getCategoryDetails()
    }
    
    //MARK:- UICollectionView Cell Datasource & Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDetailCollectionCell", for: indexPath) as! CategoryDetailCollectionCell
        cell.configureCellWithDetails(self.model.categoryItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 40)/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = self.model.categoryItems[indexPath.row]
        guard let id = item.id else {
            return
        }

        let prductDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        prductDetailsVC.model.productId = id
        self.navigationController?.pushViewController(prductDetailsVC, animated: true)
    }
    
    //MARK:- ScrollView Dleegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height {
            //Make pagination call
            self.model.getCategoryDetailsOnPagination()
        }
    }
    
    //MARK:- ViewModel Delegate
    
    func reloadViewForNewSearchResult() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    func errorOnGettingNewResults() {
        DispatchQueue.main.async {
            //Show Error To User
            self.activityIndicator.stopAnimating()
        }
    }
    
    func startedPaginationCall() {
        DispatchQueue.main.async {
            self.paginationActivityViewHeight.constant = 50
            self.paginationActivityView.startAnimating()
        }
    }
    
    func finishedPaginationCall() {
        DispatchQueue.main.async {
            self.paginationActivityView.stopAnimating()
            self.paginationActivityViewHeight.constant = 0
            self.collectionView.reloadData()
        }
    }
    
}
