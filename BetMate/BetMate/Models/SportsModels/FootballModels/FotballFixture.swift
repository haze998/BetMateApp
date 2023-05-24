import Foundation

struct FotballFixture : Codable {
	let id : Int?
	let referee : String?
	let timezone : String?
	let date : String?
	let timestamp : Int?
	let periods : Periods?
	let venue : Venue?
	let status : FotballStatus?
}
