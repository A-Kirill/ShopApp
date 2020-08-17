//
//  AddReviewViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 15.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit

class AddReviewViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var postButton: UIButton!
    @IBAction func postPressed(_ sender: Any) {
        tryAddReview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postButton.layer.cornerRadius = 30
    }
    
    private func tryAddReview() {
        let review = requestFactory.makeAddReviewRequestFatory()
        review.addReview(idUser: 222, idProduct: 123, text: reviewText.text!) { response in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Done", message: value.message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
