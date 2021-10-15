SpaceX is a simple iOS demo app developed for a Jablotron assignment. I imagined a situation that I am new at work and I am supposed to join the project. I wrote the code I would love to start working on. The app shows SpaceX launches.

[1] Dependencies
The project is using the Alamofire library for networking (https://github.com/Alamofire/Alamofire). It is currently integrated into the project with CocoaPods (https://cocoapods.org). The integration should be changed to manual in the production code. 

[2] Networking
The app downloads all past launches from api.spacexdata.com as a JSON file. It is using the Alamofire library for network requests. The JSON is parsed with Codable and some (not all) data is stored in the data model. The networking code is written in a modular way for future expansion (to download patches, payloads, crew, etc).

[3] Functionality
The app shows all the past SpaceX launches and some details. The functionality will be extended to include searches, show future launches and save options from the ActionSheet.

[4] To do
Documentation. Searches. Order by parameters. ActionSheet with options. Integrate Alamofire manually.
