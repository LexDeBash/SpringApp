//
//  SpringRouter.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SpringRoutingLogic {
    func routeToOptions(segue: UIStoryboardSegue?)
}

protocol SpringDataPassing {
    var dataStore: SpringDataStore? { get }
}

class SpringRouter: NSObject, SpringRoutingLogic, SpringDataPassing {
    
    weak var springVC: SpringViewController?
    var dataStore: SpringDataStore?
    
    // MARK: Routing
    func routeToOptions(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! OptionsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToOptions(source: dataStore!, destination: &destinationDS)
            destinationVC.delegate = springVC
            destinationDS.delegate = dataStore
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "OptionsViewController") as! OptionsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToOptions(source: dataStore!, destination: &destinationDS)
            navigateToOptions(source: springVC!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func navigateToOptions(source: SpringViewController, destination: OptionsViewController) {
        guard let sheetView = destination.sheetPresentationController else { return }
        sheetView.detents = [.medium()]
        source.present(destination, animated: true)
    }
    
    // MARK: Passing data
    func passDataToOptions(source: SpringDataStore, destination: inout OptionsDataStore) {
        destination.animation = source.animation
    }
}
