//
//  LunaView.swift
//  Luna
//
//  Created by ggs on 21/11/23.
//

import UIKit

class LunaView: UIView {
    let lunaImageView = UIImageView()
    
    init(controller: IntroViewController? = nil) {
        super.init(frame: .zero)
        addSubview(lunaImageView)
        configureConstraints()
        startAnimation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureAnimation() {
        var animationImages: [UIImage] = []
        for i in 1...8 {
            if let image = UIImage(named: "luna\(i)") {
                animationImages.append(image)
            }
        }
        lunaImageView.animationImages = animationImages
        lunaImageView.animationDuration = 4.0
        lunaImageView.animationRepeatCount = 0
        lunaImageView.contentMode = .scaleAspectFit
    }
    
    func startAnimation() {
        configureAnimation()
        addFloatingEffect()
        lunaImageView.startAnimating()
    }
    
    func stopFloatingEffect() {
        lunaImageView.layer.removeAllAnimations()
    }

    func configureConstraints() {
        lunaImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lunaImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lunaImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
        ])
    }
    
    private func addFloatingEffect() {
        let duration = 1.5
        let delay = 0.0
        let options: UIView.AnimationOptions = [.curveEaseInOut, .autoreverse, .repeat]

        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            let originalTransform = self.lunaImageView.transform
            let upTransform = originalTransform.translatedBy(x: 0, y: -20).scaledBy(x: 1.1, y: 1.1)

            self.lunaImageView.transform = upTransform

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.lunaImageView.transform = originalTransform
            }
        }, completion: { _ in
            self.addFloatingEffect()        })
    }

}

