//
//  Info.swift
//  learningenglish
//
//  Created by YakovAlexey on 1/5/18.
//  Copyright © 2018 coindevelopment. All rights reserved.
//

import UIKit

class Info: NSObject {
    
    static let rE_Names = [["plate", "steel wool", "sink", "mug", "jar", "glass", "freezer", "dishwasher", "dough", "garbage bag",
                            "garbage can", "ice cube tray", "island", "jug", "kettle", "knife", "knife sharpener", "leftover", "meet grinder", "mold",
                            "mop", "mortar and pestle", "napkin", "papertowel", "refrigerator", "rice_cooker", "salt", "sieve", "skewer", "skillet",
                            "sponge", "spoon", "tablespoon", "tea_cup", "teapot", "teaspoon", "pressure_cooker", "grinder", "microwave oven", "table",
                            "apron", "blender", "bottle", "bowl", "dish_soap", "broom", "can", "can_opener", "china", "cook",
                            "cook_book", "cup", "cupboard", "cutting_board", "dish", "dish_rack", "fork", "ice_bucket", "steamer", "stove",
                            "toaster", "tray"],
                           ["accountant", "actor", "actress", "athlete", "author", "baker", "banker", "barber", "beautician", "broker",
                            "burglar", "butcher", "carpenter", "chauffeur", "chef", "clerk", "craftman", "criminal", "crook", "dentist",
                            "doctor", "editor", "engineer", "farmer", "fire_fighter", "fisherman", "judge", "lawyer", "magician", "mechanic",
                            "musician", "nurse", "pastor", "poet", "policeman", "politician", "priest", "professor", "rabbi", "sailor",
                            "salesman", "shoemaker", "soldier", "tailor", "teacher", "veterinarian", "waiter", "waitress", "watch_maker"],
                           ["belt", "blouse", "boots", "cap", "cardigan", "clogs", "coat", "dress", "gloves", "hat",
                            "high_heel_shoes", "jacket", "jeans", "jumper", "mini_skirt", "overall", "overcoat", "pajamas", "pants", "pantyhose",
                            "raincoat", "rubber_boots", "sandals", "scarf", "shirt", "shoes", "shorts", "skirt", "slacks", "slippers",
                            "sneakers", "socks", "steel_toed_shoes", "stocking", "suit", "sweat_shirt", "sweater", "t_shirt", "tie", "training_shoes",
                            "trousers", "underclothes", "underpants", "undershirt", "vest"],
                           ["ankle", "arm", "back", "beard", "blood", "body", "bone", "brain", "cheek", "chest",
                            "chin", "ear", "elbow", "eye", "face", "feet", "fingers", "flesh", "foot", "hair",
                            "hand", "head", "heart", "hip", "knee", "leg", "lip", "moustache", "mouth", "muscle",
                            "nail", "neck", "nose", "shoulder", "skin", "stomach", "throat", "thumb", "toe", "tongue",
                            "tooth", "wrist"],
                           ["airport", "apartment", "bakery", "bank", "barber_shop", "book_store", "bowling_alley", "bus_terminal", "cafe", "castle",
                            "cathedral", "church", "cinema", "convenience_store", "department_store", "drawbridge", "dungeon", "fire_department", "gas_station", "hospital",
                            "house", "library", "lighthouse", "moat", "mosque", "movie_theater", "museum", "office_building", "palace", "post_office",
                            "restaurant", "school_building", "shopping_mall", "shrine", "supermarket", "temple", "tower", "train_station", "watch_tower"],
                           ["apple", "apricot", "asparagus", "banana", "beans", "broccoli", "cabbage", "carrot", "cauliflower", "celery",
                            "cereal", "cheese", "cherry", "corn", "cucumber", "egg", "eggplant", "fig", "fish", "grape",
                            "grapefruit", "green_pepper", "kiwi", "lemon", "lettuce", "lime", "melon", "nectarine", "okra", "onion",
                            "pasta", "peach", "peanut", "pear", "peas", "persimmon", "pineapple", "plum", "pomegranate", "potato",
                            "pumpkin", "radish", "raspberry", "rice", "salad", "sandwich", "shrimp", "spinach", "sprouts", "strawberry",
                            "toast", "tomato", "watermelon"],
                           ["amber", "beige", "black", "blue", "brown", "cyan", "gray", "green", "indigo", "khaki",
                            "light_blue", "orange", "pink", "purple", "red", "violet", "violet_red", "white", "yellow", "yellow_green"]]
    
    static let rP_Names = [["دیس", "سیم ظرفشویی", "لگن ظرفشویی", "فنجان بزرگ", "ظرف شیشه‌ای در دار", "لیوان", "سردساز، فریزر", "ماشین ظرفشویی", "خمیر", "کیسه زباله",
                            "سطل‌ زباله", "قالب یخ ", "جزیره‌ آشپزخانه", "پارچ", "کتری", "چاقو", "چاقو تیزکن", "ته‌مانده غذا", "چرخ گوشت", "قالب",
                            "زمین شور", "دسته و کاسه هاون", "دستمال", "کاغذ حولهای", "یخچال", "پلوپز", "نمک", "الک، صافی", "سیخ", "ماهیتابه",
                            "اسفنج", "قاشق", "قاشق غذاخوری", "فنجان چای", "قوری", "قاشق چای خوری", "زودپز", "آسیاب", "اجاق ماکروفر", "میز",
                            "پیشبند", "مخلوط کن", "بطری", "کاسه", "مایع ظرفشویی", "جارو", "قوطی‌ کنسرو", "در باز کن قوطی‌", "ظرف چینی‌", "آشپز",
                            "کتاب آشپزی", "فنجان", "قفسه", "تخته خردکن", "بشقاب", "جا بشقابی", "چنگال", "سطل‌ یخ", "بخارپز", "اجاق گاز ",
                            "سوخاری ساز", "سینی"],
                           ["حسابدار", "هنرپیشه مرد", "هنرپیشه زن", "ورزشکار", "نویسنده", "نانوا", "بانکدار", "سلمانی", "آرایشگر", "کارگزار",
                            "دزد", "قصاب", "نجار", "راننده", "آشپز", "کارمند", "استادکار صنعتگر", "مجرم", "خلاف کار", "دندانپزشک",
                            "پزشک", "ویراستار", "مهندس", "کشاورز", "آتش نشان", "ماهیگیر", "قاضی", "وکیل", "جادوگر", "مکانیک",
                            "موسیقیدان", "پرستار", "مبلغ دینی", "شعر", "پلیس", "سیاستمدار", "کشیش", "دانشمند، پروفسور", "روحانی یهودی", "ملوان",
                            "فروشنده", "کفّاش", "سرباز", "خیاط", "معلم", "دامپزشک", "خدمتکار مرد", "خدمتکار زن", "ساعت ساز"],
                           ["کمربند", "بلوز", "پوتین", "کلاه لبه در", "ژاکت", "کفش جلو بسته", "پالتو، اورکت", "لباس مجلسی", "دستکش", "کلاه",
                            "کفش پاشنه بلند", "ژاکت", "شلوار جین", "بلوز راحتی‌", "دامن کوتاه", "سرتاسری", "اورکت، پالتو", "پیژامه", "شلوار", "شلوار جورابی",
                            "بارانی", "چکمه لاستیکی", "دمپائی", "روسری", "پیراهن", "کفش", "شلوارک", "دامن", "شلوار گشاد و راحت", "دمپائی لا انگشتی",
                            "کتانی ورزشی ", "جوراب", "کفش پنجه آهنی", "جوراب ساقه بلند", "کت شلوار", "عرقگیر", "گرمکن", "تیشرت", "کروات", "کفش ورزشی",
                            "شلوار", "لباس زیر", "زیر شلواری", "زیر پیراهنی", "جلیقه"],
                           ["مچ پا", "بازو", "پشت", "ریش", "خون", "بدن", "استخوان", "مغز", "گونه", "سینه",
                            "چانه", "گوش", "آرنج", "چشم", "صورت", "پاها", "انگشتان", "گوشت", "پا", "مو",
                            "دست", "سر", "قلب", "باسن", "زانو", "پا", "لب", "سیبیل", "دهان", "عضله‌",
                            "ناخن", "گردن", "دماغ", "شانه", "پوست", "معده، شکم", "گلو", "شصت دست", "شصت پا", "زبان",
                            "دندان", "مچ دست"],
                           ["فرودگاه", "آپارتمان", "نانوائی", "بانک", "آرایشگاه مردانه", "کتاب فروشی", "باشگاه بولینگ", "پایانه اتوبوس رانی ", "کافه", "قلعه",
                            "گنبد و طاق نما", "کلیسا", "سینما", "بقالی", "بخش فروشگاهی", "پل متحرک", "سیاه چال، زندان", "آتش نشانی‌", "پمپ بنزین", "بیمارستان",
                            "خانه", "کتابخانه", "فانوس دریأیی", "خندق", "مسجد", "سالن نمایش", "موذ ه", "ساختمان اداری", "قصر", "دفتر پست",
                            "رستوران", "مدرسه", "مرکز فروش", "محراب، عبادتگاه", "سوپر مارکت، مغازه بزرگ", "معبد", "برج", "ایستگاه قطار", "برجک دیدبانی"],
                           ["سیب", "زرد آلو", "مارچوبه", "موز", "حبوبات", "کلم بروکلی", "کلم", "هویج", "گل کلم", "کرفس",
                            "خوراک غله", "پنیر", "گیلاس", "ذرت", "خیار", "تخم مرغ", "بادمجان", "انجیر", "ماهی‌", "انگور",
                            "گریپ فروت", "فلفل سبز", "کیوی", "لیمو ترش زرد", "کاهو", "لیمو ترش سبز", "طالبی", "شلیل", "بامیه", "پیاز",
                            "ماکارونی‌", "هلو", "بادم زمینی‌", "گلابی", "نخود", "خرمالو", "آناناس", "آلو", "انار", "سیب زمینی‌",
                            "کدو حلوا", "تربچه", "تمشک", "برنج", "سالاد", "ساندویچ", "میگو", "اسفناج", "جوانه گندم", "توت فرنگی‌",
                            "سوخاری", "گوجه فرنگی‌", "هندوانه"],
                           ["کهربائی", "بژ", "سیاه", "آبی‌", "قهوه ای", "فیروزه ای", "خاکستری", "سبز", "لاجوردی", "خاکی ",
                            "آبی روشن", "نارنجی", "صورتی", "ارغوانی", "قرمز", "بنفش", "قرمز بنفش گون", "سفید", "زرد", "سبز زرد گون"]]
    
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
