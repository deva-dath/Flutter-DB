import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                              binaryMessenger: controller.binaryMessenger)
        batteryChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if call.method == "getBatteryLevel" {
                self?.receiveBatteryLevel(result: result)
            } else if call.method == "showMessage" {
                guard let args = call.arguments as? [String : Any] else {return}
                self?.showMessage(controller: controller, message: args["message"] as! String, result: result)
            } else {
            result(FlutterMethodNotImplemented)
            return
          }
        })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func showMessage(controller:UIViewController, message:String, result: FlutterResult){
        let alert = UIAlertController(title: "Toast Message", message: message, preferredStyle: .alert)
        controller.present(alert, animated: true)
        result(30)
        print("Haii")
        
    }
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
          
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }

}

