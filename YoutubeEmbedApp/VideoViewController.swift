//
//  VideoViewController.swift
//  YoutubeEmbedApp
//
//  Created by Ömer Faruk Kılıçaslan on 3.05.2022.
//

import UIKit

class VideoViewController: UIViewController {
    var video:Video = Video()
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        videoTitle.text = video.Title
        getVideo(videoKey: video.Key)
    }
    
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        
        videoWebView.loadRequest(URLRequest(url: url!))
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
