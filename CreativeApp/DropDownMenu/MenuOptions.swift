//
//  MenuOptions.swift
//  CreativeApp
//
//  Created by Matthew Fails on 1/29/24.
//

import Foundation

// Remove the Categories enum declaration from here.

struct DropDownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
    let enumOption: Categories // Make sure this refers to the enum in Enum-Cases.swift

    static let prompts: [Categories: [String]] =  [
        .Inspiration: [
            "Goal Vision \n Illustrate an artistic goal you're excited about achieving",
            "Joy Replay \n Capture a recent experience that made your heart sing",
            "Mind's Eye \n Catch Draw the last fleeting thought that crossed your mind",
            "Dream Destination \n Paint a picture of your ultimate artistic travel adventure",
            "Inner Muse \n Create a self-portrait in your most inspiring creative style"
        ],
        .SelfDoubt: [
            "Shadow Showdown \n Draw yourself conquering your fears as a monster",
            "Trophy Case \n Think of several of your favorite accomplishments and create a collage",
            "My Own Hero \n Draw yourself as a super hero",
            "What if... \n Draw a random scenario where something went better than expected",
            "Collaborative Courage \n Share your doubts with a friend and draw the solution together"
        ],
        .Perfectionalism: [
            "Unfinished Masterpiece \n Finish a work in progress",
            "Misfit Magic \n Organized Mess - Take a mess and draw it",
            "Speed Frenzy \n Set a timer and keep drawing until it runs out!",
            "Blindfolded \n Draw a picture with your eyes closed",
            "Art Swap \n Mix styles to unleash the unexpected"
        ],
        .Burnout: [
            "Blast from the Past \n Dig up old art supplies and play",
            "Sensory Symphony \n Let music inspire your brushstrokes",
            "Magnify the Mundane \n Draw a tiny treasure close-up",
            "Color Swap \n Paint/draw a picture with a color palette you have never used",
            "Pass the Passion \n Collaborate with a friend and build on each other's ideas"
        ],
        .Anxiety: [
            "Breathe Easy \n Imagine a calming place in your mind and illustrate it",
            "Imperfectly Perfect \n Expand on an accident in your art to make something new",
            "Brave Heart \n Draw your favorite superhero",
            "Gratitude Spark \n Illustrate a simple thing that brings you joy",
            "Tiny Triumphs \n Using a recent win in your life, draw a big picture"
        ],
        .MuseMe: [
            // Add prompts specific for the MuseMe category if available
        ]
    ]

    static let creativeBlockOptions: [DropDownMenuOption] = [
           DropDownMenuOption(option: "Lack of inspiration", enumOption: .Inspiration),
           DropDownMenuOption(option: "Self doubt", enumOption: .SelfDoubt),
           DropDownMenuOption(option: "Perfectionism", enumOption: .Perfectionalism),
           DropDownMenuOption(option: "Burnout", enumOption: .Burnout),
           DropDownMenuOption(option: "Anxious", enumOption: .Anxiety),
           DropDownMenuOption(option: "Muse Me", enumOption: .MuseMe)
       ]
   }

