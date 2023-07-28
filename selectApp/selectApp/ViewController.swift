//
//  ViewController.swift
//  selectApp
//
//  Created by 郭家宇 on 2023/7/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var segmentSex: UISegmentedControl!
    @IBOutlet weak var strengthIndex: UILabel!
    @IBOutlet weak var strengthSliderSet: UISlider!
    
    var nameIndex :String = ""
    var netIndex :String = ""
    var strengthIndex2:String = ""
    var airIndex:String = ""
    var dateSelectIndex = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentSex.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: UIControl.State.normal)
    }

    @IBAction func segmentSexSelect(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            segmentSex.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,
                                               NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: UIControl.State.normal)
            netIndex = String(sender.selectedSegmentIndex)
        }else if sender.selectedSegmentIndex == 1{
            segmentSex.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red,
                                               NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: UIControl.State.normal)
            netIndex = "女網"
        }else{
            segmentSex.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brown,
                                               NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], for: UIControl.State.normal)
            netIndex = "混排網"
        }
    }
    @IBAction func sliderStrength(_ sender: UISlider) {
        print("\(sender.value)")
           if sender.value < 25.0 {
               strengthIndex.text = "(Easy)"
               strengthSliderSet.tintColor = UIColor.gray
               strengthIndex2 = "Easy"
           } else if sender.value < 50.0 {
               strengthIndex.text = "(Moderate)"
               strengthSliderSet.tintColor = UIColor.green
               strengthIndex2 = "Moderate"
           } else if sender.value < 75.0 {
               strengthIndex.text = "(Strong)"
               strengthSliderSet.tintColor = UIColor.yellow
               strengthIndex2 = "Strong"
           } else {
               strengthIndex.text = "(Expert)"
               strengthSliderSet.tintColor = UIColor.red
               strengthIndex2 = "Expert"
           }
    }
    
    @IBAction func sendIndexButton(_ sender: Any) {
        showAlert(title: "預約訊息", message: "顧客：\(nameInput.text!)\n 性別：\(netIndex) \n 強度： \(strengthIndex2)\n 冷氣是否要開： \(airIndex)\n 預約日期：\(dateSelectIndex)" )
    }
    
    @IBAction func airSwitch(_ sender: UISwitch) {
        if sender.isOn{
            airIndex = "要開冷氣"
        }else{
            airIndex = "不開冷氣"
        }
    }
    @IBAction func dataPickerSelect(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let selectedDate = sender.date
            let dateString = dateFormatter.string(from: selectedDate)
            dateSelectIndex = dateString


    }
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func finishTyping(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

