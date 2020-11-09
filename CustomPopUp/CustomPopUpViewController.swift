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
    @IBOutlet weak var viewMySiteBtn: UIButton!
    @IBOutlet weak var viewCanadaSite: UIButton!
    
    var visitButtonCompletionClosure: (() -> Void)?
    var popUpDelgate : PopupDelgate?
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
    @IBAction func viewMySite(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        //delegate event run, ViewController is reciver. This method is sender.
        popUpDelgate?.onTappedViewMySite()
    }
    @IBAction func viewCanadaSite(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 30
        visitBtn.layer.cornerRadius = 10
        viewMySiteBtn.layer.cornerRadius = 10
        viewCanadaSite.layer.cornerRadius = 10
    }
    
}
