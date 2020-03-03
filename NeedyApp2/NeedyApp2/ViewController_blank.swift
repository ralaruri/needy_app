//
//  ViewController.swift
//  NeedyApp2
//
//  Created by Ramzi Al-Aruri on 2/26/20.
//  Copyright © 2020 Slimecorp. All rights reserved.
//


import UIKit
import Foundation
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var personName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        personName.delegate = self as? UITextFieldDelegate
        phoneNumber.delegate = self as? UITextFieldDelegate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }


    func loadDefaults() {
        let defaults = UserDefaults.standard
        personName.text = defaults.object(forKey: "personName") as? String
        phoneNumber.text = defaults.object(forKey: "phoneNumber") as? String
    }




    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        personName.resignFirstResponder()

    }



    @IBAction func enterButton(_ sender: UIButton) {


        let defaults = UserDefaults.standard


        defaults.set(personName.text, forKey: "personName")
        defaults.set(phoneNumber.text, forKey: "phoneNumber")
        defaults.synchronize()

        print ("fn=\(String(describing: personName.text)), pn=\(String(describing: phoneNumber.text))")


        let parameters: [String:Any] = [
            "To": phoneNumber.text ?? "",
            "Body": personName.text ?? ""
        ]


        AF.request("YOUR_NGROK_URL", method: .post, parameters: parameters, headers: nil).responseString {
        response in
        switch response.result {
                        case .success:
                         print(response)
                         break

                         case .failure(let error):
                          print(error)
             }
        }


    }



//    @IBAction func woo_back(_ sender: Any) {
//        let headers = [
//            "Content-Type": "application/x-www-form-urlencoded"
//        ]

//        let parameters: Parameters = [
//            "To": phoneNumber.text ?? "",
//            "Body": personName.text ?? ""
//        ]
//
//        //AF.request("YOUR_NGROK_URL/sms", method: .post, parameters: parameters, headers: headers).response { response in
//                //print(response)
//
//        AF.request("YOUR_NGROK_URL", method: .post, parameters: parameters, headers: nil).response {response in print(response)}
//
//    }

}
