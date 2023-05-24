import Foundation

struct FootballResponse : Codable {
	let fixture : FotballFixture?
	let league : FotballLeague?
	let teams : FootballTeams?
	let goals : Goals?
	let score : Score?
}
