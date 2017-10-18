//
//  ImageViewController.swift
//  iOSFeaturesDemo
//
//  Created by Nandu on 10/17/17.
//  Copyright © 2017 Nandu. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    //learned we can't have #define in swift, I'm missing it
    let imageDownloadURL = "https://i.pinimg.com/originals/ba/cd/3c/bacd3c595d372662c502ab3ab945412e.jpg"
    let urlSession = URLSession.init(configuration: URLSessionConfiguration.default);
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func downloadImageFromInternet(_ sender: Any) {
        let iURL:URL = URL.init(string: imageDownloadURL)!;
        let dataTask = urlSession.dataTask(with: iURL) { (imageData, urlResponse, error) in
            
            DispatchQueue.main.async {
                self.myImageView?.isHidden = false
                self.myImageView?.image = UIImage.init(data: imageData!);
            }
            
        }
        
        dataTask.resume()
    }
    
    
    @IBAction func removeImageFromView(_ sender: Any) {
        self.myImageView?.image = nil
        self.myImageView.isHidden = true;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
