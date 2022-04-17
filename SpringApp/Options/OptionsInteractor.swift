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
    func doSomething(request: Options.Something.Request)
}

protocol OptionsDataStore {
    
}

class OptionsInteractor: OptionsBusinessLogic, OptionsDataStore {
    
    var presenter: OptionsPresentationLogic?
    var worker: OptionsWorker?
    
    func doSomething(request: Options.Something.Request) {
        worker = OptionsWorker()
        worker?.doSomeWork()
        
        let response = Options.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
