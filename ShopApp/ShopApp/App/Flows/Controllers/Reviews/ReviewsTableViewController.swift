//
//  ReviewsTableViewController.swift
//  ShopApp
//
//  Created by Kirill Anisimov on 14.08.2020.
//  Copyright © 2020 Kirill Anisimov. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class ReviewsTableViewController: UITableViewController {
    
    var productId: Int = 0
    private var reviews: [Review] = []
    let requestFactory = RequestFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        tryGetReviews()
        addButton()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCellID", for: indexPath)
        let review = reviews[indexPath.row]

        cell.textLabel?.text = review.text
        cell.detailTextLabel?.text = "By user ID \(review.idUser)"

        return cell
    }
    
    // MARK: - Private functions

    private func tryGetReviews(){
        
        Analytics.logEvent("Get_reviews", parameters: nil)
        
        let reviews = requestFactory.makeReviewsListRequestFatory()
        reviews.getReviewsList(idProduct: productId) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.reviews = value
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let reviewVC = segue.destination as! ReviewsTableViewController
        reviewVC.productId = self.productId
    }
    
    private func addButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAdd))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func pushAdd() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newReviewVC = storyboard.instantiateViewController(identifier: "newReviewVC")

        show(newReviewVC, sender: self)
    }
}
