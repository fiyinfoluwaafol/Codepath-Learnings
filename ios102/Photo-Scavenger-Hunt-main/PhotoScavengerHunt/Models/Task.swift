//
//  Task.swift
//  PhotoScavengerHunt
//
//  Created by Fiyinfoluwa Afolayan on 1/21/25.
//

import UIKit
import CoreLocation

class Task {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Task {
    static var mockedTasks: [Task] {
        return [
            Task(title: "Snap a photo of a colorful mural 🎨", description: "Find a wall with vibrant artwork or graffiti and capture its beauty."),
            Task(title: "Find and capture a unique mailbox 📮", description: "Search for a mailbox with a creative design or unusual color and take a picture."),
            Task(title: "Take a selfie with a statue or monument 🗽", description: "Locate a nearby statue or monument and snap a selfie with it."),
            Task(title: "Spot a dog wearing a sweater and take a picture 🐕‍🦺", description: "Find a dog dressed in a sweater or outfit and capture the moment."),
            Task(title: "Photograph a storefront with neon signs 💡", description: "Look for a store that has bright neon signs and snap a picture of it."),
            Task(title: "Capture the reflection of a building in a puddle 🌧️", description: "Wait for a rainy day or find a puddle to photograph a building's reflection."),
            Task(title: "Find a street performer and grab a shot 🎸", description: "Search for someone playing music or performing on the street and take a picture."),
            Task(title: "Take a picture of a dessert from a local bakery 🍰", description: "Visit a bakery and photograph a delicious dessert on display."),
            Task(title: "Find a park bench with an interesting view 🌳", description: "Locate a park bench that overlooks a beautiful or unique scene and capture it."),
            Task(title: "Photograph a bridge or overpass 🛤️", description: "Take a picture of a nearby bridge or overpass, showcasing its structure."),
            Task(title: "Take a picture of a flower in bloom 🌸", description: "Find a vibrant flower in a garden or along a sidewalk and snap a photo."),
            Task(title: "Snap a photo of a car with a unique paint job 🚗", description: "Look for a car that stands out with its colorful or artistic paint and capture it."),
            Task(title: "Find a clock and take a picture of the time 🕰️", description: "Spot an interesting clock on a building or in a park and photograph it."),
            Task(title: "Capture an interesting pattern on a sidewalk or wall 🧱", description: "Search for a unique texture or pattern on a sidewalk or wall and take a picture."),
            Task(title: "Photograph a bird in flight or perched nearby 🐦", description: "Look for a bird resting on a branch or flying and capture it in your shot.")
        ]
    }
}
