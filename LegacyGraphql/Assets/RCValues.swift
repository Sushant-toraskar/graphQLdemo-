import Firebase
import FirebaseRemoteConfig

class RCValues {
    static let sharedInstance = RCValues()
    let remoteConfig = RemoteConfig.remoteConfig()
    let settings = RemoteConfigSettings()
    
    
    
    private init() {
        // WARNING: Don't actually do this in production!
        //by default remoteconfig caches data for 12 hrs.
        settings.minimumFetchInterval = 0
        //this will clear cache values
        //0 is seconds value that will show interval after which cache should be cleared
        RemoteConfig.remoteConfig().configSettings = settings
        loadDefaultValues()
    }
    
    fileprivate func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            "splash_title": "#dgdfg"
        ]
        remoteConfig.setDefaults(appDefaults as? [String : NSObject])
    }
    
    func fetchCloudValues() {
        remoteConfig.fetch { [self] (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                remoteConfig.activate { changed, error in
                    // ...
                    print("changed : +++++++",changed)
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            //            self.displayWelcome()
        }
        print("test ::",remoteConfig.configValue(forKey: "splash_page").stringValue)
    }
    
    func fetchUpdatedValues() {
        
//        let observer = remoteConfig.observe(remoteConfig) { _, _ in
//          // The Remote Config values have been updated.
//          // Use the updated values here.
//        }

        // Call fetch to update the Remote Config values.
        remoteConfig.fetchAndActivate() { status, error in
          if let error = error {
            print("Error fetching remote config: \(error)")
          } else {
            print("Remote config fetched and activated!")
          }
        }

    }
    
    
    fileprivate func activateDebugMode() {
       
    }
    
    
}
