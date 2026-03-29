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

        cloudBottomOne.contentMode = .scaleAspectFill
        cloudBottomTow.contentMode = .scaleAspectFill
        cloudBottomThree.contentMode = .scaleAspectFill
        cloudBottomOne.clipsToBounds = true
        cloudBottomTow.clipsToBounds = true
        cloudBottomThree.clipsToBounds = true

        NSLayoutConstraint.activate([
            cloudBottomOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudBottomOne.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudBottomOne.bottomAnchor.constraint(equalTo: bottomAnchor),
            cloudBottomOne.heightAnchor.constraint(equalToConstant: 60),

            cloudBottomTow.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudBottomTow.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudBottomTow.bottomAnchor.constraint(equalTo: cloudBottomOne.topAnchor, constant: 20),
            cloudBottomTow.heightAnchor.constraint(equalToConstant: 60),

            cloudBottomThree.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudBottomThree.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudBottomThree.bottomAnchor.constraint(equalTo: cloudBottomTow.topAnchor, constant: 20),
            cloudBottomThree.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    

}

