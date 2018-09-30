# VIPERx
VIPER Architecture with RxSwift for iOS Projects
![image](https://s3.amazonaws.com/ckl-website-static/wp-content/uploads/2016/04/Viper-Module.png)

- **View**: displays what it is told to by the Presenter and relays user input back to the Presenter.
- **Interactor**: contains the business logic as specified by a use case.
- **Presenter**: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
- **Entity**: contains basic model objects used by the Interactor.
- **Routing**: contains navigation logic for describing which screens are shown in which order.

## Sources

- [https://www.objc.io/issues/13-architecture/viper/] (iOS Project Architecture: VIPER - Objc.io)
- [https://cheesecakelabs.com/blog/ios-project-architecture-using-viper/] (iOS Project Architecture: VIPER - Cheesecake Labs)
- [https://github.com/pedrohperalta/Articles-iOS-VIPER] (iOS Project with VIPER Architecture - Cheesecake Labs)
