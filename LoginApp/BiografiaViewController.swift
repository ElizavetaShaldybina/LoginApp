//
//  BiografiaViewController.swift
//  LoginApp
//
//  Created by Елизавета Шалдыбина on 11.10.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import UIKit

class BiografiaViewController: UIViewController {
    @IBOutlet weak var mineBiography: UILabel!
    
    var userThree: User!
    
    private let primaryColor = UIColor(
        red: 69/255,
        green: 50/255,
        blue: 46/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 188/255,
        green: 152/255,
        blue: 126/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mineBiography.text = userThree.biography
        
        self.title = "\(userThree.answers.name) \(userThree.answers.surname)"
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? NoewInformationViewController else { return }
        settingsVC.userFour = userThree
    }
}
