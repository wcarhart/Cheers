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
    
    // monday 1 outlets
    @IBOutlet weak var mon1StartPicker: UIPickerView!
    @IBOutlet weak var mon1EndPicker: UIPickerView!
    @IBOutlet weak var mon1StartButton: UIButton!
    @IBOutlet weak var mon1EndButton: UIButton!
    var mon1StartIsAM: Bool = false
    var mon1EndIsAM: Bool = false
    @IBOutlet weak var mon1Label: UILabel!
    @IBOutlet weak var mon1PrimaryButton: UIButton!
    @IBOutlet weak var mon1SecondaryButton: UIButton!
    @IBOutlet weak var mon1LeftView: UIView!
    @IBOutlet weak var mon1CenterView: UIView!
    
    let components: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeControls()
        configurePickers()
    }
    
    func initializeControls() {
        // monday 1
        mon1Label.isHidden = false
        mon1Label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20.0)
        // DEBUG: make this not orange, only for testing
        mon1Label.backgroundColor = FlatOrange()
        mon1PrimaryButton.isHidden = false
        mon1SecondaryButton.isHidden = true
        
        mon1StartPicker.isHidden = true
        mon1StartButton.isHidden = true
        mon1EndPicker.isHidden = true
        mon1EndButton.isHidden = true
    }
    
    func configurePickers() {
        mon1StartPicker.dataSource = self
        mon1StartPicker.delegate = self
        mon1StartPicker.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon1StartPicker.selectRow(4, inComponent: 0, animated: false)
        mon1StartButton.setTitle("PM", for: .normal)
        // TODO: set button text color to grey (not ugly system blue)
        mon1StartButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
        
        mon1EndPicker.dataSource = self
        mon1EndPicker.delegate = self
        mon1EndPicker.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon1EndPicker.selectRow(6, inComponent: 0, animated: false)
        mon1EndButton.setTitle("PM", for: .normal)
        // TODO: set button text color to grey (not ugly system blue)
        mon1EndButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
        
    }
    @IBAction func mon1PrimaryButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.mon1Label.frame = self.mon1LeftView.bounds
        }) { (_) in
            self.mon1PrimaryButton.isHidden = true
            self.mon1SecondaryButton.isHidden = false
            
            self.mon1StartPicker.alpha = 0.0
            self.mon1StartButton.alpha = 0.0
            self.mon1EndPicker.alpha = 0.0
            self.mon1EndButton.alpha = 0.0
            
            self.mon1StartPicker.isHidden = false
            self.mon1StartButton.isHidden = false
            self.mon1EndPicker.isHidden = false
            self.mon1EndButton.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
                self.mon1StartPicker.alpha = 1.0
                self.mon1StartButton.alpha = 1.0
                self.mon1EndPicker.alpha = 1.0
                self.mon1EndButton.alpha = 1.0
            }, completion: { (_) in
                
            })
        }
    }
    
    @IBAction func mon1SecondaryButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.mon1StartPicker.alpha = 0.0
            self.mon1StartButton.alpha = 0.0
            self.mon1EndPicker.alpha = 0.0
            self.mon1EndButton.alpha = 0.0
        }) { (_) in
            self.mon1PrimaryButton.isHidden = false
            self.mon1SecondaryButton.isHidden = true
            
            self.mon1StartPicker.isHidden = false
            self.mon1StartButton.isHidden = false
            self.mon1EndPicker.isHidden = false
            self.mon1EndButton.isHidden = false
            
            UIView.animate(withDuration: 0.1, animations: {
                self.mon1Label.frame = self.mon1CenterView.frame
            }, completion: { (_) in
                
            })
        }
        
    }
    
    // TOOD: for 'submit' or 'save' button, need to check if valid and animate incorrect rows accordingly
    
    @IBAction func mon1StartAMPMButtonPressed(_ sender: UIButton) {
        if mon1StartIsAM {
            mon1StartButton.setTitle("PM", for: .normal)
        } else {
            mon1StartButton.setTitle("AM", for: .normal)
        }
        mon1StartIsAM = !mon1StartIsAM
    }
    
    @IBAction func mon1EndAMPMButtonPressed(_ sender: UIButton) {
        
        // TODO: if end time is AM the next day, we need to print out a warning/notification that says +1 day
        
        if mon1EndIsAM {
            mon1EndButton.setTitle("PM", for: .normal)
        } else {
            mon1EndButton.setTitle("AM", for: .normal)
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
