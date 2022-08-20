//
//  ViewController.swift
//  MemeMaker
//
//  Created by Ryan Chappelle on 8/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    var topChoices = [CaptionOption(caption: "When you want to cross the road", emoji: "🤪"),
    CaptionOption(caption: "When you get a flat tire", emoji: "😶"), CaptionOption(caption: "When you go on a date", emoji: "🤔")]
    var bottomChoices = [CaptionOption(caption: "Chicken.", emoji: "🐥"), CaptionOption(caption: "Bottom text", emoji: "🥶"), CaptionOption(caption: "buT thEy LiSteN To ChriStMas MuSic In JuLy.", emoji: "🙈")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        matchLabels()
    }

    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        matchLabels()
    }
    
    func matchLabels() {
        topCaptionLabel.text = topChoices[topSegmentedControl.selectedSegmentIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomSegmentedControl.selectedSegmentIndex].caption
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

