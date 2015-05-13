//
//  Animal.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

@objc
class Menu {
  
  let title: String
  let creator: String
  let image: UIImage?
  
  init(title: String, creator: String, image: UIImage?) {
    self.title = title
    self.creator = creator
    self.image = image
  }
  
  class func allMenuItem() -> Array<Menu> {
    return [ Menu(title: "Honda", creator: "CB1000R", image: UIImage(named: "honda_cb1000r.jpg")),
      Menu(title: "Piaggio", creator: "Vespa GT 200", image: UIImage(named: "piaggio_vespagt200.jpg")),
      Menu(title: "Yamaha", creator: "R1", image: UIImage(named: "yamaha_r1.jpg"))]
  }
  
 }