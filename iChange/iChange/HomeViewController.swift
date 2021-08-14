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
    
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * 0.90
            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
            frame.origin.x += space

            super.frame = frame

        }
    }

    

    
}

class addTotalCell: UITableViewCell {

    @IBOutlet weak var addTotalLabel: UILabel!
    @IBOutlet weak var addTotalButton: UIButton!
    
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * 0.90
            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
            frame.origin.x += space

            super.frame = frame

        }
    }
}

class addPaidCell: UITableViewCell {

    @IBOutlet weak var addPaidLabel: UILabel!
    @IBOutlet weak var addPaidButton: UIButton!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * 0.90 // get 80% width here
            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
            frame.origin.x += space

            super.frame = frame

        }
    }
    
}



class HomeViewController: UIViewController {
    
    // MARK:- IBOutlet Properties
    
    @IBOutlet weak var totalTableView: UITableView!

    @IBOutlet weak var plusButton: UIButton!
    
    
    
    
    // MARK:- Properties
    
    
   
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
            
            secondCell.addTotalButton.setBordersSettings()
            
            
            return secondCell
            
        } else {
            
            let thirdCell = tableView.dequeueReusableCell(withIdentifier: "addPaidCell", for: indexPath) as! addPaidCell
            
            thirdCell.addPaidLabel.text = "Then add amount paid"
            thirdCell.addPaidButton.titleLabel?.text = "Add Paid"
            thirdCell.addPaidButton.setBordersSettings()
            
            return thirdCell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        print("you tapped me!")
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



