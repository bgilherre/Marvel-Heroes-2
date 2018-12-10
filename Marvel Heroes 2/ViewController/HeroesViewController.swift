//
//  ViewController.swift
//  Marvel Heroes 2
//
//  Created by Borja Gil Herrero on 04/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import UIKit

protocol HeroeDelegate: class{
    func sendHeroe(newHeroe: APICharacter)
}
class HeroesViewController: UIViewController {

    var refreshControl = UIRefreshControl()
    
    weak var delegate: HeroeDelegate?

    @IBOutlet weak var tableView: UITableView!
    
    var heroes: [APICharacter] = [APICharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(sender:AnyObject) {
        
        DataCall.giveCharacters(completion: {
            results in
            self.heroes = results
            DispatchQueue.main.async {

                self.tableView.reloadData()
                self.refreshControl.endRefreshing()

            }
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterSegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow{
            //let cell = tableView.cellForRow(at: indexPath ) as! HeroeTableViewCell
                let destination = segue.destination as! HeroeViewController
            
                //destination.heroe = heroes[indexPath.row]
                self.delegate = destination
                destination.sendHeroe(newHeroe: heroes[indexPath.row])
            }
        }
    }

}
// MARK: - Table View DataSource
extension HeroesViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeCell", for: indexPath as IndexPath) as? HeroeTableViewCell{
            
            let heroe = heroes[indexPath.row]
            cell.nombreLabel.text = heroe.name
            
            let ruta: String = heroe.thumbnail.path + "." + heroe.thumbnail.extensionString
            
            let url:NSURL = NSURL(string: ruta)!
            do{
                let data:NSData = try NSData(contentsOf: url as URL)
                
                cell.fotoImageView.image = UIImage(data: data as Data)
            }catch{
                cell.fotoImageView.image = nil
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeCell", for: indexPath as IndexPath)
            return cell
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
}

// MARK: - Table View Delegate
extension HeroesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)!

        //performSegue(withIdentifier: "characterSegue", sender: self)
    }
}


