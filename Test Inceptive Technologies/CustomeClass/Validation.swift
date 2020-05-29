//
//  Validation.swift
//  Test Inceptive Technologies
//
//  Created by Mac on 29/05/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit


extension String{
    var isValidPhoneNo:Bool{
        do{
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let response = matches.first{
                return response.resultType == .phoneNumber && response.range.location == 0 && response.range.length == self.count && self.count == 10
            }else{
                return false
            }
        }catch{
            return false
        }
    }
    
    var isNameValid :Bool{
        let Name = NSPredicate(format: "SELF MATCHES %@", "^[A-za-z]{1,15}")
        return Name.evaluate(with: self)
    }
    var isValidPassword : Bool{
        
        /// Requires Special Character
       // let Password = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        let Password = NSPredicate(format:  "SELF MATCHES %@", "^[A-za-z0-9]{8,}")
        return Password.evaluate(with: self)
    }
    
    var isValidEmail : Bool{
        let Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,3}"
        let TestEmail = NSPredicate(format: "SELF MATCHES %@", Email)
        return TestEmail.evaluate(with: self)
    }
}


extension ViewController{
    func ShowImage(textfield : UITextField) {
        textfield.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 12))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        let image = UIImage(named: "dn")
        imageView.image = image
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 28, height: 18))
        rightView.addSubview(imageView)
        rightView.contentMode = UIView.ContentMode.left
        rightView.isUserInteractionEnabled = false
        textfield.rightView = rightView
    }
    
    
    func Alert(Title : String){
        let alert = UIAlertController(title: Title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        // alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let charsLimit = 10
        
        let startingLength = textField.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace =  range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= charsLimit
    }
    
}
//class txtFieldImage:UITextField{
//    // Programmatic Initialization
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        // Add custom code here
//        // We don't need to call our fun here cause this for programmatic created UIView object
//    }
//    // Story Board Initialization
//    required init?(coder aDecorder: NSCoder) {
//        super.init(coder: aDecorder)
//        // Add custom code here
//        invalidate()
//    }
//    
//    func invalidate() {
//        self.rightViewMode = UITextField.ViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 12))
//        imageView.contentMode = UIView.ContentMode.scaleAspectFit
//        let image = UIImage(named: "dn")
//        imageView.image = image
//        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 28, height: 18))
//        rightView.addSubview(imageView)
//        rightView.contentMode = UIView.ContentMode.left
//        rightView.isUserInteractionEnabled = false
//        self.rightView = rightView
//    }
//}



