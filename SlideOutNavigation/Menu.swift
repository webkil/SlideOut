//
//  Animal.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import CoreData

@objc
class Menu {
  
  let title: String
  let subtitle: String
  let image: UIImage?
  
  init(title: String, subtitle: String, image: UIImage?) {
    self.title = title
    self.subtitle = subtitle
    self.image = image
  }
  
  class func allMenuItem() -> Array<Menu> {
    return [ Menu(title: "Honda", subtitle: "CB1000R", image: UIImage(named: "honda_cb1000r.jpg")),
      Menu(title: "Piaggio", subtitle: "Vespa GT 200", image: UIImage(named: "piaggio_vespagt200.jpg")),
      Menu(title: "Yamaha", subtitle: "R1", image: UIImage(named: "yamaha_r1.jpg"))]
  }
  
 }