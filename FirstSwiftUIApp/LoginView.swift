import SwiftUI

struct LoginView: View {
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userPhone: String = ""
    @State var userPassword: String = ""
    @State var userConfirmPassword: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Let's get started!")
                    .font(.title.bold())
                Text("Sign up now for exlusive rewards!")
                    .padding()
                VStack{
                    addLoginDetailTextFieldView(placeholder: "Name", iconName: "person.fill", text: $userName)
                    addLoginDetailTextFieldView(placeholder: "Email", iconName: "envelope.fill", text: $userEmail)
                    addLoginDetailTextFieldView(placeholder: "Phone", iconName: "phone.fill", text: $userPhone)
                    addLoginDetailTextFieldView(placeholder: "Password", iconName: "lock.fill", text: $userPassword)
                    addLoginDetailTextFieldView(placeholder: "Confirm Password", iconName: "lock.fill", text: $userConfirmPassword)
                }.padding(EdgeInsets(top: 5, leading: 50, bottom: 5, trailing: 50))
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Create")
                }).frame(width: 100).padding().background(Color.blue).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                Spacer()
                HStack{
                    Text("Already have an account?")
                    Text("Login here").foregroundColor(.blue)
                }
                Spacer()
            }
        }
    }
}

struct addLoginDetailTextFieldView: View {
    var placeholder: String
    var iconName: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
            TextField(placeholder, text: $text)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}



#Preview {
    LoginView()
}
