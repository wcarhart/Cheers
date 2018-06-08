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
    
    var enabledMonday: Bool = false
    var enabledTuesday: Bool = false
    var enabledWednesday: Bool = false
    var enabledThursday: Bool = false
    var enabledFriday: Bool = false
    var enabledSaturday: Bool = false
    var enabledSunday: Bool = false
    
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
    
    // monday 2 (late night) outlets
    @IBOutlet weak var mon2StartPicker: UIPickerView!
    @IBOutlet weak var mon2EndPicker: UIPickerView!
    @IBOutlet weak var mon2StartButton: UIButton!
    @IBOutlet weak var mon2EndButton: UIButton!
    var mon2StartIsAM: Bool = false
    var mon2EndIsAM: Bool = false
    @IBOutlet weak var mon2Label: UILabel!
    @IBOutlet weak var mon2PrimaryButton: UIButton!
    @IBOutlet weak var mon2SecondaryButton: UIButton!
    @IBOutlet weak var mon2LeftView: UIView!
    @IBOutlet weak var mon2CenterView: UIView!
    
    
    let components: [String] = ["1", "1:30", "2", "2:30", "3", "3:30", "4", "4:30", "5", "5:30", "6", "6:30", "7", "7:30", "8", "8:30", "9", "9:30", "10", "10:30", "11", "11:30", "12", "12:30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeControls()
        configurePickers()
    }
    
    func initializeControls() {
        // monday 1
        mon1Label.isHidden = false
        mon1Label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20.0)
        mon1Label.backgroundColor = FlatYellow()
        mon1PrimaryButton.isHidden = false
        mon1SecondaryButton.isHidden = true
        
        mon1StartPicker.isHidden = true
        mon1StartButton.isHidden = true
        mon1EndPicker.isHidden = true
        mon1EndButton.isHidden = true
        
        // monday 2 (late night)
        mon2Label.isHidden = false
        mon2Label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20.0)
        mon2Label.backgroundColor = FlatGray()
        mon2PrimaryButton.isHidden = true
        mon2SecondaryButton.isHidden = true
        
        mon2StartPicker.isHidden = true
        mon2StartButton.isHidden = true
        mon2EndPicker.isHidden = true
        mon2EndButton.isHidden = true
    }
    
    func configurePickers() {
        // TODO: set button text color to grey (not ugly system blue)
        
        // monday 1
        mon1StartPicker.dataSource = self
        mon1StartPicker.delegate = self
        mon1StartPicker.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon1StartPicker.selectRow(8, inComponent: 0, animated: false)
        mon1StartButton.setTitle("PM", for: .normal)
        mon1StartButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
        
        mon1EndPicker.dataSource = self
        mon1EndPicker.delegate = self
        mon1EndPicker.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon1EndPicker.selectRow(12, inComponent: 0, animated: false)
        mon1EndButton.setTitle("PM", for: .normal)
        mon1EndButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
        
        // monday 2 (late night)
        mon2StartPicker.dataSource = self
        mon2StartPicker.delegate = self
        mon2StartPicker.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon2StartPicker.selectRow(8, inComponent: 0, animated: false)
        mon2StartButton.setTitle("PM", for: .normal)
        mon2StartButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
        
        mon2EndPicker.dataSource = self
        mon2EndPicker.delegate = self
        mon2EndPicker.transform = CGAffineTransform(rotationAngle: .pi / -2.0)
        mon2EndPicker.selectRow(12, inComponent: 0, animated: false)
        mon2EndButton.setTitle("PM", for: .normal)
        mon2EndButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)
    }
    
    func updateDaySliders() {
        
    }
    
    @IBAction func mon1PrimaryButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.mon1Label.frame = self.mon1LeftView.bounds
            self.mon1Label.backgroundColor = FlatGreen()
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
            
            self.mon2Label.backgroundColor = FlatYellow()
            self.mon2PrimaryButton.isHidden = false
            self.mon2SecondaryButton.isHidden = false
            
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
            
            self.mon1Label.frame = self.mon1CenterView.frame
            self.mon1Label.backgroundColor = FlatYellow()
            
            self.mon2Label.backgroundColor = FlatGray()
            self.mon2PrimaryButton.isHidden = true
            self.mon2SecondaryButton.isHidden = true
            self.mon2SecondaryButtonHelper(false)
            
        }) { (_) in
            self.mon1PrimaryButton.isHidden = false
            self.mon1SecondaryButton.isHidden = true
            
            self.mon1StartPicker.isHidden = false
            self.mon1StartButton.isHidden = false
            self.mon1EndPicker.isHidden = false
            self.mon1EndButton.isHidden = false
        }
        
    }
    
    @IBAction func mon2PrimaryButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            self.mon2Label.frame = self.mon1LeftView.bounds
            self.mon2Label.backgroundColor = FlatGreen()
        }) { (_) in
            self.mon2PrimaryButton.isHidden = true
            self.mon2SecondaryButton.isHidden = false
            
            self.mon2StartPicker.alpha = 0.0
            self.mon2StartButton.alpha = 0.0
            self.mon2EndPicker.alpha = 0.0
            self.mon2EndButton.alpha = 0.0
            
            self.mon2StartPicker.isHidden = false
            self.mon2StartButton.isHidden = false
            self.mon2EndPicker.isHidden = false
            self.mon2EndButton.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
                self.mon2StartPicker.alpha = 1.0
                self.mon2StartButton.alpha = 1.0
                self.mon2EndPicker.alpha = 1.0
                self.mon2EndButton.alpha = 1.0
            }, completion: { (_) in
                
            })
        }
    }
    
    @IBAction func mon2SecondaryButtonPressed(_ sender: UIButton) {
        mon2SecondaryButtonHelper(true)
    }
    
    func mon2SecondaryButtonHelper(_ enabled: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.mon2StartPicker.alpha = 0.0
            self.mon2StartButton.alpha = 0.0
            self.mon2EndPicker.alpha = 0.0
            self.mon2EndButton.alpha = 0.0
            
            self.mon2Label.frame = self.mon1CenterView.frame
            self.mon2Label.backgroundColor = enabled ? FlatYellow() : FlatGray()
        }) { (_) in
            self.mon2PrimaryButton.isHidden = enabled ? false : true
            self.mon2SecondaryButton.isHidden = true
            
            self.mon2StartPicker.isHidden = false
            self.mon2StartButton.isHidden = false
            self.mon2EndPicker.isHidden = false
            self.mon2EndButton.isHidden = false
        }
    }
    
    // TOOD: for 'submit' or 'save' button, need to check if valid and animate incorrect rows accordingly
    
    @IBAction func mon1StartButtonPressed(_ sender: UIButton) {
        if mon1StartIsAM {
            mon1StartButton.setTitle("PM", for: .normal)
        } else {
            mon1StartButton.setTitle("AM", for: .normal)
        }
        mon1StartIsAM = !mon1StartIsAM
    }
    
    @IBAction func mon2StartButtonPressed(_ sender: UIButton) {
        if mon2StartIsAM {
            mon2StartButton.setTitle("PM", for: .normal)
        } else {
            mon2StartButton.setTitle("AM", for: .normal)
        }
        mon2StartIsAM = !mon2StartIsAM
    }
    
    @IBAction func mon1EndButtonPressed(_ sender: UIButton) {
        
        // TODO: if end time is AM the next day, we need to print out a warning/notification that says +1 day
        
        if mon1EndIsAM {
            mon1EndButton.setTitle("PM", for: .normal)
        } else {
            mon1EndButton.setTitle("AM", for: .normal)
        }
        mon1EndIsAM = !mon1EndIsAM
    }
    
    @IBAction func mon2EndButtonPressed(_ sender: UIButton) {
        
        // TODO: if end time is AM the next day, we need to print out a warning/notification that says +1 day
        
        if mon2EndIsAM {
            mon2EndButton.setTitle("PM", for: .normal)
        } else {
            mon2EndButton.setTitle("AM", for: .normal)
        }
        mon2EndIsAM = !mon2EndIsAM
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
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .clear
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
