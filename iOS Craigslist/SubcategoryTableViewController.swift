//
//  SubcategoryTableViewController.swift
//  iOS Craigslist
//
//  Created by Vincent Ninh DO on 4/15/18.
//  Copyright © 2018 Vincent Ninh DO. All rights reserved.
//

import UIKit

class SubcategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subcategoryTableCellLabel: UILabel!
    
}

class SubcategoryTableViewController: UIViewController {
    
    @IBOutlet weak var subcategoryTable: UITableView!
    
    var category: String?
    var subcategoryArray: [String]?
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        subcategoryTable.dataSource = self
//        subcategoryTable.delegate = self
        self.subcategoryArray = categoryDict[self.category!]
        self.title = self.category?.capitalized
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindFromSignUp(segue: UIStoryboardSegue) {
        
    }

    @IBAction func loginProfileButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "subcategoryTableToLogIn", sender: nil)
    }
}

extension SubcategoryTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcategoryArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.subcategoryTable.dequeueReusableCell(withIdentifier: "subcategoryCell", for: indexPath) as? SubcategoryTableViewCell {
            cell.subcategoryTableCellLabel.text = subcategoryArray![indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "subcategoryTableToItemCollection", sender: nil)
    }
}
