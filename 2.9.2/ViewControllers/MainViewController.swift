//
//  MainViewController.swift
//  2.9.2
//
//  Created by Александр on 01.08.2022.
//

import Spring

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var animationView: SpringView!

    @IBOutlet var presentLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    // MARK: - Private properties
    private var animation = RandomAnimation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(presentLabel, curveLabel, forceLabel, durationLabel, delayLabel)
    }

    // MARK: - IBActions
    @IBAction func runButtonPressed(_ sender: UIButton) {
        setTitle(presentLabel, curveLabel, forceLabel, durationLabel, delayLabel)

        animationView.animation = animation.present
        animationView.curve = animation.curve
        animationView.force = CGFloat(animation.force)
        animationView.duration = CGFloat(animation.duration)
        animationView.delay = CGFloat(animation.delay)
        
        animation = RandomAnimation.getRandomAnimation()
        animationView.animate()
        sender.setTitle("Run \(animation.present)", for: .normal)
    }
    
}

extension MainViewController {
    func setTitle(_ labels: UILabel...) {
        for label in labels {
            switch label.tag {
            case 0:
                label.text = "present: \(animation.present)"
            case 1:
                label.text = "curve: \(animation.curve)"
            case 2:
                label.text = "force \(String(format: "%.02f", animation.force))"
            case 3:
                label.text = "duration \(String(format: "%.02f", animation.duration))"
            default:
                label.text = "delay \(String(format: "%.02f", animation.delay))"
            }
        }
    }
}
