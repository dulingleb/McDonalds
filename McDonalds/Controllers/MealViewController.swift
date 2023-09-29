//
//  MealViewController.swift
//  McDonalds
//
//  Created by Dulin Gleb on 25.9.23..
//

import UIKit

class MealViewController: UIViewController {
    
    var mealIndex: Int!
    
    var meal: Meal {
        MealsData.shared.meals[mealIndex]
    }

    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var reviewsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reviewsButton.setTitle("Reviews (\(meal.overviews.count))", for: .normal)
    }
    
    
    @IBAction func addReviewAction(_ sender: Any) {
        let feedbackViewController = storyboard?.instantiateViewController(identifier: "feedbackViewController") as! FeedbackViewController
        
        feedbackViewController.mealIndex = mealIndex
        
        navigationController?.pushViewController(feedbackViewController, animated: true)
    }
    
    @IBAction func reviewsAction(_ sender: Any) {
        let feedbacksViewController = storyboard?.instantiateViewController(identifier: "feedbacksViewController") as! FeedbacksTableViewController
        
        feedbacksViewController.mealIndex = mealIndex
        
        navigationController?.pushViewController(feedbacksViewController, animated: true)
    }
    
    private func configureUI() {
        imageImageView.image = meal.image
        nameLable.text = meal.name
        priceLable.text = String(meal.price) + " BYN"
    }
    
}
