//
//  Enum-Cases.swift
//  CreativeApp
//
//  Created by Calil Hall on 1/31/24.
//


    enum Categories: String {
            case MuseMe
            case Perfectionalism
            case SelfDoubt
            case Burnout
            case Anxiety
            case Inspiration
            

            var associatedPrompts: [Prompt] {
                switch self {
                case .MuseMe:
                        Prompt.allCases
                    
                case .Perfectionalism:
                    [.unfinishedMasterpiece, .misfitMagic,.speedFrenzy,.blindFolded,.artSwap]
                case .Burnout:
                    [.blastfromthePast,.sensorySymphony,.magnifytheMundane,.colorSwap,.PassthePassion]
                case .Anxiety:
                    [.breatheEasy,.imperfectlyPerfect,.braveHeart,.gratitudeSpark,.tinyTriumphs]
                case .SelfDoubt:
                    [.shadowShowdown,.trophyCase,.myOwnHero,.whatIf,.collaborativeCourage]
                case .Inspiration:
                    [.goalVision,.joyReplay,.mindsEye,.dreamDestination,.innerMuse]
                }
            }
        }
        enum Prompt: String, CaseIterable {
           //Perfectionism 1-5
            case unfinishedMasterpiece =
                    "Unfinished Masterpiece: \n finish a work in progress"
            case misfitMagic =
                    "organized Mess: \n Take A mess and draw it"
            case speedFrenzy =
                    "Speed Frenzy: \n Set a timer and keep drawing until it runs out!"
            case blindFolded =
                    "Blindfolded: \n Draw a picture with your eyes closed"
            case artSwap =
                    "Art Swap: \n mix styles Unleash the unexpected!"
            
            //Burnout 6-10
            case blastfromthePast =
                    "Blast from the Past: \n Dig up old art supplies and play!"
            case sensorySymphony =
                    "Sensory Symphony: \n Let music inspire your brushstrokes"
            case magnifytheMundane =
                    "Magnify the Mundane: \n Draw a tiny treasure close-up"
            case colorSwap =
                    "Color Swap: \n Paint/draw a picture with a color pallete you have never used"
            case PassthePassion =
                    "Pass the Passion: \n Collaborate with a friend and build on each other's ideas"
            
            //Anxiety
            //11-15
            case breatheEasy =
                    "Breathe Easy: \n Imagine a calming place in your mind and illistrate it"
            case imperfectlyPerfect =
                    "Imperfectly Perfect: \n Expand on a accident in your art to make something new"
            case  braveHeart =
                    "Brave Heart: \n Draw your favorite superhero"
            case gratitudeSpark =
                    "Gratitude Spark: \n Illustrate a simple thing that brings you joy"
            case tinyTriumphs =
                    "Tiny Triumphs: \n Using a recent win in your life draw a big picture"
            
            // Self doubt
            //15-20
            case shadowShowdown =
                    "Shadow Showdown: \n Draw yourself conquering your fears as a monster"
            case trophyCase =
                    "Trophy Case: \n  Think several of your favorite accomplishments and create a collage"
            case myOwnHero =
               "My Own Hero: \n Draw yourself as a super hero "
            case whatIf =
                    "What if...: \n Draw a random scenario where something went better than expected"
            case collaborativeCourage =
                    "Collaborative Courage: \n Share your doubts with a friend and draw the solution together"
            
        //Inspiration
            case goalVision =
            "Goal Vision: \n Illustrate an artistic goal you're excited about achieving"
            case joyReplay =
            "Joy Replay: \n Capture a recent experience that made your heart sing"
            case mindsEye =
            "Mind's Eye: \n Catch Draw the last fleeting thought that crossed your mind"
            case dreamDestination =
            "Dream Destination: \n Paint a picture of your ultimate artistic travel adventure"
            case innerMuse =
            "Inner Muse: \n Create a self-portrait in your most inspiring creative style"


        }





        var selectedCategory : Categories = .Anxiety


//enum Categories {
//   case Perfectionalism
//    case SelfDoubt
//    case Burnout
//    case Anxiety
//    case Inspiration
//}
//enum Prompts {
//    case
//}
