//
//  UserInputViewController.swift
//  Cheers
//
//  Created by Will Carhart on 6/5/18.
//  Copyright © 2018 University of San Diego. All rights reserved.
//

import UIKit
import ChameleonFramework

class UserInputViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var mon1StartTime: UIPickerView!
    @IBOutlet weak var mon1EndTime: UIPickerView!
    @IBOutlet weak var mon1StartAMPM: UIButton!
    @IBOutlet weak var mon1EndAMPM: UIButton!
    var mon1StartIsAM: Bool = false
    var mon1EndIsAM: Bool = false
    
    let components: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickers()
    }
    
    func configurePickers() {
        mon1StartTime.dataSource = self
        mon1StartTime.delegate = self
        mon1StartTime.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon1StartAMPM.setTitle("PM", for: .normal)
        mon1StartAMPM.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
        // TODO: set button text color to grey (not ugly system blue)
        
        mon1EndTime.dataSource = self
        mon1EndTime.delegate = self
        mon1EndTime.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon1EndAMPM.setTitle("PM", for: .normal)
        mon1EndAMPM.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
    }

    @IBAction func mon1ButtonPressed(_ sender: UIButton) {
        // DEBUG:
        print("mon1")
    }
    
    @IBAction func mon1StartAMPMButtonPressed(_ sender: UIButton) {
        if mon1StartIsAM {
            mon1StartAMPM.setTitle("PM", for: .normal)
        } else {
            mon1StartAMPM.setTitle("AM", for: .normal)
        }
        mon1StartIsAM = !mon1StartIsAM
    }
    
    @IBAction func mon1EndAMPMButtonPressed(_ sender: UIButton) {
        if mon1EndIsAM {
            mon1EndAMPM.setTitle("PM", for: .normal)
        } else {
            mon1EndAMPM.setTitle("AM", for: .normal)
        }
        mon1EndIsAM = !mon1EndIsAM
    }
}

extension UserInputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.components.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        pickerView.subviews[1].isHidden = true
        pickerView.subviews[2].isHidden = true
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let label = UILabel(frame: view.frame)
        label.text = String(components[row])
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 25.0)
        view.addSubview(label)
        view.transform = CGAffineTransform(rotationAngle: .pi / 2.0)
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
}
