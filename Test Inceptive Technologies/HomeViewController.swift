//
//  HomeViewController.swift
//  Test Inceptive Technologies
//
//  Created by Mac on 29/05/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    @IBOutlet weak var lblHii: UILabel!
    var name = ""
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var menu : SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu = SideMenuNavigationController(rootViewController: MenuTable())
        menu?.leftSide = true
        menu?.statusBarEndAlpha = 0
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        lblHii.text = "Hi, " + "\(name)" + " you are logged in!"
        // Do any additional setup after loading the view.
    }
    @IBAction func btnMenuPressed(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    @IBAction func btnLogoutPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}





class MenuTable: UITableViewController {
    
    var DataArray = ["About Us","Contact Us"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView(frame: CGRect.zero)
       
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = DataArray[indexPath.row]
        return cell
    }

}
