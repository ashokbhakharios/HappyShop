//
//  HomeViewController.swift
//  HappyShop
//
//  Created by AshokKumar on 02/09/17.
//  Copyright © 2017 Ashok. All rights reserved.
//

import UIKit

class HomeViewController: BaseVC, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var model = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doInitialConfigurtion()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Initial Setup
    
    func doInitialConfigurtion(){
        _ = model.getCategoryList()
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
    }
    

    //MARK:- UITableView Cell Datasource & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCategoryListCell") as! HomeCategoryListCell
        cell.configureCellWithName(self.model.categoryList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        categoryVC.model.categoryName = self.model.categoryList[indexPath.row]
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }

}
