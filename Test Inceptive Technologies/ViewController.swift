//
//  ViewController.swift
//  Test Inceptive Technologies
//
//  Created by Mac on 29/05/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    
    @IBOutlet weak var txtFname: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtMobile: UITextField!
    
    @IBOutlet weak var txtState: APJTextPickerView!
    
    @IBOutlet weak var txtCity: APJTextPickerView!
    
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var txtConPass: UITextField!
    
    
    var states = ["Maharashtra"]
    var cities = ["Pune","Satara","Sangli"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    override func viewWillLayoutSubviews() {
        if txtState.text?.count == 0{
            txtCity.isUserInteractionEnabled = false
        }else{
            txtCity.isUserInteractionEnabled = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        txtState.tag = 1
        
        txtCity.tag = 2
        
        txtState.type = .strings
        txtState.dataSource = self
        txtState.pickerDelegate = self
      
        txtCity.type = .strings
        txtCity.dataSource = self
        txtCity.pickerDelegate = self
        ShowImage(textfield: txtState)
        ShowImage(textfield: txtCity)
        txtMobile.delegate = self
        
    }
    


    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        
        if (txtFname.text?.isNameValid)!{
           
            if (txtLname.text?.isNameValid)!{
                
                if (txtEmail.text?.isValidEmail)!{
                   
                    if (txtMobile.text?.isValidPhoneNo)!{
                      
                        if txtMobile.text?.count != 10
                        {
                            Alert(Title : "Mobile No. Should be 10 Digit")
                        }
                        if (txtState.text != ""){
                            
                            if (txtCity.text != ""){
                                
                                if (txtPass.text?.isValidPassword)!{
                                   
                                    if (txtPass.text == txtConPass.text){

                                         let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                        vc.name = txtFname.text! + " " + txtLname.text!
                                        self.navigationController?.pushViewController(vc, animated: true)

                                }else{
                                    Alert(Title : "Invalid txtConPass")
                                }
                            }else{
                                    if txtPass.text!.count < 8
                                    {
                                        Alert(Title : "Password Must be 8 Digit")
                                    }else{
                                         Alert(Title : "Invalid Passsword")
                                    }
                            }
                        }else{
                          Alert(Title : "Select City")
                        }
                    }else{
                       Alert(Title : "Select State")
                    }
                }else{
                  Alert(Title : "Invalid Mobile No")
                }
                }else{
                    
                    Alert(Title: "Invalid Email")
                 }
        }else{
            Alert(Title : "Invalid Last Name")
            }
    }
        else{
            Alert(Title : "Invalid First Name")
        }

   }
   

}


extension ViewController: APJTextPickerViewDelegate {
    
    
    func textPickerView(_ textPickerView: APJTextPickerView, didSelectString row: Int)
        
    {
        switch textPickerView.tag {
        case 1:
            let state = states[row]
            
            print(state)
        case 2: let city = cities[row]
        print(city)
        default:
            let city = cities[row]
        }
        
    }
    
    func textPickerView(_ textPickerView: APJTextPickerView, titleForRow row: Int) -> String?
        
    {
        switch textPickerView.tag {
        case 1:
            let state = states[row]
            return  state
        case 2:
            let city = cities[row]
            return  city
        default:
            return  "city"
        }
       
    }
}

extension ViewController: APJTextPickerViewDataSource
    
{
    func numberOfRows(in pickerView: APJTextPickerView) -> Int
    {
        switch pickerView.tag {
        case 1:
             return states.count
        case 2:
           
             return cities.count
        default:
            return  1
        }
        
    }
    
}
