//
//  NewMotoViewController.swift
//  SlideOutNavigation
//
//  Created by Macmini_Dagon on 13.05.15.
//  Copyright (c) 2015 James Frost. All rights reserved.
//

import UIKit
import CoreData

class NewMotoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var MarqueTextField: UITextField!
    @IBOutlet var ModelTextField: UITextField!
    @IBOutlet var CylindréeTextField: UITextField!
    @IBOutlet var KilometrageTextField: UITextField!
    @IBOutlet var AnneeTextField: UITextField!
    @IBOutlet var MotoImageView: UIImageView!
    
    
    var imagechangee = false
    
    
    
    //Declaration du MARK: managedObjectContext
    
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    
   // let fetchRequest = NSFetchRequest(entityName: "MotoEntities")
    
  //  if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [MotoEntities]{
        
        //  nombre de resultats dans la base de donnees
    //    println(fetchResults.count)
        
        // let alert = UIAlertController(title: fetchResults[0].nom, message: fetchResults[0].nom, preferredStyle: .Alert)
        
        //   self.presentViewController(alert, animated: true, completion: nil)}
    

    
    
    @IBAction func SaveAction(sender: AnyObject){
        
    
        //Declaration du moc
        let moc = self.managedObjectContext
        
        
         //Ajout en base de données des champs saisis
        
            
        MotoEntities.createInManagedObjectContext(moc!, marque: MarqueTextField.text,model: ModelTextField.text,
         cylindree: CylindréeTextField.text,
            annee: AnneeTextField.text, kilometrage: KilometrageTextField.text)

       
    }


    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Remplir le champ avec une String
        
        MarqueTextField.text  = ""
        ModelTextField.text = ""
        CylindréeTextField.text = ""
        KilometrageTextField.text = ""
        AnneeTextField.text = ""
        

        //pour le clique sur la photo
        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "chooseImage:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        MotoImageView.addGestureRecognizer(tapGestureRecognizer)
        MotoImageView.userInteractionEnabled = true
        
    }
    
    
    
    
    
    //Fonction presser
    func longPress(sender:UILongPressGestureRecognizer!) {
        
           if (sender.state == UIGestureRecognizerState.Ended) {
        println("Long press Ended");
         } else if (sender.state == UIGestureRecognizerState.Began) {
                 println("Long press detected.");
         }
    }
    
    //Pour choix image
    
    
    func chooseImage(recognizer:UITapGestureRecognizer){
      
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        //Loguer si l'image a changé
        imagechangee = true
        
    }
    
    
    //Pour la taille de l'image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
        
        // small picture
        let smallPicture = scaleImageWith(pickedImage,
            
            // Taille de l'image actuelle
            newSize: CGSizeMake(343, 128))
        
        var sizeOfImageView:CGRect = MotoImageView.frame
        sizeOfImageView.size = smallPicture.size
        MotoImageView.frame = sizeOfImageView
        
        MotoImageView.image = smallPicture
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //Si le choix l'image a été annulé
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        //on dit que l'image n'a pas été changée
        imagechangee = false
    }
    
    
    
    func scaleImageWith(image:UIImage, newSize:CGSize)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imagechangee = true
        return newImage
        
    }
    
    //Fin du choix de l'image

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
