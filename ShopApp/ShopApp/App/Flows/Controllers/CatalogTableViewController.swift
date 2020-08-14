//
//  CatalogTableViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 10.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class CatalogTableViewController: UITableViewController {
    
    private var catalogRequest: CatalogDataRequestFactory!
    private var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Catalog"
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productIdentifier")
        
        catalogRequest = RequestFactory().makeCatalogDataRequestFatory()
        setupRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCatalogData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productIdentifier", for: indexPath) as! ProductTableViewCell
        
        let product = products[indexPath.row]

        cell.productLabel.text = "\(product.name)"
        cell.priceLabel.text = "\(product.price) RUB"
        cell.idLabel.text = "ID - \(product.id)"
        
        return cell
    }
    
    private func updateCatalogData(){
        catalogRequest.getCatalogData(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.products = value
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //Pull-to-refresh
    fileprivate func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl?.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        refreshControl?.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
    }

    @objc func refreshNews() {
        self.refreshControl?.beginRefreshing()
        updateCatalogData()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
}
