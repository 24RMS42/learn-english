//
//  Info.swift
//  learningenglish
//
//  Created by YakovAlexey on 1/5/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import UIKit

class Info: NSObject {
    static let rE_Names_new = [["plate", "steel_wool", "sink", "mug", "jar", "glass", "freezer", "dishwasher", "dough", "garbage_bag",
                                "garbage_can", "ice_cube_tray", "island", "jug", "kettle", "knife", "knife_sharpener", "leftover", "meet_grinder", "mold",
                                "mop", "mortar_and_pestle", "napkin", "papertowel", "refrigerator", "rice_cooker", "salt", "sieve", "skewer", "skillet",
                                "sponge", "spoon", "tablespoon", "tea_cup", "teapot", "teaspoon", "pressure_cooker", "grinder", "microwave_oven", "table",
                                "apron", "blender", "bottle", "bowl", "dish_soap", "broom", "can"],
                               [],
                               [],
                               []]
    static let rE_Names = [["plate", "steel wool", "sink", "mug", "jar", "glass", "freezer", "dishwasher", "dough", "garbage bag",
                            "garbage can", "ice cube tray", "island", "jug", "kettle", "knife", "knife sharpener", "leftover", "meet grinder", "mold",
                            "mop", "mortar and pestle", "napkin", "papertowel", "refrigerator", "rice_cooker", "salt", "sieve", "skewer", "skillet",
                            "sponge", "spoon", "tablespoon", "tea_cup", "teapot", "teaspoon", "pressure_cooker", "grinder", "microwave oven", "table",
                            "apron", "blender", "bottle", "bowl", "dish_soap", "broom", "can"],
                           ["GOOSE", "HEN", "ROOSTER", "CAT", "COW", "DOG", "DONKEY", "DUCK", "GOAT", "GOLDFISH", "HORSE", "MOUSE", "MULE", "PIG",
                            "RABBIT", "SHEEP", "TURKEY", "CAMEL"],
                           ["STARLING", "ROBIN", "EAGLE", "BEE EATER", "BUDGIE", "CANARY", "CROW", "DOVE", "FINCH", "FLAMINGO", "HAWK", "HERON", "HOOPOE", "HORNBILL", "HUMMINGBIRD", "OSTRICH", "OWL", "PARROT", "PARTRIDGE", "PEACOCK", "PELICAN", "PENGUIN", "PHEASANT", "SEAGULL", "SPARROW", "STORK", "SWAN", "VULTURE", "WOODPECKER", "PIGEON", "CARDINAL", "GOLDFINCH", "PUFFIN"],
                           ["HIPPO", "TUNA", "SWORDFISH", "STRIPPED MARLIN", "STINGRAY", "SQUID", "OTTER", "ORCA WHALE", "MARLIN", "ALLIGATOR", "BLUE WHALE", "CATFISH", "CLOWN FISH", "CRAB", "CROCODILE", "DOLPHIN", "EEL", "FROG", "JELLYFISH", "LOBSTER", "OCTOPUS", "PORCUPINE FISH", "PYTHON", "RAINBOW TROUT", "SEA HORSE", "SEAL", "SEA URCHIN", "SHARK", "SHRIMP", "STAR FISH", "TOAD", "TURTLE", "WALRUS", "YELLOW FISH", "PINK SALMON", "SEA LION", "SEA TURTLE"],
                           ["AIRPLANE", "AMBULANCE", "AUDI", "BICYCLE", "BMW", "BUS", "CONVERTIBLE CAR", "ELECTRIC CAR", "FERRARI", "FIGHTER JET",
                            "FIRE TRUCK", "HELICOPTER", "HUMMER", "HYBRID CAR", "KICKBOARD", "JEEP", "LAMBORGHINI", "LAND ROVER", "LIMOUSINE", "MASERATI",
                            "MERCEDES BENZ", "MOTORCYCLE", "PICKUP TRUCK", "POLICE CAR", "RACING CAR", "SAILBOAT", "SHIP", "SPORT CAR", "TAXI", "TRAIN",
                            "TRUCK", "VAN"],
                           ["ASK", "BAKE", "BITE", "BOUNCE", "BRUSH", "BUILD", "BUY", "CALL", "CARRY", "CATCH", "CLAP", "CLEAN", "CLIMB", "CLOSE", "COLOR", "COOK", "CRY", "CUT", "DANCE", "DIG", "DRAW", "DREAM", "DRINK", "DRIVE", "EAT", "FALL", "FLOAT", "FLY", "FOLD", "FOLLOW", "GIVE", "GO", "HAVE", "HIT", "HOP", "JUGGLE", "JUMP", "KICK", "KISS", "KNOCK", "LAUGH", "LEAD", "LIFT", "LIKE", "LISTEN", "LOCK", "LOOK", "LOVE", "MARCH", "MIX", "MOP", "OPEN", "PULL", "PUSH", "READ", "RUN", "SING", "SIT DOWN", "SKIP", "SLEEP", "STAND UP", "STUDY", "SWIM", "TALK", "THINK", "WAIT", "WALK", "WRITE"],
                           ["ACCORDION", "BAGPIPES", "BELL", "CELLO", "CLARINET", "DRUM", "ELECTRIC GUITAR", "FLUTE", "GUITAR", "HARMONICA", "HARP", "HORN", "KEYBOARD", "MANDOLIN", "OUD", "PIANO", "SAXOPHONE", "SITAR", "SYNTHESIZER", "TAMBOURINE", "TRIANGLE", "TRUMPET", "VIOLIN", "WHISTLE", "WIND CHIME"]]
    
    static let rP_Names = [["دیس", "سیم ظرفشویی", "لگن ظرفشویی", "فنجان بزرگ", "ظرف شیشه‌ای در دار", "لیوان", "سردساز، فریزر", "ماشین ظرفشویی", "خمیر", "کیسه زباله"],
                           [],
                           [],
                           [],
                           []]
    
    static let vS_Names = ["وسایل مدرسه", "کره زمین", "آب و هوا", "جغرافیا", "فصل ها","احساسات", "شغل ها", "شهر", "نقشه", "منظومه شمسی", "حروف الفبا", "اعداد", "میوه و سبزیجات", "رنگها", "شکل ها", "لباس‌ها", "اعضای بدن", "صدا ها", "خانواده", "اسباب بازی‌ ها"]
    static let vC_Names = ["حروف الفبا", "اعداد", "میوه و سبزیجات", "رنگها", "شکل ها", "لباس‌ها", "اعضای بدن", "صدا ها", "خانواده", "اسباب بازی‌ ها"]
    
    static let videoURL = "https://promoletter.com/learnenglish/videos/"
    
    static func getImage(name: String) -> UIImage? {
        let animalName = name.replacingOccurrences(of: " ", with: "_").lowercased()
        let imageName = "i_\(animalName)"

        let image = UIImage(named: imageName)
        
        return image
    }
    
    static func getBackgroundImageBy(Category: Int) -> UIImage? {
        if Category < 3 {
            return UIImage(named: "background_learn_real")
        } else if Category == 3 {
            return UIImage(named: "background_learn_aquatics")
        } else {
            return UIImage(named: "background_learn_new_category")
        }
    }
    
    static func getAllNames() -> Array<String> {
        var names = Array<String>()
        for subnames in rE_Names {
            names.append(contentsOf: subnames)
        }
        
        return names
    }
    
    static func getEName(category: Int, index: Int) -> String {
        return rE_Names[category][index]
    }
    
    static func getPName(category: Int, index: Int) -> String {
        return rP_Names[category][index]
    }
    
    static func getCount(category: Int) -> Int {
        if category == 7 {
            return 0
        }
        return rE_Names[category].count
    }
    
    static func getSoundURL(category: Int, index: Int, type: Int) -> URL {
        var name = rE_Names[category][index]
        let animalName = name.replacingOccurrences(of: " ", with: "_").lowercased()
        var soundName = ""
        if type == 0 {
            soundName = "e_\(animalName)"
        } else if type == 1 {
            soundName = "e_\(animalName)"
        } else if type == 2 {
            soundName = "p_\(animalName)"
        }
        print(soundName)
        return URL.init(fileURLWithPath: (Bundle.main.path(forResource: soundName, ofType: "mp3"))!)
    }
    
    static func getSoundURLByName(_ name: String, type: Int) -> URL {
        let animalName = name.replacingOccurrences(of: " ", with: "_").lowercased()
        var soundName = ""
        if type == 0 {
            soundName = "s_\(animalName)"
        } else if type == 1 {
            soundName = "e_\(animalName)"
        } else if type == 2 {
            soundName = "p_\(animalName)"
        }
        
        return URL.init(fileURLWithPath: (Bundle.main.path(forResource: soundName, ofType: "mp3"))!)
    }
    
    static func getActionSoundURL(ofType: Int) -> URL? {
        switch (ofType) {
        case 0: // Correct Answer
            return URL.init(fileURLWithPath: (Bundle.main.path(forResource: "action_sound_right_answer", ofType: "mp3"))!)
        case 1: // Wrong Answer
            return URL.init(fileURLWithPath: (Bundle.main.path(forResource: "action_sound_skip", ofType: "mp3"))!)
        case 2: //Level Victory
            return URL.init(fileURLWithPath: (Bundle.main.path(forResource: "action_sound_level_victory", ofType: "mp3"))!)
        case 3: //Game Victory
            return URL.init(fileURLWithPath: (Bundle.main.path(forResource: "action_sound_game_victory", ofType: "mp3"))!)
        case 4: // Quit
            return URL.init(fileURLWithPath: (Bundle.main.path(forResource: "action_sound_quit", ofType: "mp3"))!)
        default:
            return nil
        }
    }
    
}

class Animal {
    public var eName : String?
    public var pName : String?
    public var isCartoon = false
}
