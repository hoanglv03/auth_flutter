import UIKit
import Flutter
import FacebookCore

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      ApplicationDelegate.shared.application(
                  application,
                  didFinishLaunchingzzWithOptions: launchOptions
              )

              return true
  }
   
}
