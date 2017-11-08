//
//  ViewController.swift
//  BitcoinTracker
//
//  Created by Arinjay on 8/11/2017.
//  Copyright © 2017 Arinjay. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController , UIPickerViewDelegate,UIPickerViewDataSource {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["INR", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","AUD","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencyLogoArray = ["₹", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "$", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    var currencyLogoCount = 0
    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
       
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return currencyArray[row]  // row = 0,... so it will pick up the string value from the array.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        currencyLogoCount = row
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
        getBitcoinData(url: finalURL)
    }
    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
    func getBitcoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the  data")
                    
                    let bitCoinJSON : JSON = JSON(response.result.value!)
                    
                    self.updateBitCoinData(json: bitCoinJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }
//
//    
//    
//    
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
    
    func updateBitCoinData(json : JSON) {
        if let bitResult = json["ask"].double{
            let convertResult = String(bitResult)
            bitcoinPriceLabel.text = currencyLogoArray[currencyLogoCount] + " " + convertResult
        }
        else{
            print("Poor Internet Connection")
        }
        
        
    }

}

