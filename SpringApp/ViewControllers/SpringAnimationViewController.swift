//
//  SpringAnimationViewController.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//

import UIKit
import SpringAnimation

protocol SpringAnimationDisplayLogic: AnyObject {
    func displaySomething(viewModel: SpringAnimation.Something.ViewModel)
}

class SpringAnimationViewController: UIViewController {
    
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var delaySlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var forceSlider: UISlider!
    @IBOutlet var springView: SpringView!
    
    var interactor: SpringAnimationBusinessLogic?
    var router: (NSObjectProtocol & SpringAnimationRoutingLogic & SpringAnimationDataPassing)?
    
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
        let interactor = SpringAnimationInteractor()
        let presenter = SpringAnimationPresenter()
        let router = SpringAnimationRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension SpringAnimationViewController: SpringAnimationDisplayLogic {
    func displaySomething(viewModel: SpringAnimation.Something.ViewModel) {
        
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
