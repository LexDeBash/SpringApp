//
//  SpringPresenter.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol SpringPresentationLogic {
    func presentAnimation(response: SpringResponse)
}

class SpringPresenter: SpringPresentationLogic {
    
    weak var viewController: SpringDisplayLogic?
    
    func presentAnimation(response: SpringResponse) {
        let viewModel = SpringViewModel(
            animation: response.animation.name,
            curve: response.animation.curve,
            force: response.animation.force,
            duration: response.animation.duration,
            delay: response.animation.delay,
            damping: response.animation.damping,
            velocity: response.animation.velocity,
            scale: response.animation.scale,
            x: response.animation.x,
            y: response.animation.y,
            rotate: response.animation.rotate,
            forceText: String(format: "Force: %.1f", response.animation.force),
            durationText: String(format: "Duration: %.1f", response.animation.duration),
            delayText: String(format: "Delay: %.1f", response.animation.delay)
        )
        viewController?.displayAnimation(viewModel: viewModel)
    }
}
