//
//  HeroeViewController.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 06/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import UIKit

class HeroeViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var heroe: APICharacter?{
        didSet{
            //refreshUI()
            viewDidLoad()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view.
    }
    
    func refreshUI(){
        
        if let he = heroe{
            self.navigationItem.title = he.name
            if he.descriptionString != nil && descriptionTextView != nil{
                descriptionTextView.text = he.descriptionString
            }
            let ruta: String = he.thumbnail.path + "." + he.thumbnail.extensionString
            if photoImageView != nil{
                let url:NSURL = NSURL(string: ruta)!
                do{
                    let data:NSData = try NSData(contentsOf: url as URL)

                    photoImageView.image = UIImage(data: data as Data)
                }catch{
                    photoImageView.image = nil
                }
            }
        }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HeroeViewController: HeroeDelegate{
    func sendHeroe(newHeroe: APICharacter){
        heroe = newHeroe
    }
}
