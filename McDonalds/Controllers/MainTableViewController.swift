//
//  MainTableViewController.swift
//  McDonalds
//
//  Created by Dulin Gleb on 23.9.23..
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var rateLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var rateStackView: UIStackView!
    @IBOutlet var starCollection: [UIImageView]!
}

class MainTableViewController: UITableViewController {
    
    var meals: [Meal] {
        MealsData.shared.meals
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell

        let meal = meals[indexPath.row]
        
        cell.nameLable?.text = meal.name
        cell.priceLable?.text = String(meal.price) + " byn"
        cell.imageImageView?.image = meal.image
        
        if meal.evarageMark == 0 {
            cell.rateLable?.text = "(no overviews)"
            cell.rateStackView.isHidden = true
        } else {
            cell.rateLable?.text = String(format: "(%.1f)", meal.evarageMark)
            
            cell.starCollection.forEach{ star in
                star.image = #imageLiteral(resourceName: "starEmpty.png")
            }
            
            let fullStar = Int(meal.evarageMark)
            
            for index in 0...fullStar-1 {
                cell.starCollection[index].image = #imageLiteral(resourceName: "starFilled.png")
            }
            
            if  (0.3..<0.8).contains(meal.evarageMark.truncatingRemainder(dividingBy: 1)) {
                cell.starCollection[fullStar].image = #imageLiteral(resourceName: "starHalf.png")
            }
            
            cell.rateStackView.isHidden = false
        }

        return cell
    }
    
    
    private func configUI() {
        self.tableView.rowHeight = 100
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mealController = segue.destination as! MealViewController
        let selectedRow = tableView.indexPathForSelectedRow!.row
        
        mealController.mealIndex = selectedRow
    }

}
