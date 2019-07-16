//
//  ViewController.swift
//  EnterFrameTimerSample
//
//  Created by shiuchi on 2019/07/17.
//  Copyright © 2019 shiuchi. All rights reserved.
//

import UIKit
import EnterFrameTimer

class ViewController: UIViewController {
    
    private var count: Int = 0
    @IBOutlet weak var fpsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onStart(_ sender: Any) {
        EnterFrameTimer.shared.register(self) { [weak self] in
            guard let self = self else { return }
            self.count += 1
            self.countLabel.text = self.count.description
            self.statusLabel.text = "Timer.isVaild == \(EnterFrameTimer.shared.isValid)"
        }
    }
    
    @IBAction func onFps(_ sender: Any) {
        if EnterFrameTimer.shared.fps == 24 {
            EnterFrameTimer.shared.fps = 12
        } else {
            EnterFrameTimer.shared.fps = 24
        }
        fpsLabel.text = "fps=\(EnterFrameTimer.shared.fps)"
    }
    
    @IBAction func onStop(_ sender: Any) {
        EnterFrameTimer.shared.remove(self)
        self.statusLabel.text = "Timer.isVaild == \(EnterFrameTimer.shared.isValid)"
    }
}

