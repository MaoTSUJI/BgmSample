//
//  ViewController.swift
//  BGMsample
//
//  Created by 辻真緒 on 2019/08/19.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate {
    
    // カセットデッキみたいなもの
    var player: AVAudioPlayer!;
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生する音楽ファイルのパス作成
        // forResource: ファイルの名前
        // ofType: ファイルの形式
        let audioPath = Bundle.main.path(forResource: "bgm1", ofType: "mp3")!
        
        // 音楽ファイルを元に、プレイヤー作成
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        // 音楽ファイルを元に、プレイヤー作成
        
        do {
            
            player = try AVAudioPlayer(contentsOf: audioUrl)    // do-cath文にかかないととエラー発生
        } catch let error {
            print(error.localizedDescription)
        }
        
        // 再生
        player.delegate = self  // おまじない
        player.prepareToPlay()  // 再生の準備
//        player.play()   // 再生
        
        
    }
    
    @IBAction func didStopButton(_ sender: UIButton) {

        
        if player.isPlaying {
            player.pause()  // 一時停止
            playButton.setTitle("一時停止", for: UIControl.State())
        
        } else {
            player.play()  // 再生
            playButton.setTitle("再生", for: UIControl.State())
        }
        
        
    }
    


}

