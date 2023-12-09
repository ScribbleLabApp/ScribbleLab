# AuthFlow

ScribbleLab's Auth flow

## Overview

The Auth Flow is a process that allows users to securely access an application or service by verifying their identity. This process typically involves the use of a username and password, but may also incorporate other forms of authentication such as biometric identification or two-factor authentication.

Here is a breakdown of the steps involved in the Auth Flow:

1. User initiates the Auth Flow: At the first launch the user will be navigated to our ``SignUpView``. If the user already has an account they'll be navigated to the ``LogInView``.

2. User enters their login credentials: The user provides their username/email and password, or other forms of authentication such as biometric identification or two-factor authentication.

3. Application verifies credentials: The application verifies the user's credentials against our Firestore Database. If the credentials are valid, the application grants the user access to the service.

4. Session creation: Once the user has been authenticated, the application creates a session for the user. This session is a unique identifier that allows the application to recognize the user and their access rights for the duration of their visit to the application or service.

5. User performs actions within the application: The user is now able to perform actions within the application or service according to their access rights.

6. Session expiration: Once the user has finished using the application or service, the session is terminated. This is done to ensure the security of the user's data and prevent unauthorized access.
