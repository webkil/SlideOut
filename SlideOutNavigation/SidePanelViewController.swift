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
  
    @IBOutlet var marqueProfilLabel: UILabel!
    @IBOutlet var modelProfilLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var profilImage: UIImageView!
    
    var delegate: SidePanelViewControllerDelegate?
  
    var menus: Array<Menu>!
  
  struct TableView {
    struct CellIdentifiers {
      static let MenuCell = "MenuCell"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.reloadData()
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    tableView.selectRowAtIndexPath(indexPath , animated: true,  scrollPosition: UITableViewScrollPosition.None)
    
    let selectedDefaultMoto = menus[indexPath.row]
    
    profilImage.image = selectedDefaultMoto.image
    marqueProfilLabel.text = selectedDefaultMoto.title
    modelProfilLabel.text = selectedDefaultMoto.creator
    
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
    
    let selectedMoto = menus[indexPath.row]
    profilImage.image = selectedMoto.image
    marqueProfilLabel.text = selectedMoto.title
    modelProfilLabel.text = selectedMoto.creator
    delegate?.menuSelected(selectedMoto)
    
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
    imageMotoView.layer.borderColor = UIColor.whiteColor().CGColor
    
  }
  
}