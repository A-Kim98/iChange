//
//  HomeViewController.swift
//  iChange
//
//  Created by Alice Kim on 2021-08-12.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK:- IBOutlet Properties
    
    @IBOutlet weak var totalTableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!

    
    // MARK:- Properties
    
    var totalAmount: Float = 0.0
    var paidAmount:  Float = 0.0
   
    
    // MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        totalTableView.delegate = self
        totalTableView.dataSource = self

        // This will remove extra separators from tableview
        self.totalTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        plusButton.setBordersSettingsPlusButton()
    }
    

    // MARK:- IBAction Methods
    
    @IBAction func addTotalButtonTapped(_ sender: Any) {
        
        // Create the alert controller
        let nameDialog = UIAlertController(title: "Purchase Total", message: "Enter the total amount due.", preferredStyle: .alert)
        
        // Add the text fields.
        nameDialog.addTextField { (textField) in
            
            textField.placeholder = "Total"
            
        }
        
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (alert) in
            
            guard let totalAmountInput = nameDialog.textFields?.first?.text
            else {
                self.showError(string:"An unknown error occurred. please try again");
                return
                
            }
        
            self.totalAmount = Float(totalAmountInput)!
                                    
            self.totalTableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        nameDialog.addAction(doneAction)
        nameDialog.addAction(cancelAction)
        
        present(nameDialog, animated: true, completion: nil)
    }
    
    
    @IBAction func addPaidButtonTapped(_ sender: Any) {
        
        // Create the alert controller
        let nameDialog = UIAlertController(title: "Amount Paid", message: "Enter how much your customer paid.", preferredStyle: .alert)
        
        // Add the text fields.
        nameDialog.addTextField { (textField) in
            
            textField.placeholder = "Paid"
            
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (alert) in
            
            guard let paidAmountInput = nameDialog.textFields?.first?.text
            else {
                self.showError(string:"An unknown error occurred. please try again");
                return
                
            }
            
            self.paidAmount = Float(paidAmountInput)!
                                    
            self.totalTableView.reloadData()
                    
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        nameDialog.addAction(doneAction)
        nameDialog.addAction(cancelAction)
        
        present(nameDialog, animated: true, completion: nil)
    }
    
    // MARK:- Custom Methods
    
    /// Display appropriate error messages
    func showError(string: String) {
        // create the alert
        let alert = UIAlertController(title: "Error", message: string, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
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
            
        
            if totalAmount != 0.0 && paidAmount != 0.0 {
                firstCell.totalAmountLabel.text = "$\(String(format:"%.2f", (paidAmount - totalAmount)))"
            }
            else {
                firstCell.totalAmountLabel.text = "$0.00"
            }
            
            return firstCell
            
        } else if indexPath.row == 1 {
             //configure cell type 2
            
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "addTotalCell", for: indexPath) as! addTotalCell
            
            if totalAmount != 0.0 {
                secondCell.addTotalLabel.text = "Total: \(totalAmount)"
                secondCell.addTotalButton.setTitle("Edit Total", for: .normal)
            }
            
            else {
                secondCell.addTotalLabel.text = "Start by adding total"
                secondCell.addTotalButton.setTitle("Add Total", for: .normal)
            }
            
            secondCell.addTotalButton.setBordersSettings()
            
            return secondCell
            
        } else {
            
            let thirdCell = tableView.dequeueReusableCell(withIdentifier: "addPaidCell", for: indexPath) as! addPaidCell
            
            if paidAmount != 0.0 {
                thirdCell.addPaidLabel.text = "Paid: \(paidAmount)"
                thirdCell.addPaidButton.setTitle("Edit Paid", for: .normal)
            }
            
            else {
                thirdCell.addPaidLabel.text = "Then add amount paid"
                thirdCell.addPaidButton.setTitle("Add Paid", for: .normal)
            }

            thirdCell.addPaidButton.setBordersSettings()
            
            return thirdCell
        }
    }
        
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension UIButton {
    func setBordersSettings() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.setTitleColor(UIColor.systemBlue, for: .normal)
        self.layer.masksToBounds = true
    }
    
    func setBordersSettingsPlusButton() {
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 0.5 * self.layer.bounds.size.width
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
    }
}



