//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Seokhyun Kim on 2020-11-06.
//

import UIKit
import WebKit

class ViewController: UIViewController, PopupDelgate {

    @IBOutlet weak var webView: WKWebView!
    @IBAction func showPopUp(_ sender: UIButton) {
        //get storyboard
        let storyboard = UIStoryboard.init(name: "Popup", bundle: nil)
        //get viewcontroller via stroyboard
        let alertPopupVC = storyboard.instantiateViewController(withIdentifier: "CPVC") as! CustomPopUpViewController
        //Popup effect(showing style)
        alertPopupVC.modalPresentationStyle = .overCurrentContext
        //disappear style
        alertPopupVC.modalTransitionStyle = .crossDissolve
        
        //When complectionBlock of visitButtonCompletionClosure in CustomPopViewController, it will execute.
        //void and optional closure which is visitButtonCompletionClosure in CustomPopViewController, will execute below somewhere in CustomPopViewController.
        alertPopupVC.visitButtonCompletionClosure = {
            let myUrl = URL(string: "https://www.daum.net")
            self.webView.load(URLRequest(url: myUrl!))
        }
        //Delegate
        alertPopupVC.popUpDelgate = self
        
        self.present(alertPopupVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - PopUpDelegate Method
    func onTappedViewMySite() {
        print("ViewController - PopUpDelegate")
        let myUrl = URL(string: "https://www.studyios.org")
        self.webView.load(URLRequest(url: myUrl!))
    }
}

