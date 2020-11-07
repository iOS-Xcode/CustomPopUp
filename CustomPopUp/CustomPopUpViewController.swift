//
//  CustomPopUpViewController.swift
//  CustomPopUp
//
//  Created by Seokhyun Kim on 2020-11-06.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var visitBtn: UIButton!
    
    var visitButtonCompletionClosure: (() -> Void)?
    
    @IBAction func tappedDismissButton(_ sender: UIButton) {
        print("tappedDismissButton")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tappedVisitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        //call completion block
        if let visitButtonCompletionClosure = visitButtonCompletionClosure {
            visitButtonCompletionClosure()
        }
        print("tappedVisitButton")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 30
        visitBtn.layer.cornerRadius = 10
    }
    
}
