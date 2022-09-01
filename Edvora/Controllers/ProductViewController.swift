//
//  ProductViewController.swift
//  Edvora
//
//  Created by Dhruv Shrivastava on 01/09/22.
//

import Foundation
import UIKit
import SwiftUI

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var products = [Products]()
    {
        
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Products"
        tableView.delegate = self
        tableView.dataSource = self
        ApiCallerProducts.shared.downloadJSON { Product in
            self.products = Product
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = String(products[indexPath.row].product_id) + " " +   products[indexPath.row].name.capitalized + " |Price: $" + String(products[indexPath.row].selling_price)
        cell.tag = products[indexPath.row].selling_price
        return cell
    }
    
}
