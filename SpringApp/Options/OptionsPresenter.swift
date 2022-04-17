//
//  OptionsPresenter.swift
//  SpringApp
//
//  Created by Alexey Efimov on 17.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol OptionsPresentationLogic {
    func presentOptions(response: OptionsResponse)
}

class OptionsPresenter: OptionsPresentationLogic {
    
    weak var viewController: OptionsDisplayLogic?
    
    func presentOptions(response: OptionsResponse) {
        let viewModel = OptionsViewModel(
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
            delayText: String(format: "Delay: %.1f", response.animation.delay),
            dampingText: String(format: "Damping: %.1f", response.animation.damping),
            velocityText: String(format: "Velocity: %.1f", response.animation.velocity),
            scaleText: String(format: "Scale: %.1f", response.animation.scale),
            xText: String(format: "x: %.1f", response.animation.x),
            yText: String(format: "y: %.1f", response.animation.y),
            rotateText: String(format: "Rotate: %.1f", response.animation.rotate)
        )
        viewController?.displayOptions(viewModel: viewModel)
    }
}
