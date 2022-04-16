//
//  SpringAnimationViewController.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//

import UIKit
import SpringAnimation

class SpringAnimationViewController: UIViewController {
    
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var delaySlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var forceSlider: UISlider!
    @IBOutlet var springView: SpringView!
    
    private let animations = AnimationPreset.allCases
    private let animationCurves = AnimationCurve.allCases
    
    private var animationIndex = 0
    private var curvesIndex = 0
    
    @IBAction func forceSliderChanged() {
        
    }
    
    @IBAction func durationSliderChanged() {
        
    }
    
    @IBAction func delaySliderChanged() {
        
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension SpringAnimationViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        component == 0 ? animations.count : animationCurves.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        component == 0 ? animations[row].rawValue : animationCurves[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            animationIndex = row
//            animateView()
        default:
            curvesIndex = row
//            animateView()
        }
    }
}
