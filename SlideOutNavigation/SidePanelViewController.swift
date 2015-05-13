//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by webkiller on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

@objc
protocol SidePanelViewControllerDelegate {
  func menuSelected(menu: Menu)
}

class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var profilImage: UIImageView!
  
  var menus: Array<Menu>!
  
  struct TableView {
    struct CellIdentifiers {
      static let MenuCell = "MenuCell"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.reloadData()
    
    profilImage.image = UIImage(named: "honda_cb1000r.jpg")
    profilImage.layer.masksToBounds = true
    profilImage.layer.borderColor = UIColor.whiteColor().CGColor
    profilImage.layer.cornerRadius = profilImage.frame.size.height/2
    
    profilImage.layer.borderWidth = 2
    profilImage.frame.origin.x = 20
    
  }
  
}

// MARK: Table View Data Source

extension SidePanelViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menus.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.MenuCell, forIndexPath: indexPath) as! MenuCell
    cell.configureForMenu(menus[indexPath.row])
    return cell
  }
  
}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
  }
  
}

class MenuCell: UITableViewCell {
  
  @IBOutlet var imageMotoView: UIImageView!
  @IBOutlet var marqueMotoLabel: UILabel!
  @IBOutlet var modeleMotoLabel: UILabel!
  
    
    func configureForMenu(menu: Menu) {
    imageMotoView.image = menu.image
    marqueMotoLabel.text = menu.title
    modeleMotoLabel.text = menu.creator
      
    imageMotoView.layer.cornerRadius = imageMotoView.layer.frame.size.width/2
    imageMotoView.layer.masksToBounds = true
    imageMotoView.layer.borderWidth = 1.0
    imageMotoView.layer.borderColor = UIColor.redColor().CGColor
    
  }
  
}