//
//  ViewController.swift
//  ImageTimer
//
//  Created by Fatih Gümüş on 28.07.2023.
//

import UIKit

class ViewController: UIViewController {

    struct imageType{
        let image : String
        let text : String
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageText: UILabel!
    

    
    let images : [imageType] = [
        imageType(image: "ankara", text: "Ankara"),
        imageType(image: "ist", text: "İstanbul"),
        imageType(image: "tekirdag", text: "Tekirdağ")
    ]
    
    var imageIndex: Int = 0
    var timer: Timer?
    let timeInterval : TimeInterval = 10.0 // 10saniye
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.isUserInteractionEnabled = true // resimleri tıklanabilir yaptık
        
        if let firstImage = UIImage(named: images[imageIndex].image){
            imageView.image = firstImage
                  
        }
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageCliclk))
        imageView.addGestureRecognizer(tapRecognizer)
       
        startTimer()
      
    }

        
    @objc func imageCliclk(){

        //index bittiğinde tekrar göstermesi için bu şekilde sıfırladık
        imageIndex = (imageIndex + 1) % images.count;
        
        if let newImage = UIImage(named: images[imageIndex].image){
            imageView.image = newImage
        }
        
        let newText = images[imageIndex].text
        
        if !newText.isEmpty{
            imageText.text = newText
        }else{
            imageText.text = "Bulunamadı";
        }
        
        resetTimer()
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerFinished), userInfo: nil, repeats: false)
    }
    
    func resetTimer(){
        timer?.invalidate()
        startTimer()
    }
    @objc func timerFinished(){
        imageCliclk()
        
    }
}

