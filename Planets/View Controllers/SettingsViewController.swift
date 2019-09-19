//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }

	private func sendPlutoHasChangedNotification() {
		let notifcation = Notification.init(name: .shouldShowPlutoChanged)
		NotificationCenter.default.post(notifcation)
	}
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
		sendPlutoHasChangedNotification()
    }
}
