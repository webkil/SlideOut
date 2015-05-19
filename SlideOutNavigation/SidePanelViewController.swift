//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by webkiller on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import CoreData

@objc
protocol SidePanelViewControllerDelegate {
    func menuSelected(motos: MotoEntities)
}

class SidePanelViewController: UIViewController {
  
    @IBOutlet var marqueProfilLabel: UILabel!
    @IBOutlet var modelProfilLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var profilImage: UIImageView!
    
    var delegate: SidePanelViewControllerDelegate?
  
<<<<<<< HEAD
    let motos:[NSManagedObject] = []
    
=======
    var menus: Array<Menu>!
  
>>>>>>> origin/master
  struct TableView {
    struct CellIdentifiers {
      static let MenuCell = "MenuCell"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
<<<<<<< HEAD
    let motos = loadMoto() as[NSManagedObject]
    
    tableView.reloadData()
    
    let indexPathDefault = NSIndexPath(forRow: 0, inSection: 0)
    tableView.selectRowAtIndexPath(indexPathDefault , animated: true,  scrollPosition: UITableViewScrollPosition.None)
=======
    tableView.reloadData()
    let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    tableView.selectRowAtIndexPath(indexPath , animated: true,  scrollPosition: UITableViewScrollPosition.None)
>>>>>>> origin/master
    
    let selectedDefaultMoto : MotoEntities = motos[0] as! MotoEntities
    
<<<<<<< HEAD
    profilImage.image = selectedDefaultMoto.imagemoto as! UIImage
    marqueProfilLabel.text = selectedDefaultMoto.marquemoto
    modelProfilLabel.text = selectedDefaultMoto.modelmoto
=======
    profilImage.image = selectedDefaultMoto.image
    marqueProfilLabel.text = selectedDefaultMoto.title
    modelProfilLabel.text = selectedDefaultMoto.creator
>>>>>>> origin/master
    
    profilImage.layer.masksToBounds = true
    profilImage.layer.borderColor = UIColor.whiteColor().CGColor
    profilImage.layer.cornerRadius = profilImage.frame.size.height/2
    
    profilImage.layer.borderWidth = 2
    profilImage.frame.origin.x = 20
    
  }
<<<<<<< HEAD
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2//motos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.MenuCell, forIndexPath: indexPath) as! MenuCell
        cell.configureForMenu(motos[indexPath.row] as! MotoEntities)
        return cell
    }

    func loadMoto() -> [NSManagedObject] {
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    
    let fetchRequest = NSFetchRequest(entityName:"MotoEntities")
    
    var error: NSError?
    
    let fetchedResults =
    managedObjectContext!.executeFetchRequest(fetchRequest,
        error: &error) as? [NSManagedObject]
    
    return fetchedResults!
    
}

=======
>>>>>>> origin/master
  
}



// MARK: Table View Data Source

//extension SidePanelViewController: UITableViewDataSource {
//  
//    
//}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
<<<<<<< HEAD
    let selectedMoto:MotoEntities = motos[indexPath.row] as! MotoEntities
    //profilImage.image = selectedMoto.imagemoto as! UIImage

    marqueProfilLabel.text = selectedMoto.marquemoto
    modelProfilLabel.text = selectedMoto.modelmoto
    
=======
    let selectedMoto = menus[indexPath.row]
    profilImage.image = selectedMoto.image
    marqueProfilLabel.text = selectedMoto.title
    modelProfilLabel.text = selectedMoto.creator
>>>>>>> origin/master
    delegate?.menuSelected(selectedMoto)
    
  }
  
}

class MenuCell: UITableViewCell {
  
  @IBOutlet var imageMotoView: UIImageView!
  @IBOutlet var marqueMotoLabel: UILabel!
  @IBOutlet var modeleMotoLabel: UILabel!
  
    
<<<<<<< HEAD
    func configureForMenu(test: MotoEntities) {
    imageMotoView.image = test.imagemoto as! UIImage
    marqueMotoLabel.text = test.marquemoto
    modeleMotoLabel.text = test.modelmoto
=======
    func configureForMenu(menu: Menu) {
    imageMotoView.image = menu.image
    marqueMotoLabel.text = menu.title
    modeleMotoLabel.text = menu.creator
>>>>>>> origin/master
      
//    imageMotoView.layer.cornerRadius = imageMotoView.layer.frame.size.width/2
//    imageMotoView.layer.masksToBounds = true
//    imageMotoView.layer.borderWidth = 1.0
//    imageMotoView.layer.borderColor = UIColor.whiteColor().CGColor
//    
  }
  
}