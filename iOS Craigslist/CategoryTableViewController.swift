//
//  CategoryTableViewController.swift
//  iOS Craigslist
//
//  Created by Vincent Ninh DO on 4/16/18.
//  Copyright © 2018 Vincent Ninh DO. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryTableCellLabel: UILabel!
    
}

class CategoryTableViewController: UIViewController {

    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        categoryTable.dataSource = self
        categoryTable.delegate = self
//        Category.loadData()
        self.title = "Craigslist"
        print("here")
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
        performSegue(withIdentifier: "categoryTableToLogIn", sender: nil)
    }
}

extension CategoryTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = categoryArray[section]
        return categoryDict[category]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.categoryTable.dequeueReusableCell(withIdentifier: "categoryTableCell", for: indexPath) as? CategoryTableViewCell {
            let category = categoryArray[indexPath.section]
            let subcategoryArray = categoryDict[category]!
            cell.categoryTableCellLabel.text = subcategoryArray[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryArray[section].capitalized
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = view as? UITableViewHeaderFooterView else { return nil }
//        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categoryTableToItemCollection", sender: nil)
    }
}
