//
//  PlanetViewController.swift
//  SpaceRace
//
//  Created by fernando rosa on 22/11/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LevelsTableViewCellDelegate {
    
    var planet:Planet!
    var levelForRow:Int = 3
    var totalRows = -1
    var totalLevels:Int = 0
    var selectedLevel:Int!
     
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.self.navigationItem.title = planet.name.uppercased()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.totalLevels = self.planet.levels.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            let rows = Int(self.planet.levels.count/3) + (self.planet.levels.count%3 > 0 ? 1 : 0)
            self.totalRows = rows
            return rows
        }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if(indexPath.section == 0){
             let cell = tableView.dequeueReusableCell(withIdentifier: "introCell") as! PlanetFirstTableViewCell
            cell.planetImage.image = UIImage(named: self.planet.image)
            cell.planetDescriptionLabel.text = self.planet.description
             return cell
         }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "levelsCell") as! LevelsTableViewCell
            let start = (indexPath.row * self.levelForRow)
            let end = (indexPath.row + 1) < self.totalRows ? (start + 3) : (self.totalLevels)
            cell.initCell(levels: Array(self.planet.levels[start...(end-1)]))
            cell.delegate = self
            return cell
         }
     }
    
    func levelButtonPressed(level: Int) {
        print(level)
        self.selectedLevel = level-1
        self.performSegue(withIdentifier: "goToGame", sender: self)
    }
    
     // MARK: - Navigation

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToGame"){
               let nextViewController = segue.destination as! GameViewController
               nextViewController.selectedLevel = self.planet.levels[selectedLevel]
           }
       }

}
