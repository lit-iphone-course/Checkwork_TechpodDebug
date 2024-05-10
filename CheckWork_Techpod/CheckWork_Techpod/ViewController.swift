//MARK: ①起動時に画面が黒くなって何も表示されないね！Storyboardを修正しよう
//MARK: ②ビルドした際に発生するエラー「Thread 1: "unable to dequeue a cell with identifier cell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard"」を解決しよう
//MARK: ③画像が一部表示されないね！保存されている画像をViewControllerから参照できているか見比べて確認してみよう!
//MARK: ④音を鳴らそうとしてセルをタップするとアプリが落ちてしまうね！音声ファイルの拡張子はなんだったかな？正しい形式で保存された音声をViewControllerで取得できているか確認してみよう！

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
        
        imageNameArray = ["Beetoven.jpg", "Pachelbel.jpg", "Bach.jpg"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = songNameArray[indexPath.row]
        content.image = UIImage(named: imageNameArray[indexPath.row])
        content.imageProperties.reservedLayoutSize = CGSize(width: 30, height: 30)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選択されました！")
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "m4a")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }
}

