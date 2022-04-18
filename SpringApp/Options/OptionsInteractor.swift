//
//  OptionsInteractor.swift
//  SpringApp
//
//  Created by Alexey Efimov on 17.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol OptionsBusinessLogic {
    func setOptions(request: OptionsRequest)
    func dampingSliderDidChanged(request: OptionsRequest)
    func velocitySliderDidChanged(request: OptionsRequest)
    func scaleSliderDidChanged(request: OptionsRequest)
    func xSliderDidChanged(request: OptionsRequest)
    func ySliderDidChanged(request: OptionsRequest)
    func rotateSliderDidChanged(request: OptionsRequest)
    func resetButtonPressed(request: OptionsRequest)
}

protocol OptionsDataStore {
    var animation: Animation? { get set }
    var delegate: SpringDataStore? { get set }
}

class OptionsInteractor: OptionsBusinessLogic, OptionsDataStore {
    
    var presenter: OptionsPresentationLogic?
    var worker: OptionsWorker?
    var animation: Animation?
    var delegate: SpringDataStore?
    
    private var response: OptionsResponse {
        OptionsResponse(animation: animation ?? Animation())
    }
    
    func setOptions(request: OptionsRequest) {
        presenter?.presentOptions(response: response)
        passDataToPresenter()
    }
    
    func dampingSliderDidChanged(request: OptionsRequest) {
        animation?.damping = Double(request.damping)
        passDataToPresenter()
    }
    
    func velocitySliderDidChanged(request: OptionsRequest) {
        animation?.velocity = Double(request.velocity)
        passDataToPresenter()
    }
    
    func scaleSliderDidChanged(request: OptionsRequest) {
        animation?.scale = Double(request.scale)
        passDataToPresenter()
    }
    
    func xSliderDidChanged(request: OptionsRequest) {
        animation?.x = Double(request.x)
        passDataToPresenter()
    }
    
    func ySliderDidChanged(request: OptionsRequest) {
        animation?.y = Double(request.y)
        passDataToPresenter()
    }
    
    func rotateSliderDidChanged(request: OptionsRequest) {
        animation?.rotate = Double(request.rotate)
        passDataToPresenter()
    }
    
    func resetButtonPressed(request: OptionsRequest) {
        self.animation = Animation()
        passDataToPresenter()
    }
    
    private func passDataToPresenter() {
        delegate?.animation = animation
        presenter?.presentOptions(response: response)
    }
}
