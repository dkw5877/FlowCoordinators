//
//  Theme.swift
//  FlowCoordinators
//
//  Created by user on 4/16/19.
//  Copyright © 2019 someCompanyNameHere. All rights reserved.
//

import Foundation
import UIKit.UIColor

class Theme {
    
    static var mainColor:UIColor {
        return UIColor(red: 65/255, green: 102/255, blue: 156/255, alpha: 1.0)
    }
    
    static var accentColor:UIColor {
        return UIColor(red: 92/255, green: 132/255, blue: 178/255, alpha: 1.0)
    }
    
    static var blue:UIColor {
        return UIColor(red: 81/255, green: 123/255, blue: 169/255, alpha: 1.0)
    }
    
    static var midnight:UIColor {
        return UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1.0)
    }
    
    static var white:UIColor {
        return UIColor(white: 0.9, alpha: 1.0)
    }
    
    static var barStyle: UIBarStyle {
        return .default
    }
    
    class func apply() {
        
        // MARK: UINavigationBar
        UINavigationBar.appearance().barStyle = barStyle
        UINavigationBar.appearance().tintColor = white
        UINavigationBar.appearance().barTintColor = accentColor
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // MARK: UIToolbar
        UIToolbar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).barTintColor = accentColor
        UIToolbar.appearance().barTintColor = accentColor
        UIToolbar.appearance().tintColor = white
    }
}
