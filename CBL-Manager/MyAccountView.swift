import SwiftUI

//for navigation bar color change
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}

struct MyAccountView: View {
    
    @State private var editAccount = false
    @State private var isShowingActionSheet = false
    
    @State var isShown: Bool = false
    @State var image: Image? = nil
    
    @State var editEnable = false

    var body: some View {
        NavigationView{
            VStack (spacing: 10){
                //navigation bar title and color display
                    
                Spacer()
                    .frame(height: 5)
                
                //avatar icon
                if image == nil {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 115, height: 115, alignment: .center)
                        .foregroundColor(Constants.mainColor)
                } else {
                    self.image!
                        .resizable()
                        .frame(width: 115, height: 115, alignment: .center)
                        .cornerRadius(20)
                }

                //avatar text
                Text("Change Avatar")
                    .bold()
                    .font(.system(size: 13))
                    .frame(width: 107, height: 26, alignment: .center)
                    .foregroundColor(.white)
                    .background(Constants.mainColor)
                    .cornerRadius(9)
                    .onTapGesture {
                        self.isShowingActionSheet.toggle()
                }
                .actionSheet(isPresented: $isShowingActionSheet) {
                    ActionSheet(title: Text("Change Avatar"), message: Text("Choose location"), buttons: [.default(Text("Photos"), action: { self.isShown.toggle() }), .cancel()])
                }
                .sheet(isPresented: $isShown) {
                    ImagePicker(isShown: self.$isShown, image: self.$image)
                }
                
//                .actionSheet(isPresented: $editAvatar {
//                    ActionSheet(title: Text("Change Avatar"), message: Text("Flemis"), buttons: [
//                        .default(Text("Photos")) {system},
//                            .default(Text("Browse other apps")) {},
//                        .cancel()
//                    ])
//                })
                
                
                Spacer().frame(height: 5)
                Divider()
                                
                //text fields and personal info
                VStack (spacing: 3){


                    infoItem(type: "Name: ", info: Constants.mainUser.name)
                    infoItem(type: "E-mail: ", info: Constants.mainUser.email)
                    infoItem(type: "User Name: ", info: Constants.mainUser.username)
                    infoItem(type: "Password: ", info: Constants.mainUser.password)

                }
                
                
                
                Spacer()
    
                Text("Sign Out")
                .foregroundColor(.red).underline()
                
            }
            .padding(20)
            .navigationBarTitle("My Account", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = Constants.mainColor.uiColor()
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
            .navigationBarItems(trailing:
                EditButton.init().foregroundColor(.white)
            )
        }
    }
}



struct infoItem: View {
    var type:String
    var info:String
    var body: some View {
            HStack {
                Text(type)
                    .bold()
                    .foregroundColor(Constants.mainColor)
                    .frame(width: 100, height: 30, alignment: .leading)
                
                Text(info)
                    .bold()
                    .foregroundColor(Constants.secondColor)
                    .frame(width: 200, height: 30, alignment: .leading)
                
            }
            
    }
}
