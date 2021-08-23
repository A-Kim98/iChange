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
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Bills
    
    @IBOutlet weak var fiveDollarBillCount: UILabel!
    @IBOutlet weak var tenDollarBillCount: UILabel!
    @IBOutlet weak var twentyDollarBillCount: UILabel!
    @IBOutlet weak var fiftyDollarBillCount: UILabel!
    @IBOutlet weak var HundredDollarBillCount: UILabel!
    
    
    // Coins
    
    @IBOutlet weak var pennyCount: UILabel!
    @IBOutlet weak var nickelCount: UILabel!
    @IBOutlet weak var dimeCount: UILabel!
    @IBOutlet weak var quarterCount: UILabel!
    @IBOutlet weak var loonieCount: UILabel!
    @IBOutlet weak var toonieCount: UILabel!
    
    
    // MARK:- Properties
    
    var totalAmount: Float = 0.0
    var paidAmount:  Float = 0.0
    let coins = [1, 5, 10, 25, 100, 200, 500, 1000, 2000, 5000, 10000]
    

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
    
    /// Find the minium coins to make a given change
    func leastCoins(_ coins: [Int], _ amount: Float) -> [Double:Int] {
        
        var resultDict = [0.01:0, 0.05:0, 0.10:0, 0.25:0, 1.0:0, 2.0:0, 5:0, 10:0, 20:0, 50:0, 100:0]
        var change = Int(amount * 100)
        let coinArray = coins.filter{$0 <= change}
        
        
        while change > 0 {
            for i in coinArray.reversed() {
                
                if (change / i > 0) {
                    
                    let coin = Double(i) / 100
                    let count = change / i
                    
                    resultDict.updateValue(count, forKey: coin)
                }
                change = change % i
            }
        }
        
        return resultDict
    }
    
    /// update Bills View
    
    func updateBills(_ result: [Double: Int]) {
        
        for i in result {
                        
            if i.key == 5 {
                fiveDollarBillCount.text = String(i.value)
            }
            
            if i.key == 10 {
                tenDollarBillCount.text = String(i.value)
            }
            
            if i.key == 20 {
                twentyDollarBillCount.text = String(i.value)
            }
            
            if i.key == 50 {
                fiftyDollarBillCount.text = String(i.value)
            }
            
            if i.key == 100 {
                HundredDollarBillCount.text = String(i.value)
            }
        }
        
    }
    
    /// update Coins View
    
    func updateCoins(_ result: [Double: Int]) {
        
        for i in result {
            
            if i.key == 0.01 {
                pennyCount.text = String(i.value)
            }
            
            if i.key == 0.05 {
                nickelCount.text = String(i.value)
            }
            
            if i.key == 0.10 {
                dimeCount.text = String(i.value)
            }
            
            if i.key == 0.25 {
                quarterCount.text = String(i.value)
            }
            
            if i.key == 1.00 {
                loonieCount.text = String(i.value)
            }
            
            
            if i.key == 2.00 {
                toonieCount.text = String(i.value)
            }
            
        }
    }
    
    /// reset Bills View
    
    func clearBills() {
        
        fiveDollarBillCount.text = "0"
        tenDollarBillCount.text = "0"
        twentyDollarBillCount.text = "0"
        fiftyDollarBillCount.text = "0"
        HundredDollarBillCount.text = "0"
        
    }
    
    /// reset Coins View
    
    func clearCoins() {
        
        pennyCount.text = "0"
        nickelCount.text = "0"
        dimeCount.text = "0"
        quarterCount.text = "0"
        loonieCount.text = "0"
        toonieCount.text = "0"
        
    }
    
    /// Display results on the ChangeBreakdown Views
    
    func displayResult (_ amount: Float) {
        
        let chargeDue = (amount * 1000).rounded(.toNearestOrEven) / 1000
        
        let resultChange = leastCoins(coins, chargeDue)
        
        // update Bills
        updateBills(resultChange)
        
        // update Coins
        updateCoins(resultChange)

    }
}



// MARK:- UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {

            let firstCell = tableView.dequeueReusableCell(withIdentifier: "totalAmountCell", for: indexPath) as! totalAmountCell
            
            firstCell.chargeDueLabel.text = "Charge Due"
            
        
            if totalAmount != 0.0 && paidAmount != 0.0 {
                
                let chargeDue = (paidAmount - totalAmount)
                
                firstCell.totalAmountLabel.text = "$\(String(format:"%.2f", chargeDue))"
                
                // display Results on the Screen
                displayResult(chargeDue)
                
            }
            
            else {
                firstCell.totalAmountLabel.text = "$0.00"
            }
            
            return firstCell
            
        } else if indexPath.row == 1 {
             
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "addTotalCell", for: indexPath) as! addTotalCell
            
            // Bold font
            
            var attributes = [NSAttributedString.Key: AnyObject]()
            
            attributes[.foregroundColor] = UIColor.black
            attributes[.font] = UIFont.systemFont(ofSize: 16, weight: .bold)
            
            // Regular font
            
            let attributsNormal = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular)]

            let attributedString = NSMutableAttributedString(string: "Total: ", attributes:attributsNormal)
            let boldStringPart = NSMutableAttributedString(string: "$\(totalAmount)", attributes:attributes)
            attributedString.append(boldStringPart)
            
        
            if totalAmount != 0.0 {
                secondCell.addTotalLabel.attributedText = attributedString
                secondCell.addTotalButton.setTitle("Edit Total", for: .normal)
            }
            
            else {
                secondCell.addTotalLabel.text = "Start by adding total"
                secondCell.addTotalButton.setTitle("Add Total", for: .normal)
                
                // clear changeBreakdown
                clearBills()
                clearCoins()
            }
            
            secondCell.addTotalButton.setBordersSettings()
            
            return secondCell
            
        } else {
            
            let thirdCell = tableView.dequeueReusableCell(withIdentifier: "addPaidCell", for: indexPath) as! addPaidCell
            
            // Bold font
            
            var attributes = [NSAttributedString.Key: AnyObject]()
            
            attributes[.foregroundColor] = UIColor.black
            attributes[.font] = UIFont.systemFont(ofSize: 16, weight: .bold)
            
            // Regular font
            
            let attributsNormal = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .regular)]
    
            let attributedString = NSMutableAttributedString(string: "Paid: ", attributes:attributsNormal)
            let boldStringPart = NSMutableAttributedString(string: "$\(paidAmount)", attributes:attributes)
            attributedString.append(boldStringPart)
            
            
            if paidAmount != 0.0 {
                thirdCell.addPaidLabel.attributedText = attributedString
                thirdCell.addPaidButton.setTitle("Edit Paid", for: .normal)
            }
            
            else {
                thirdCell.addPaidLabel.text = "Then add amount paid"
                thirdCell.addPaidButton.setTitle("Add Paid", for: .normal)
                
                // clear changeBreakdown
                clearBills()
                clearCoins()
            }
            
            thirdCell.addPaidButton.setBordersSettings()
            
            return thirdCell
        }
    }
        
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension UIButton {
    func setBordersSettings() {
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
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
