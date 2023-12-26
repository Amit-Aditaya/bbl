import UIKit
import Flutter
import GoogleMaps
import Firebase





@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?     
  ) -> Bool {    
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyBGodcngN-m62H7yNQ8QLDVDvZ1-c51VI0")
    GeneratedPluginRegistrant.register(with: self)
  
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

 //Auth
  // override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
  //          let firebaseAuth = Auth.auth()
  //          firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
  // }
  // override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
  //          let firebaseAuth = Auth.auth()
  //          if (firebaseAuth.canHandleNotification(userInfo)){
  //              print(userInfo)
  //              return
  //          }
  // }
}


