import UIKit

final class CircleViewController: UIViewController {

    private var customView: CircleView? = nil
    
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
    }
    
    private func buildView(){
        view = CircleView()
        customView = view as? CircleView
    }


}
