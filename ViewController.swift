//
//  ViewController.swift
//  BitcoinPriceChecker
//
//  Created by iori on 2019/11/17.
//  Copyright © 2019 iori. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    
   let urlCoin = "https://coincheck.com/api/ticker"
    var coinPrice = 0
    override func viewDidLoad() {
        super.viewDidLoad()
 
           if let url = URL(string: urlCoin) {
               let req = NSMutableURLRequest(url: url)
               req.httpMethod = "GET"
               
               let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: {(data, resp, err) in
                   
                   do {
                       let getJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                       
                    print(getJson)
                    self.coinPrice = getJson["last"]! as! Int
                    print(self.coinPrice)
                    return self.coinPrice = getJson["last"]! as! Int


                   } catch {
                       print ("json error")
                       return
                   }
               })
               task.resume()

           }

        }
    
    @IBAction func TapButton(_ sender: Any) {
           self.priceLabel.text = ("現在のBitcoin価格は" + "\(self.coinPrice)"  + "円です。")
    }
 
    }
    



