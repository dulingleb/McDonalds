//
//  FeedbackViewController.swift
//  McDonalds
//
//  Created by Dulin Gleb on 25.9.23..
//

import UIKit

class FeedbackViewController: UIViewController {
    
    
    @IBOutlet var rateStars: [UIButton]!
    @IBOutlet weak var feedbackTextTextView: UITextView!
    
    var mealIndex: Int!
    var mark: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    @IBAction func clickStarAction(_ sender: UIButton) {
        var stateStar = "starFilled.png"
        mark = 1
        for index in rateStars.indices {
            rateStars[index].setImage(#imageLiteral(resourceName: stateStar), for: .normal)
            
            if rateStars[index].restorationIdentifier == sender.restorationIdentifier {
                stateStar = "starEmpty"
                mark = index + 1
            }
        }
    }
    
    
    @IBAction func sendButtonAction(_ sender: UIButton) {
        let feedback:Feedback = Feedback(text: feedbackTextTextView.text, mark: mark)
        MealsData.shared.meals[mealIndex].overviews.append(feedback)
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
