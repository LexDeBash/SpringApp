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

protocol SpringBusinessLogic {
    func doSomething(request: Spring.Animation.Request)
}

protocol SpringDataStore {
    
}

class SpringInteractor: SpringBusinessLogic, SpringDataStore {
    
    var presenter: SpringPresentationLogic?
    var worker: SpringWorker?
    
    func doSomething(request: Spring.Animation.Request) {
        worker = SpringWorker()
        worker?.doSomeWork()
        
        let response = Spring.Animation.Response()
        presenter?.presentSomething(response: response)
    }
}