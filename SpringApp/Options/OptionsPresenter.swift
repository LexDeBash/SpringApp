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
    func presentSomething(response: OptionsResponse)
}

class OptionsPresenter: OptionsPresentationLogic {
    
    weak var viewController: OptionsDisplayLogic?
    
    func presentSomething(response: OptionsResponse) {
//        let viewModel = Options.Animate.ViewModel()
//        viewController?.displaySomething(viewModel: viewModel)
    }
}
