import UIKit

class CloudBottomView: UIView {
    let cloudBottomOne = UIImageView(image: UIImage(named: "baixo1"))
    let cloudBottomTow = UIImageView(image: UIImage(named: "baixo2"))
    let cloudBottomThree = UIImageView(image: UIImage(named: "baixo3"))
    
    init(controller: IntroViewController? = nil) {
        super.init(frame: .zero)
        addSubview(cloudBottomOne)
        addSubview(cloudBottomTow)
        addSubview(cloudBottomThree)
        configureConstraints()
        startAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateCloudBottomOne() {
        UIView.animate(withDuration: 1.7, animations: {
                self.cloudBottomOne.center.y += 10
            }) { _ in
                UIView.animate(withDuration: 1.7, animations: {
                    self.cloudBottomOne.center.y -= 10
                }, completion: { _ in
                    self.animateCloudBottomOne()})
            }
        }
        
        func animateCloudBottomTow() {
            UIView.animate(withDuration: 1.7, animations: {
                self.cloudBottomTow.center.y -= 5
            }) { _ in
                UIView.animate(withDuration: 1.7, animations: {
                    self.cloudBottomTow.center.y += 5
                }, completion: { _ in
                    self.animateCloudBottomTow()       })
            }
        }
        
        func animateCloudBottomThree() {
            UIView.animate(withDuration: 1.7, animations: {
                self.cloudBottomThree.center.y += 8
            }) { _ in
                UIView.animate(withDuration: 1.7, animations: {
                    self.cloudBottomThree.center.y -= 8
                }, completion: { _ in
                    self.animateCloudBottomThree()        })
            }
            
        }
    
    func startAnimation() {
        animateCloudBottomOne()
        animateCloudBottomTow()
        animateCloudBottomThree()
        
        cloudBottomOne.startAnimating()
        cloudBottomTow.startAnimating()
        cloudBottomThree.startAnimating()
    }

    func configureConstraints() {
        cloudBottomOne.translatesAutoresizingMaskIntoConstraints = false
        cloudBottomTow.translatesAutoresizingMaskIntoConstraints = false
        cloudBottomThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cloudBottomOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudBottomOne.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            cloudBottomTow.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudBottomTow.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 65),
            cloudBottomThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            cloudBottomThree.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 80),
        ])
    }
    

}

