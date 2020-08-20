//
//  BasketTableViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 17.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class BasketTableViewController: UITableViewController {
    
    private var basketRequest: BasketRequestFactory!
    private var deleteRequest: DeleteFromBasketRequestFactory!
    private var products: [InBasket] = []
    let requestFactory = RequestFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Your Cart"
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productIdentifier")
        
        basketRequest = RequestFactory().makeBasketRequestFactory()
        deleteRequest = RequestFactory().makeDeleteFromBasketRequestFatory()
        
        let payButton = UIBarButtonItem(image: UIImage(named: "pay"), style: .plain, target: self, action: #selector(showActionSheet))
        self.navigationItem.rightBarButtonItem = payButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tryGetBasket()
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

        cell.productLabel.text = "\(product.productName)"
        cell.priceLabel.text = "\(product.price) RUB"
        cell.idLabel.text = "ID - \(product.idProduct)"
        cell.productImage.image = UIImage(named: "no image")
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let prodId = products[indexPath.row].idProduct

            self.tryDeleteFromBasket(id: prodId)

            products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Private functions
    
    private func tryGetBasket() {
        basketRequest.getBasket(idUser: 222) { response in
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
    
    private func tryDeleteFromBasket(id: Int) {
        deleteRequest.deleteFromBasket(idProduct: id) { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func payButtonTapped() {
        let payment = requestFactory.makePaymentOrderRequestFatory()
        payment.paymentOrder(idProduct: 123, creditCard: "4444-4444-4444-4444") { response in
            switch response.result {
            case .success(let userMessage):
                print(userMessage)
                DispatchQueue.main.async {
                    self.showDoneAllert()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //Action Sheet
    @objc private func showActionSheet(controller: UIViewController) {
        let alert = UIAlertController(title: "Payment", message: "Would you like to pay for items in your card?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Approve", style: .default, handler: { (_) in
            print("User click Approve button")
            self.payButtonTapped()
        }))
        
        alert.addAction(UIAlertAction(title: "Edit payment method", style: .default, handler: { (_) in
            print("User click Edit button")
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    private func showDoneAllert() {
        let alert = UIAlertController(title: "Done", message: "Your order has been paid", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
