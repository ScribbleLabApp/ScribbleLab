# Guide: How to create a ScribbleLab account

A step by step guide for creating a ScribbleLab Account

@Metadata {
    @PageColor(yellow)
}

## Overview

The ScribbleLab Auth Service is a secure, reliable and easy-to-use authentication service that allows users to gain access to the application's resources through a simple and straightforward process. The ScribbleLab Auth Service is built on top of Firebase, a powerful and scalable database service, ensuring that user authentication is done in a secure and robust manner.

We offer our users three ways to authenticate:
- Google Sign In **`(GID)`**
- SignInWithApple **`(SIWA)`**
- ScribbleLabApp Account **`(SLA)`**

All three ways are secure due to our secured database.

### Requirements

@TabNavigator {
    @Tab("GoogleSignIn") {
        To use GoogleSignIn you need a functioning Google Account, a wifi connetion, and newest iPadOS/macOS version
    }
    
    @Tab("SignInWithApple") {
        To use SignInWithApple you need an AppleID that is protected through 2FA. You need to be over 13 years old in order to use this option.
    }
    
    @Tab("ScribbleLabApp") {
        To use ScribbleLabApp's own sign-In method you need a valide email. You also need the newest iPadOS/macOS version (iPadOS 17 or macOS 14 minimum)
    }
}
        
        
### Account creation
If you first launch or download our app you'll see a sign-In screen. Choose your favourite Authentication method:

@Links(visualStyle: list) {
    - <doc:GID-Usage>
    - <doc:SIWA-Usage>
    - <doc:SLA-Usage>
}


## Featured

### LogIn

### SignUp
@Links(visualStyle: list) {
    - <doc:AccountCreation>
}
