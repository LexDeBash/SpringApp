//
//  SpringViewController.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//

import UIKit
import SpringAnimation

protocol SpringDisplayLogic: AnyObject {
    func displaySomething(viewModel: Spring.Animation.ViewModel)
}

class SpringViewController: UIViewController {
    
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var delaySlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var forceSlider: UISlider!
    @IBOutlet var springView: SpringView!
    
    var interactor: SpringBusinessLogic?
    var router: (NSObjectProtocol & SpringRoutingLogic & SpringDataPassing)?
    
    private let animations = AnimationPreset.allCases
    private let animationCurves = AnimationCurve.allCases
    
    private var animationIndex = 0
    private var curvesIndex = 0
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    @IBAction func forceSliderChanged() {
        
    }
    
    @IBAction func durationSliderChanged() {
        
    }
    
    @IBAction func delaySliderChanged() {
        
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = SpringInteractor()
        let presenter = SpringPresenter()
        let router = SpringRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension SpringViewController: SpringDisplayLogic {
    func displaySomething(viewModel: Spring.Animation.ViewModel) {
        
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension SpringViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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
