# Auth

Scribble Lab's Auth Services

## Overview

The ScribbleLab Auth Service is a secure, reliable and easy-to-use authentication service that allows users to gain access to the application's resources through a simple and straightforward process. The ScribbleLab Auth Service is built on top of Firebase, a powerful and scalable database service, ensuring that user authentication is done in a secure and robust manner.

We offer our users three ways to authenticate:
- Google Sign In **``(GID)``**
- SignInWithApple **``(SIWA)``**
- ScribbleLabApp Account **``(SLA)``**

All three ways are secure due to our secured database.

### How is Firebase connected to our App?
- In order to use Firebase you need to import Firebase via SPM and import it in your AppFile as following:
    ```swift
    import SwiftUI
    import FirebaseCore
    ```

- Then you need to add Firebase to your AppDelegate:
    ```swift
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()

            return true
        }
    }
    ```

    > For the use for GID:
    > In order to use GID (= GoogleSignIn) you need to add GoogleSignIn to your Project via SPM. Then import it in your AppFile.
    >```swift
    > import SwiftUI
    > import FirebaseCore
    > import GoogleSignIn
    > ```
    >
    > Then add the following code to your AppDelegate in order to let GID run properly:
    > ```swift
    > // The method should call the handleURL method of GIDSignIn instance, which will properly handle the URL that SL recieves at the end of the auth process.
    >@available(iOS 9.0, *)
    >func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    >    return GIDSignIn.sharedInstance.handle(url)
    >}
    > ```

- Firebase is now succesfully conected from your App site 🎉

### How does our Authentication work?
While the App is launching it checks wether you have a valide UserSession (email, password, uuid). In order to do that we call our ``ContentViewModel`` that asks FirebaseAuth after a valide user session:

```swift
private let service = SLAuthService.shared
private var canellables = Set<AnyCancellable>()

@Published var userSession: FirebaseAuth.User?
@Published var currentUser: User?

init() {
    setupSubscribers()
}

func setupSubscribers() {
    service.$userSession.sink { [weak self] userSession in
        self?.userSession = userSession
    }
    .store(in: &canellables)
    
    service.$currentUser.sink { [weak self] currentUser in
        self?.currentUser = currentUser
    }
    .store(in: &canellables)
}
```



> ContentView.swift:
> ```swift
> import SwiftUI
>
> struct ContentView: View {
>    @StateObject var viewModel = ContentViewModel()
>
>    var body: some View {
>        Group {
>            if $viewModel.userSession == nil {
>                SignUpView()
>            } else if let currentUser = viewModel.currentUser {
>              SLSideBarView()
>           }
>       }
>    }
>}
> ```

While this is all happening our ``ContentViewModel`` also calls the ``SLAuthService`` that tries to fetch the user:
```swift
@MainActor
func loadUserData() async throws {
    self.userSession = Auth.auth().currentUser
    guard let currentUid = userSession?.uid else { return }
    self.currentUser = try await UserService.fetchUser(withUid: currentUid)
}
```

### Section header

<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->
