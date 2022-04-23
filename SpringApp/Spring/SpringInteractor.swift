//
//  SpringInteractor.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import SpringAnimation

protocol SpringBusinessLogic {
    func viewDidLoad()
    func didTapView()
    func setViewSize(request: TransformRequest)
    func didSelectAnimationRow(request: SpringRequest)
    func didSelectCurveRow(request: SpringRequest)
    func forceSliderDidChanged(request: SpringRequest)
    func durationSliderDidChanged(request: SpringRequest)
    func delaySliderDidChanged(request: SpringRequest)
    func transformSpringViewButtonDidTapped()
}

protocol SpringDataStore {
    var animation: Animation? { get set }
    var animationList: [String] { get }
    var curveList: [String] { get }
    var viewHeight: Double { get }
    var isCircle: Bool { get }
}

class SpringInteractor: SpringBusinessLogic, SpringDataStore {
    
    var presenter: SpringPresentationLogic?
    var animation: Animation?
    var animationList = AnimationPreset.allCases.map { $0.rawValue }
    var curveList = AnimationCurve.allCases.map { $0.rawValue }
    var viewHeight: Double = 0
    var isCircle = false
    
    private var response: SpringResponse {
        SpringResponse(animation: animation ?? Animation())
    }
    
    func viewDidLoad() {
        animation = Animation()
        var response = SpringResponse(animation: animation ?? Animation())
        response.animationList = animationList
        response.curveList = curveList
        presenter?.setAnimation(response: response)
    }
    
    func setViewSize(request: TransformRequest) {
        viewHeight = request.viewSize
    }
    
    func didTapView() {
        presenter?.presentAnimation(response: response)
    }
    
    func didSelectAnimationRow(request: SpringRequest) {
        animation?.title = animationList[request.rowIndex]
        presenter?.presentAnimation(response: response)
    }
    
    func didSelectCurveRow(request: SpringRequest) {
        animation?.curve = curveList[request.rowIndex]
        presenter?.presentAnimation(response: response)
    }
    
    func forceSliderDidChanged(request: SpringRequest) {
        animation?.force = Double(request.forceSliderValue)
        presenter?.presentAnimation(response: response)
    }
    
    func durationSliderDidChanged(request: SpringRequest) {
        animation?.duration = Double(request.durationSliderValue)
        presenter?.presentAnimation(response: response)
    }
    
    func delaySliderDidChanged(request: SpringRequest) {
        animation?.delay = Double(request.delaySliderValue)
        presenter?.presentAnimation(response: response)
    }
    
    func transformSpringViewButtonDidTapped() {
        isCircle.toggle()
        let halfSize = viewHeight / 2
        let cornerRadius = isCircle ? halfSize : 10
        
        let response = TransformResponse(
            keyPath: "cornerRadius",
            fromValue: isCircle ? 10 : halfSize,
            toValue: cornerRadius,
            duration: 0.2
        )
        presenter?.presentTransformation(response: response)
    }
}
