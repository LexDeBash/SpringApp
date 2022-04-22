//
//  SpringViewController.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//

import UIKit
import SpringAnimation

protocol SpringDisplayLogic: AnyObject {
    func displayAnimation(viewModel: SpringViewModel)
    func displayTransformation(viewModel: TransformViewModel)
}

class SpringViewController: UIViewController {
    
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var delaySlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var forceSlider: UISlider!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var springView: SpringView!
    
    var interactor: SpringBusinessLogic?
    var router: (NSObjectProtocol & SpringRoutingLogic & SpringDataPassing)?
    
    private var request = SpringRequest()
    
    private let animations = AnimationPreset.allCases.map { $0.rawValue }
    private let curves = AnimationCurve.allCases.map { $0.rawValue }
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        view.addGestureRecognizer(tapGesture)
        interactor?.didTapView(request: request)
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
    
    @IBAction func codeButtonPressed() {
        router?.routeToCode()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case forceSlider:
            request.forceSliderValue = forceSlider.value
            interactor?.forceSliderDidChanged(request: request)
        case durationSlider:
            request.durationSliderValue = durationSlider.value
            interactor?.durationSliderDidChanged(request: request)
        default:
            request.delaySliderValue = delaySlider.value
            interactor?.delaySliderDidChanged(request: request)
            
        }
    }
    
    @IBAction func transformSpringView() {
        let request = TransformRequest(viewSize: springView.frame.height)
        interactor?.transformSpringViewButtonDidTapped(request: request)
    }
    
    @objc private func tapAction() {
        interactor?.didTapView(request: request)
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
        router.springVC = viewController
        router.dataStore = interactor
    }
}

extension SpringViewController: SpringDisplayLogic {
    func displayAnimation(viewModel: SpringViewModel) {
        forceLabel.text = viewModel.forceText
        durationLabel.text = viewModel.durationText
        delayLabel.text = viewModel.delayText
        
        let animationIndex = animations.firstIndex(of: viewModel.animation) ?? 0
        let curveIndex = curves.firstIndex(of: viewModel.curve) ?? 0
        pickerView.selectRow(animationIndex, inComponent: 0, animated: false)
        pickerView.selectRow(curveIndex, inComponent: 1, animated: false)
        
        springView.animation = viewModel.animation
        springView.curve = viewModel.curve
        springView.force = viewModel.force
        springView.duration = viewModel.duration
        springView.delay = viewModel.delay
        springView.damping = viewModel.damping
        springView.velocity = viewModel.velocity
        springView.scaleX = viewModel.scale
        springView.scaleY = viewModel.scale
        springView.x = viewModel.x
        springView.y = viewModel.y
        springView.rotate = viewModel.rotate
        springView.animate()
    }
    
    func displayTransformation(viewModel: TransformViewModel) {
        springView.layer.cornerRadius = viewModel.cornerRadius
        springView.layer.add(viewModel.animation, forKey: viewModel.key)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension SpringViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        component == 0 ? animations.count : curves.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        component == 0 ? animations[row] : curves[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            request.rowIndex = row
            interactor?.didSelectAnimationRow(request: request)
        default:
            request.rowIndex = row
            interactor?.didSelectCurveRow(request: request)
        }
    }
}
