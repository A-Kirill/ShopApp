//
//  ProductViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 14.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var productId: Int = 0
    let requestFactory = RequestFactory()
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addBasketButton: UIButton!
    @IBOutlet weak var reviewsButton: UIButton!
    
    @IBAction func addBasketPressed(_ sender: Any) {
    }
    @IBAction func reviewsPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryRequestProductData()
        
        addBasketButton.layer.cornerRadius = 30
        reviewsButton.layer.cornerRadius = 30
    }

    // MARK: - Private functions
    
    private func tryRequestProductData() {
        let productData = requestFactory.makeProductDataRequestFatory()
        productData.getProductData(id: productId) { response in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.priceLabel.text = "Price: \(value.price) RUB"
                    self.descriptionLabel.text = value.description
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
