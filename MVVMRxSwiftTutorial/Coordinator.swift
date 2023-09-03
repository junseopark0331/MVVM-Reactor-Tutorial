import UIKit

class Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootVC = RootVC()
        
        let navigationRootVC = UINavigationController(rootViewController: rootVC)
        
        window.rootViewController = navigationRootVC
        window.makeKeyAndVisible()
        
    }
}
