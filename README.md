# EnterFrameTimer
Swift EnterFrame Timer
### It is possible to execute callback repeatedly by specifying and registering FPS!

```Swift

import UIKit
import EnterFrameTimer

class ViewController: UIViewController {

    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        /// you can setting FPS.
        EnterFrameTimer.shared.fps = 24

        /// register AnyObject instance.
        EnterFrameTimer.shared.register(self) { [weak self] in
            guard let self = self else { return }
            self.count += 1
            print("enter")
            if self.count > 10 {
                /// You can remove with the registered instance
                EnterFrameTimer.shared.remove(self)
            }
        }
    }
}
```
