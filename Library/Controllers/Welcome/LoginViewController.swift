//
//  LoginViewController.swift
//  Library
//
//  Created by Paco Lee on 2018-03-25.
//  Copyright © 2018 Paco Lee. All rights reserved.
//

import UIKit
enum UserType {
    case member
    case employee
}

class LoginViewController: UIViewController {
    static let identifier = "LoginViewController"
    var userType: UserType!

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(with userType: UserType) {
        self.userType = userType
        
        if userType == .member {
            navigationController?.title = "Member Login"
        } else {
            navigationController?.title = "Employee Login"
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: RegisterViewController.identifier) as! RegisterViewController
        vc.setup(with: userType)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        var vc: UIViewController!
        
        if userType == .member {
            vc = UIStoryboard.init(name: "Member", bundle: nil).instantiateInitialViewController()
        } else {
            vc = UIStoryboard.init(name: "Employee", bundle: nil).instantiateInitialViewController()
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
    
    
}