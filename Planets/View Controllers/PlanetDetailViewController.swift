//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 9/20/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let planet = planet, isViewLoaded else {
            imageView?.image = nil
            label?.text = nil
            return
        }
        
        imageView.image = planet.image
        label.text = planet.name
    }

	static let planetKey = "P"

	override func encodeRestorableState(with coder: NSCoder) {
		super.encodeRestorableState(with: coder)

		// Saving to disk
		// Save our current planet
		// IMPORTANT: We want this to be fast and we don't want to duplicate data

		// Planet -> Data -> Encode
		guard let planet = planet else { return }
		let planetData = try? PropertyListEncoder().encode(planet)
		coder.encode(planetData, forKey: "planetData") // TODO: Make constant
	}

	override func decodeRestorableState(with coder: NSCoder) {
		super.decodeRestorableState(with: coder)

		// Loading from disk
		// Coder -> Data -> Planet
		guard let planetData = coder.decodeObject(forKey: "planetData") as? Data else { return }
		planet = try? PropertyListDecoder().decode(Planet.self, from: planetData)
	}
}
