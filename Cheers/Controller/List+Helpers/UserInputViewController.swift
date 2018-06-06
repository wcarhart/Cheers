//
//  UserInputViewController.swift
//  Cheers
//
//  Created by Will Carhart on 6/5/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import UIKit

class UserInputViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var mon1StartTime: UIPickerView!
    @IBOutlet weak var mon1EndTime: UIPickerView!
    
    let components: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mon1StartTime.dataSource = self
        mon1StartTime.delegate = self
        mon1StartTime.transform = CGAffineTransform(rotationAngle: .pi / 2)
        
    }

    @IBAction func mon1ButtonPressed(_ sender: UIButton) {
        print("mon1")
    }
}

extension UserInputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.components.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(components[row])
    }
}
