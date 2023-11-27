import UIKit

final class IntroViewController: UIViewController, IntroViewDelegate {
    let introView = IntroView()
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        self.view = introView
        buildView()
        introView.delegate = self
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    private func buildView(){
//        view.addSubview(introView)
    }
    
    
    func buttonPressed(_ sender: UIButton) {
        print("Método buttonTapped foi chamado.")
        
        guard let title = sender.titleLabel?.text else { return }
        
        print("Botão \(title) foi pressionado.")
        
        switch title {
        case "Círculo":
            coordinator?.navigateToCircleViewController()
        case "Esfera":
            coordinator?.navigateToEsfereViewController()
        default:
            break
        }
    }

}
protocol IntroViewDelegate: AnyObject {
    func buttonPressed(_ : UIButton)
}
