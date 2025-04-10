# ☁️ Mindshift

This project was made for completing the Interdisciplinary Project (IDP) from the curriculum of Informatics  M.Sc. at the Technical Univerisity of Munich.

It consists of an iOS app to study wether the regular practice of mindfullness exercises improve reduces gender bias. It divides users into two groups: control and target. 
All users first review and agree to a consent form before proceeding to a demographic questionnaire. From there, the flow differs based on group assignment.
Control group participants move directly to the Implicit Association Test (IAT), followed by 10 scenario-based questions. 
In contrast, target group participants first complete a meditation session  before they proceed to the IAT and, finally, answer the scenario-based questions.
The study concludes once the user completes all tasks.


## 📱 How to run the app

We saved our collected data in Firebase Firestore. A Firebase project must be created and linked to the app's project to enable this functionality. 
This link https://firebase.google.com/docs/ios/setup shows the tutorial we used to do that. 
The app's project must have a GoogleService-Info at the end of the process. 
We have installed all the necessary Firebase-related packages for the app's project via the Swift Package Manager.


Once everything set up, open the project on Xcode and press run!

## 📊 How to run the analysis

The "Analysis" folder contains three Python notebooks with the code used for data analysis. 
The three of them automatically fetch the data from our Firestore database, given a private key that identifies an account that is allowed to access it. 
The first file, demographics_analysis.ipynb, contains an analysis of the demographics aspects collected, such as a histogram of the participants' genders. 
The second one, scenario.ipynb, calculates the score of the user's answers for the scenario-based questions and analyses this attribute. 
The third file, test.ipynb, analyses the  user IAT score. 

To run any of them, the following steps must be completed:

1. Install the required libraries by running the following command:

``` pip install pandas firebase-admin matplotlib ```

2. Create a Firebase service account:
   
   2.1. Go to the Firebase Console and open the project linked to the app.
   
   2.2. In the Project Settings, navigate to the Service Accounts tab.
   
   2.3. Click Generate new private key and save the JSON file in a secure folder.

4. Modify the notebook:
   
   3.1. Locate the line in the notebook you want to run that specifies the path to the service account key.
   
   3.1. Replace "/your/path.here.json" with the actual file path where the key is stored.






