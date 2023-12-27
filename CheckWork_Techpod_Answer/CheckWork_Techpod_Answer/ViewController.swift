//
//  ViewController.swift
//  CheckWork_Techpod_Answer
//
//  Created by 大森青 on 2023/12/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!

    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        fileNameArray = ["cannon", "elise", "aria"]
        
        //MARK: - 画像ファイルのパスが間違っている。"Beetoven.jpg" → "Beethoven.jpg"
        imageNameArray = ["Beethoven.jpg", "Pachelbel.jpg", "Bach.jpg"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK: - Identifierが間違っている。"cell" → "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = songNameArray[indexPath.row]
        content.image = UIImage(named: imageNameArray[indexPath.row])
        content.imageProperties.reservedLayoutSize = CGSize(width: 30, height: 30)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選択されました！")
        
        //MARK: - URL()の引数"ofType"が間違っている。"m4a" → "mp3"
        ///この引数はファイルの拡張子を指定しているところだよ
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }
}

