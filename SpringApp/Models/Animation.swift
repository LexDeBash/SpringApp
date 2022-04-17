//
//  Animation.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//

import Foundation

struct Animation {
    var name = "slideLeft"
    var curve = "easeIn"
    var force = 1.0
    var duration = 1.0
    var delay = 0.0
    
    var damping = 0.7
    var velocity = 0.7
    var scale = 1.0
    var x = 0.0
    var y = 0.0
    var rotate = 0.0
}
