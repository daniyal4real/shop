//
//  ViewController.swift
//  project
//
//  Created by dan on 29.03.2023.
//

import UIKit
import Alamofire


struct Product: Decodable {
    let title: String
    let price: Double
}


class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var products = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ProductCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ProductCell.identifier)
        getProducts()
    }
    
    func getProducts() {
        let url = "https://fakestoreapi.com/products"

        AF.request(url).response { response in
            if let data = response.data {
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    self.products = products
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error decoding products: \(error.localizedDescription)")
                }
            }
            print(self.products)
        }

    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        cell.nameLabel.text = products[indexPath.row].title
        print(products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    

}

