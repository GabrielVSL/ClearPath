import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    let imagens = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @Binding var selectedImage: Image?
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 100)
                    .cornerRadius(15.0)
                    .shadow(radius: 5, x: 3, y: 3)
                
                VStack {
                    Text("Edição de Avatar")
                        .bold()
                        .font(.title2)
                    Text("Escolha seu novo perfil")
                        .foregroundStyle(.verdeClaro)
                        .bold()
                }
            }
            .padding()
            
            ScrollView {
                ForEach(0..<imagens.count / 2, id: \.self) { index in
                    HStack(spacing: 16) {
                        Image(imagens[index * 2])
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding(5)
                            .onTapGesture {
                                selectedImage = Image(imagens[index * 2])
                                dismiss()
                            }
                        
                        if index * 2 + 1 < imagens.count {
                            Image(imagens[index * 2 + 1])
                                .resizable()
                                .frame(width: 120, height: 120)
                                .padding(5)
                                .onTapGesture {
                                    selectedImage = Image(imagens[index * 2 + 1])
                                    dismiss()
                                }
                        }
                    }
                }
                
                HStack {
                    Button() {
                        dismiss()
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 120, height: 50)
                                .cornerRadius(15.0)
                                .shadow(radius: 5, x: 3, y: 3)
                            
                            VStack {
                                Text("Cancelar")
                                    .bold()
                                    .font(.title2)
                            }
                        }
                    }
                    .accentColor(.red)
                }
                .padding()
            }
        }
    }
}

struct PerfilView: View {
    @State private var showingSheet = false
    @State private var selectedImage: Image? = Image("1")
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    @StateObject var viewModel = ViewModelUsuario()
    var body: some View {
        ZStack {
            Color(.verdeFundo)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 320, height: 100)
                        .cornerRadius(15.0)
                        .shadow(radius: 5, x: 3, y: 3)
                    
                    HStack {
                        Button() {
                            showingSheet.toggle()
                        } label: {
                            selectedImage?
                                .resizable()
                                .frame(width: 70, height: 70)
                                .shadow(radius: 5, x: 3, y: 3)
                        }
                        .sheet(isPresented: $showingSheet) {
                            SheetView(selectedImage: $selectedImage)
                        }
                        
                        Spacer().frame(width: 2)
                        
                        VStack {
                            
                            ForEach(viewModel.usuario.prefix(1), id: \.id){usuario in
                                Text(usuario.nome!)
                                    .frame(maxWidth: 230)
                                    .bold()
                                    .font(.title)
                            }
                            
                            ForEach(viewModel.usuario.prefix(1), id: \.id){usuario in
                                Text("Fumante há \(usuario.tempoFumado!) ano(s)")                                    .foregroundStyle(.gray)
                            }
                            
                            ForEach(Array(viewModel.usuario.prefix(1)), id: \.id) { usuario in
                                Text("Meta: \(usuario.metaUsuario ?? 0) dias limpo")  // Melhor usar `??` para evitar forçar um valor nulo
                                    .foregroundStyle(.gray)
                            }
                            
                            //                            Text(viewModel.usuario.first?.metaUsuario!)
                            //                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 150, height: 100)
                            .cornerRadius(15.0)
                            .shadow(radius: 5, x: 3, y: 3)
                        
                        VStack{
                            Image("trofeu")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 3)
                            Text("Melhor Streak")
                                .bold()
                            
                            ForEach(Array(viewModel.usuario.prefix(1)), id: \.id) { usuario in
                                Text(" \(usuario.maiorStreak ?? 1)")
                                    .foregroundStyle(.verdeClaro)
                                    .bold()
                            }
                        }
                    }
                    Spacer()
                        .frame(width: 20)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 150, height: 100)
                            .cornerRadius(15.0)
                            .shadow(radius: 5, x: 3, y: 3)
                        
                        VStack{
                            Image("dinheiro")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 2)
                            Text("Economia mensal")
                                .bold()
                            
                            ForEach(Array(viewModel.usuario.prefix(1)), id: \.id) { usuario in
                                let valorPacote = Double(usuario.valorPacote!) ?? 0.0
                                let cigarrosDia = usuario.cigarrosDia!
                                
                                let economiaMensal = Double(cigarrosDia)! * valorPacote * 30
                                
                                Text("R$ \(String(format: "%.2f", economiaMensal))")
                                    .foregroundStyle(.verdeClaro)
                                    .bold()
                            }
                        }
                    }
                }
                .padding(8)
                
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 320, height: 340)
                            .cornerRadius(15.0)
                            .shadow(radius: 5, x: 3, y: 3)
                        
                        VStack {
                            Image("friends")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Amigos")
                                .bold()
                                .font(.title2)
                            
                            ZStack (alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.cinza)
                                    .frame(width: 290, height: 70)
                                    .cornerRadius(15.0)
                                    .padding(3)
                                
                                HStack{
                                    Image("2")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .shadow(radius: 5, x: 3, y: 3)
                                        .padding(.leading)
                                    
                                    VStack{
                                        Text("Juliano Gomes")
                                            .font(.title3)
                                            .bold()
                                        HStack{
                                            Image(systemName: "target")
                                            Text("Meta: 365 dias limpo")
                                                .font(.caption)
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                    .frame(maxWidth: 150, maxHeight: 60)
                                }
                            }
                            
                            ZStack (alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.cinza)
                                    .frame(width: 290, height: 70)
                                    .cornerRadius(15.0)
                                    .padding(3)
                                
                                HStack{
                                    Image("3")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .shadow(radius: 5, x: 3, y: 3)
                                        .padding(.leading)
                                    
                                    VStack{
                                        Text("Amanda Avilar")
                                            .font(.title3)
                                            .bold()
                                        HStack{
                                            Image(systemName: "target")
                                            Text("Meta: 90 dias limpo")
                                                .font(.caption)
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                    .frame(maxWidth: 150, maxHeight: 60)
                                }
                            }
                            
                            ZStack (alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.cinza)
                                    .frame(width: 290, height: 70)
                                    .cornerRadius(15.0)
                                    .padding(3)
                                
                                HStack{
                                    ZStack{
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .padding(.leading)
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .foregroundColor(.verdeClaro)
                                            .frame(width: 40, height: 40)
                                            .shadow(radius: 5, x: 3, y: 3)
                                            .padding(.leading)
                                    }
                                    
                                    VStack{
                                        Text("Adicionar novo amigo")
                                            .font(.title3)
                                            .bold()
                                    }
                                    .frame(maxWidth: 220, maxHeight: 60)
                                }
                            }
                        }
                    }
                }
                Spacer()
                    .frame(height: 20)
            }
            
        }
        .onTapGesture {
            showImagePicker.toggle()
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        selectedImage = Image(uiImage: inputImage)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        
        init(image: Binding<UIImage?>) {
            _image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                image = uiImage
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

#Preview {
    PerfilView()
}
