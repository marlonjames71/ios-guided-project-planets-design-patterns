//
//  PlanetController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

// Facade Pattern
// Cleaning up the interface or repacking API's to make it easier to use or self-contained

// API we expose is hard to use

// Easy API's
// Plantes


class PlanetController {

	var planets: [Planet] {
		var planetArray = [
			Planet(name: "Mercury", imageName: "mercury"),
			Planet(name: "Venus", imageName: "venus"),
			Planet(name: "Earth", imageName: "earth"),
			Planet(name: "Mars", imageName: "mars"),
			Planet(name: "Jupiter", imageName: "jupiter"),
			Planet(name: "Saturn", imageName: "saturn"),
			Planet(name: "Uranus", imageName: "uranus"),
			Planet(name: "Neptune", imageName: "neptune"),
		]
		if shouldShowPluto {
			planetArray.append(Planet(name: "Pluto", imageName: "pluto"))
		}
		return planetArray
	}

	var shouldShowPluto: Bool {
		return UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
	}
}
