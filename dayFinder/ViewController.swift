//
//  ViewController.swift
//  dayFinder
//
//  Created by Татьяна Татьяна on 19.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    
    @IBOutlet weak var resultLabl: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        guard let day = dataTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        let calendar = Calendar.current
        var dateComponets = DateComponents()
        dateComponets.day = Int(day)
        dateComponets.month = Int(month)
        dateComponets.year = Int(year)
        
        let dateFormator = DateFormatter()
        dateFormator.locale = Locale(identifier: "ru_Ru")
        dateFormator.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponets) else { return }
        
        let weekday = dateFormator.string(from: date)
        let capitalizedWekday = weekday.capitalized
        
        resultLabl.text = capitalizedWekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

