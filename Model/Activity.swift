import Foundation
import SwiftUI


struct Activity: Hashable, Codable, Identifiable {
    var id: Int
    var name: String

    var imageName: String
    var image: Image {
        Image(systemName: imageName)
    }
    
    
}
