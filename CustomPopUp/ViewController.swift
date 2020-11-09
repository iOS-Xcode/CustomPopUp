//
//  ViewController.swift
//  CustomPopUp
//
//  Created by Seokhyun Kim on 2020-11-06.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

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
        
        //Register noti recevier
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    //MARK: - PopUpDelegate Method
    func onTappedViewMySite() {
        print("ViewController - PopUpDelegate")
        let myUrl = URL(string: "https://www.studyios.org")
        self.webView.load(URLRequest(url: myUrl!))
    }
    
    //MARK: - Noti Run
    @objc fileprivate func loadWebView() {
        print("loadWebView")
        let myUrl = URL(string: "https://www.canada.ca/home.html")
        self.webView.load(URLRequest(url: myUrl!))
    }
    
    //Notification center release from memory
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

