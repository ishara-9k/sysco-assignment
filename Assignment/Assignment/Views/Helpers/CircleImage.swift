//
//  CircleImage.swift
//  Assignment
//
//  Created by user243733 on 9/13/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .aspectRatio(contentMode: .fit)
            .frame(width: 350, height: 350)
            .clipShape(Circle())
            .overlay{ Circle().stroke( .white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("circlePreview"))
    }
}
