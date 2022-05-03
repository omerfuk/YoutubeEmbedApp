//
//  ViewController.swift
//  YoutubeEmbedApp
//
//  Created by Ömer Faruk Kılıçaslan on 3.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var videos:[Video] = []
    var video:Video = Video()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let video = Video()
        video.Key = "_WOwOVNEfzY"
        video.Title = "How To Create A Video Player In Xcode 9 (Swift 4)"
        videos.append(video)
        
        let video1 = Video()
        video1.Key = "mzg0Ql7y_kA"
        video1.Title = "Badem ve Öykü Gürman - Değişmem (Official Video)"
        videos.append(video1)
        
        let video2 = Video()
        video2.Key = "2F_wwqlYDvg"
        video2.Title = "2022 NBA SEZONUNDAKİ EN İYİ HAREKETLER VİDEOSUNU İZLEDİM!"
        videos.append(video2)
        
        let video3 = Video()
        video3.Key = "2F_wwqlYDvg"
        video3.Title = "2022 NBA SEZONUNDAKİ EN İYİ HAREKETLER VİDEOSUNU İZLEDİM!"
        videos.append(video3)
        
        let video4 = Video()
        video4.Key = "2F_wwqlYDvg"
        video4.Title = "2022 NBA SEZONUNDAKİ EN İYİ HAREKETLER VİDEOSUNU İZLEDİM!"
        videos.append(video4)
        
        let video5 = Video()
        video5.Key = "2F_wwqlYDvg"
        video5.Title = "2022 NBA SEZONUNDAKİ EN İYİ HAREKETLER VİDEOSUNU İZLEDİM!"
        videos.append(video5)
        
        let video6 = Video()
        video6.Key = "2F_wwqlYDvg"
        video6.Title = "2022 NBA SEZONUNDAKİ EN İYİ HAREKETLER VİDEOSUNU İZLEDİM!"
        videos.append(video6)
        
        
        
    }
    
    

}
//
extension ViewController:UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell

        cell.videoTitle.text = videos[indexPath.row].Title

        let url = "http://img.youtube.com/vi/\(videos[indexPath.row].Key)/0.jpg"
        cell.videoImage.downloaded(from: url)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vi = videos[indexPath.row]
        self.video = vi
        
        performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toVideo" {
            let vc = segue.destination as! VideoViewController
            
            vc.video = self.video
        }
    }


}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
