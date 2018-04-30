//
//  CategoryCollectionViewController.swift
//  iOS Craigslist
//
//  Created by Vincent Ninh DO on 4/9/18.
//  Copyright © 2018 Vincent Ninh DO. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
}

class CategoryCollectionViewController: UIViewController {

    @IBOutlet weak var categoryCollection: UICollectionView!
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Category.loadData()
//        categoryCollection.dataSource = self
//        categoryCollection.delegate = self
        self.title = "Craigslist"
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Hide the Navigation Bar in this view
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "categoryCollectionToSubcategoryTable", let dest = segue.destination as? SubcategoryTableViewController {
            dest.category = categoryArray[self.selectedIndexPath!.item]
        }
    }
    
    @IBAction func unwindFromSignUp(segue: UIStoryboardSegue) {
        
    }

    @IBAction func loginProfileButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "categoryCollectionToLogIn", sender: nil)
    }
    
}

extension CategoryCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "categoryCollectionCell", for: indexPath) as? CategoryCollectionViewCell {
            let category = categoryArray[indexPath.item]
            cell.categoryImage.image = UIImage(named: category)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        performSegue(withIdentifier: "categoryCollectionToSubcategoryTable", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        // let itemWidth = screenSize.width / 3
        let itemWidth = min(screenSize.width, screenSize.height) / 3
        // let itemWidth = collectionView.bounds.width / 3
        // let itemWidth = collectionView.frame.width / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

