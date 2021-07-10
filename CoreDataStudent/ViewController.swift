//
//  ViewController.swift
//  CoreDataStudent
//
//  Created by Kevin on 08/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let mybuttonAdmin:UIButton = {
            let button = UIButton()
            button.setTitle("Admin Login", for: .normal)
            button.addTarget(self, action: #selector(AdminloginTapped), for: .touchUpInside)
            button.backgroundColor = .systemGreen
            button.layer.cornerRadius = 6
            return button
        }()
    
    private let mybuttonStud:UIButton = {
            let button = UIButton()
            button.setTitle("Student Login", for: .normal)
            button.addTarget(self, action: #selector(StudloginTapped), for: .touchUpInside)
            button.backgroundColor = .systemGreen
            button.layer.cornerRadius = 6
            return button
        }()
    
    @objc private func AdminloginTapped()
    {
        let vc = AdminLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func StudloginTapped()
    {
        let vc = StudLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "Student Management System"
       
        view.addSubview(mybuttonAdmin)
        view.addSubview(mybuttonStud)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pic1")!)
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            let vw=view.frame.width
            mybuttonAdmin.frame = CGRect(x: 40, y: 180, width: vw - 80, height: 50)
            mybuttonStud.frame = CGRect(x: 40, y: 250, width: vw - 80, height: 50)
            
            
        }

    
}

