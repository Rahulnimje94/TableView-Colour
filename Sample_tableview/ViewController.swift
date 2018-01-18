//
//  ViewController.swift
//  Sample_tableview
//
//  Created by Anand on 18/01/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview1: UITableView!
    
    var month = ["Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"]
    var days = ["Monday", "Tuesday", "Wenesday", "Thuesday", "Friday", "Saturday", "Sunday"]
    
    fileprivate var colorMonth = [UIColor]()
    fileprivate var colorDays = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        month.forEach { _ in
             colorMonth.append(UIColor.randomcolor())
        }
        
        days.forEach { _ in
            colorDays.append(UIColor.randomcolor())
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 0 else {
            return "Days"
        }
        return "Month"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100))
        customView.backgroundColor = UIColor.lightGray
        let labelName = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelName.center = CGPoint(x: customView.frame.origin.x + 40, y: customView.frame.origin.y + 50)
        labelName.textAlignment = .center
        labelName.textColor = UIColor.black
        customView.addSubview(labelName)
        if section == 0 {
            labelName.text = "Months"
        }else{
            labelName.text = "Days"
        }
        return customView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 100.00
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else {
            return days.count
        }
        return month.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = days[indexPath.row]
            cell.textLabel?.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = colorDays[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = month[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = colorMonth[indexPath.row]
        return cell
    }
}


extension UIColor {
    
    static func randomcolor() -> UIColor {
        
        let randomBlue = drand48()
        let randomRed = drand48()
        let randomGreen = drand48()
        let randomAlpha = drand48()
        
        
        let color = UIColor(red: CGFloat(randomRed), green: CGFloat(randomGreen), blue: CGFloat(randomBlue), alpha: CGFloat(randomAlpha))
        return color
        
    }
    
    
}















