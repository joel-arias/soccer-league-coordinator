// Available Players
let Joe_Smith: [String:Any] = ["name": "Joe Smith", "height": 42, "experience": true, "guardian": "Jim and Jan Smith" ]
let Jill_Tanner: [String:Any] = [ "name": "Jill Tanner", "height": 36, "experience": true, "guardian": "Clara Tanner"]
let Bill_Bon: [String:Any] = [ "name": "Bill Bon", "height": 43, "experience": true, "guardian": "Sara and Jenny Bon"]
let Eva_Gordon: [String:Any] = [ "name": "Eva Gordon", "height": 45, "experience": false, "guardian": "Wendy and Mike Gordon"]
let Matt_Gill: [String:Any] = [ "name": "Matt Gill", "height": 40, "experience": false, "guardian": "Charles and Sylvia Gill"]
let Kimmy_Stein: [String:Any] = [ "name": "Kimmy Stein", "height": 41, "experience": false, "guardian": "Bill and Hillary Stein"]
let Sammy_Adams: [String:Any] = [ "name": "Sammy Adams", "height": 45, "experience": false, "guardian": "Bill and Hillary Stein"]
let Karl_Saygan: [String:Any] = [ "name": "Karl Saygan", "height": 42, "experience": true, "guardian": "Heather Bledsoe"]
let Suzane_Greenberg: [String:Any] = [ "name": "Suzane Greenberg", "height": 44, "experience": true, "guardian": "Henrietta Dumas"]
let Sal_Dali: [String:Any] = [ "name": "Sal Dali", "height": 41, "experience": false, "guardian": "Gala Dali"]
let Joe_Kavalier: [String:Any] = [ "name": "Joe Kavalier", "height": 39, "experience": false, "guardian": "Sam and Elaine Kavalier"]
let Ben_Finkelstein: [String:Any] = [ "name": "Ben Finkelstein", "height": 44, "experience": false, "guardian": "Aaron and Jill Finkelstein"]
let Diego_Soto: [String:Any] = [ "name": "Diego Soto", "height": 41, "experience": true, "guardian": "Robin and Sarika Soto"]
let Chloe_Alaska: [String:Any] = [ "name": "Chloe Alaska", "height": 47, "experience": false, "guardian": "David and Jamie Alaska"]
let Arnold_Willis: [String:Any] = [ "name": "Arnold Willis", "height": 43, "experience": false, "guardian": "Claire Willis"]
let Phillip_Helm: [String:Any] = [ "name": "Phillip Helm", "height": 44, "experience": true, "guardian": "Thomas Helm and Eva Jones"]
let Les_Clay: [String:Any] = [ "name": "Les Clay", "height": 42, "experience": true, "guardian": "Wynonna Brown"]
let Herschel_Krustofski: [String:Any] = [ "name": "Herschel Krustofski", "height": 45, "experience": true, "guardian": "Hyman and Rachel Krustofski"]

// Available Teams
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []
var teamSharks: [[String: Any]] = []

// Store Available Players into a collection
var players: [[String:Any]] = [ Joe_Smith, Jill_Tanner, Bill_Bon, Eva_Gordon, Matt_Gill, Kimmy_Stein, Sammy_Adams, Karl_Saygan, Suzane_Greenberg, Sal_Dali, Joe_Kavalier, Ben_Finkelstein, Diego_Soto, Chloe_Alaska, Arnold_Willis, Phillip_Helm, Les_Clay, Herschel_Krustofski]

// Store Available Teams into a collection
var teams: [String: [[String: Any]] ] = ["teamDragons": teamDragons, "teamRaptors":teamRaptors, "teamSharks":teamSharks]


// This function checks how many players with and without experience there are in a team
func howManyPlayers(inTeam team: [[String : Any]]) -> [String: Int]{
    var exp = 0
    var nonExp = 0
    
    for p in team{
        if p["experience"] as! Bool == true {
            exp += 1
        }else{
            nonExp += 1
        }
    }
    return ["experienced": exp, "nonExperienced": nonExp]
}

// This function creates the 3 teams
func createTeamsWith(availablePlayers: [[String : Any]]){
    
    var numOfDragons = howManyPlayers(inTeam: teamDragons)
    var numOfRaptors = howManyPlayers(inTeam: teamRaptors)
    
    for p in availablePlayers {
        
        // Check the number of experienced and non experienced players in everyteam
        numOfDragons = howManyPlayers(inTeam: teamDragons)
        numOfRaptors = howManyPlayers(inTeam: teamRaptors)
        
        // if a player has experience we will check how many experienced player there are already in teamDragons and add if there are less than 3. If that is not the case we will check teamRaptors and repeat. We will do the same for non experienced players.
        if p["experience"] as! Bool == true{
            if numOfDragons["experienced"]! < ((availablePlayers.count/teams.count)/numOfDragons.count){
                teamDragons.append(p)
            } else if numOfRaptors["experienced"]! < ((availablePlayers.count/teams.count)/numOfRaptors.count){
                teamRaptors.append(p)
            } else{
                teamSharks.append(p)
            }
        }else if p["experience"] as! Bool == false{
            if numOfDragons["nonExperienced"]! < ((availablePlayers.count/teams.count)/numOfDragons.count){
                teamDragons.append(p)
            } else if numOfRaptors["nonExperienced"]! < ((availablePlayers.count/teams.count)/numOfRaptors.count){
                teamRaptors.append(p)
            } else{
                teamSharks.append(p)
            }
        }
        
        // Update dictionary of teams
        teams["teamDragons"] = teamDragons
        teams["teamRaptors"] = teamRaptors
        teams["teamSharks"] = teamSharks
    }
}

// Create an array collection to store all the letters
var letters: [String] = []

// This function writes a letter for every player (p) in every team
func writeLetters(forTeam team: [[String : Any]]){
    for p in team{
        let content = "Hello \(p["guardian"] ?? "Guardian"), We inform you that \(p["name"] ?? "Player Name") has been selected to play with the Team Dragons and the first practice has been scheduled for March 17, 1pm. Thank you"
        letters.append(content)
    }
}

createTeamsWith(availablePlayers: players)

writeLetters(forTeam: teamDragons)
writeLetters(forTeam: teamSharks)
writeLetters(forTeam: teamRaptors)

for letter in letters{
    print(letter)
}
