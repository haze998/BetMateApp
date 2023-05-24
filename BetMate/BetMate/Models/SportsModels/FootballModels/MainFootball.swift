import Foundation

struct MainFootball : Codable {
	let get : String?
	let parameters : Parameters?
	let errors : [String]?
	let results : Int?
	let paging : Paging?
	let response : [FootballResponse]?
}
