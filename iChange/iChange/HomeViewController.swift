//
//  HomeViewController.swift
//  iChange
//
//  Created by Alice Kim on 2021-08-12.
//

import UIKit


// MARK:- Custom tableViewCell

class totalAmountCell: UITableViewCell {
    
    @IBOutlet weak var chargeDueLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
}

class addTotalCell: UITableViewCell {

    @IBOutlet weak var addTotalLabel: UILabel!
    @IBOutlet weak var addTotalButton: UIButton!
    
}

class addPaidCell: UITableViewCell {

    @IBOutlet weak var addPaidLabel: UILabel!
    @IBOutlet weak var addPaidButton: UIButton!
    
}



class HomeViewController: UIViewController {
    
    // MARK:- IBOutlet Properties
    
    @IBOutlet weak var totalTableView: UITableView!
    
    

    
    
    
    // MARK:- Properties
    
    
   
    // MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        totalTableView.delegate = self
        totalTableView.dataSource = self


    }
    

    // MARK:- IBAction Methods
    
    
    // MARK:- Custom Methods
    
}



// MARK:- UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
             //configure cell type 1
            let firstCell = tableView.dequeueReusableCell(withIdentifier: "totalAmountCell", for: indexPath) as! totalAmountCell
            
            firstCell.chargeDueLabel.text = "Charge Due"
            firstCell.totalAmountLabel.text = "$0.00"
            
            return firstCell
            
        } else if indexPath.row == 1 {
             //configure cell type 2
            
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "addTotalCell", for: indexPath) as! addTotalCell
            
            secondCell.addTotalLabel.text = "Start by adding total"
            secondCell.addTotalButton.titleLabel?.text = "Add Total"
            
            return secondCell
            
        } else {
            
            let thirdCell = tableView.dequeueReusableCell(withIdentifier: "addPaidCell", for: indexPath) as! addPaidCell
            
            thirdCell.addPaidLabel.text = "Then add amount paid"
            thirdCell.addPaidButton.titleLabel?.text = "Add Paid"
            
            return thirdCell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        print("you tapped me!")
    }
    

}
