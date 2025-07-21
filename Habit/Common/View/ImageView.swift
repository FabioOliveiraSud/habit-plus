//
//  ImageView.swift
//  Habit
//
//  Created by Fabio Avila Oliveira on 14/07/25.
//

import SwiftUI
import Combine

struct ImageView: View {
    
    @State var image: UIImage = UIImage()
    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    
    var body: some View {
        Image(uiImage: image)
            .resizable() 
            .onReceive(imageLoader.didChange, perform: { data in
                self.image = UIImage(data: data) ?? UIImage()
            })
    }
}

class ImageLoader: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(url: String) {
        guard let url = URL(string: url) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView_Preview: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://tse1.mm.bing.net/th/id/OIP.3h4nRvaMzKEeY3Ja9OlOqwHaEP?r=0&rs=1&pid=ImgDetMain&o=7&rm=3")
    }
}
