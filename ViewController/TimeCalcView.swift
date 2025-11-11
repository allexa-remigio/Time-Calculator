//
//  TimeCalcView.swift
//  TimeCalculator
//
//  Created by A R on 1/17/24.
//

import SwiftUI



struct TimeCalcView: View 
{
    @State var outp = ""
    @State var alert = "Invalid Input Format: Must be XX:XX + X..."
    @State var value = "0"
    @State var prevVal = ""
    @State var twelve = "12HR"
    @State var twenty = "24HR"
    @State var currHour = 0
    @State var currMin = 0
    @State var currVal = 0
    @State var opFlag = ""
    @State var format12 = true
    @State private var showAlert = false
    
    let love = ["Thank you for using this app!", "This is my first ever app", "Weewoooooo", "just practicing my free will", "Tbh this app isn't that impressive", "Why'd you click this? Huh?", "Why'd you download this?", "Eat up, nom nom nom", "I'm hungry! See ya later"]
    
    var body: some View
    {
        TextField("", text: showAlert ? $alert : $outp).onAppear {
            withAnimation{
                showAlert = false
            }
        }
            
        TextField("InputValue", text: $value)
            .disabled(true)
            .frame(height: 200.0)
            .font(.system(size: 100)) //set initial font size
            .multilineTextAlignment(.trailing) //aligns the text to the RIGHT SIDE ("trailing")
            .minimumScaleFactor(0.1) //dynamically scales font to show whole string in field by given factor (the smaller the number, the smaller the font can get)
        
        HStack(alignment: .center) {
            TextField("Format", text: format12 ? $twelve : $twenty).onAppear {
                withAnimation{
                    format12 = true
                }
            }
                .disabled(true)
                .font(.system(size: 30))
                .multilineTextAlignment(.trailing)
        }
        
       
        //CALCULATOR SECTION
        //first row
        HStack(alignment: .center, spacing: 5.0)
        {
            Button(action:
                    {
                value = "0"
                outp = ""
                prevVal = ""
                currHour = 0
                currMin = 0
                currVal = 0
                opFlag = ""
                format12 = true
                showAlert = false
            })
            {
                Image("c")
                    .resizable()
            }
            Button(action:
                    {
                withAnimation{
                    format12 = true
                }
            })
            {
                Image("12Hr")
                    .resizable()
            }
            
            Button(action:
                    {
                withAnimation{
                    format12 = false
                }
            })
            {
                Image("24Hr")
                    .resizable()
            }
            
            Button(action:
                    {
                if value.count <= 2 && value != "0" && prevVal == ""
                {
                    //add flag to make sure there is not another colon in the input
                    if let intVal = Int(value)
                    {
                        // Successfully converted to an integer
                        if intVal > 24
                        {
                            withAnimation 
                            {
                                showAlert = true //ADD ALERT FOR TOO HIGH OF INPUT
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                            value = "0"
                        }
                        else
                        {
                            currHour = intVal
                            value += ":"
                        }
                    }
                    else
                    {
                        // Failed to convert to an integer
                        withAnimation
                        {
                            showAlert = true
                        }
                        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                            withAnimation {
                                showAlert = false
                            }
                        }
                        value = "0"
                    }
                }
                else
                {
                    //too long XXX: is not a valid time format
                    withAnimation
                    {
                        showAlert = true
                    }
                    Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                        withAnimation {
                            showAlert = false
                        }
                    }
                    value = "0"
                }
                //if currHour > 12
            })
            {
                Image("colon")
                .resizable()
            }
        }
        
        //second row
        HStack(alignment: .center, spacing: 5.0)
        {
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"
                {
                    value = "7"
                }
                else if value.contains(":")
                {
                    let comp = value.split(separator: ":")
                    
                    if let lastComp = comp.last
                    {
                        let subCol = String(lastComp)
                        let charCount = subCol.count
                        
                        if charCount < 2
                        {
                            //this value is too high to be in minute format
                            if value.last != ":"
                            {
                                value += "7"
                                currMin += 7
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "7"
                }
            }){
                Image("seven")
                    .resizable()
            }
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"{
                    value = "8"}
                else if value.contains(":")
                {
                    let comp = value.split(separator: ":")
                    
                    if let lastComp = comp.last
                    {
                        let subCol = String(lastComp)
                        let charCount = subCol.count
                        
                        if charCount < 2
                        {
                            //this value is too high to be in minute format
                            if value.last != ":"
                            {
                                value += "8"
                                currMin += 8
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "8"
                }
            }){
                Image("eight")
                    .resizable()
            }
            
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"{
                    value = "9"}
                else if value.contains(":")
                {
                    let comp = value.split(separator: ":")
                    
                    if let lastComp = comp.last
                    {
                        let subCol = String(lastComp)
                        let charCount = subCol.count
                        
                        if charCount < 2
                        {
                            //this value is too high to be in minute format
                            if value.last != ":"
                            {
                                value += "9"
                                currMin += 9
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "9"
                }
            }){
                Image("nine")
                    .resizable()
            }
            
            Button(action:
                    {
                opFlag = "+"
                prevVal = value
                value += " +"
                outp += value
            })
            {
                Image("plus")
                    .resizable()
            }
        }
        
        //third row
        HStack(alignment: .center, spacing: 5.0)
        {
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"{
                    value = "4"}
                else if value.contains(":")
                {
                    if let colonIndex = value.firstIndex(of: ":")
                    {
                        let charAfCol = value.suffix(from: value.index(after: colonIndex))
                        let charCount = charAfCol.count
                        
                        if charCount < 2
                        {
                            value += "4"
                            if value.last == ":"
                            {
                                currMin += 40
                            }
                            else
                            {
                                currMin += 4
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "4"
                }
                }){
                Image("four")
                    .resizable()
            }
            
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"{
                    value = "5"}
                else if value.contains(":")
                {
                    if let colonIndex = value.firstIndex(of: ":")
                    {
                        let charAfCol = value.suffix(from: value.index(after: colonIndex))
                        let charCount = charAfCol.count
                        
                        if charCount < 2
                        {
                            value += "5"
                            if value.last == ":"
                            {
                                currMin += 50
                            }
                            else
                            {
                                currMin += 5
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "5"
                }
            }){
                Image("five")
                    .resizable()
            }
            
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"{
                    value = "6"}
                else if value.contains(":")
                {
                    let comp = value.split(separator: ":")
                    
                    if let lastComp = comp.last
                    {
                        let subCol = String(lastComp)
                        let charCount = subCol.count
                        
                        if charCount < 2
                        {
                            //this value is too high to be in minute format
                            if value.last != ":"
                            {
                                value += "6"
                                currMin += 6
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "6"
                }
            }){
                Image("six")
                    .resizable()
            }
            Button(action:
                    {
                opFlag = "-"
                prevVal = value
                value += " -"
                outp += value
            })
            {
                Image("minus")
                    .resizable()
            }
                
        }
        
        //fourth row
        HStack(alignment: .center, spacing: 5.0)
        {
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"
                {
                    value = "1"
                }
                else if value.contains(":")
                {
                    if let colonIndex = value.firstIndex(of: ":")
                    {
                        let charAfCol = value.suffix(from: value.index(after: colonIndex))
                        let charCount = charAfCol.count
                        
                        if charCount < 2
                        {
                            value += "1"
                            if value.last == ":"
                            {
                                currMin += 10
                            }
                            else
                            {
                                currMin += 1
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "1"
                }
            }){
                Image("one")
                    .resizable()
            }
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"{
                    value = "2"}
                else if value.contains(":")
                {
                    if let colonIndex = value.firstIndex(of: ":")
                    {
                        let charAfCol = value.suffix(from: value.index(after: colonIndex))
                        let charCount = charAfCol.count
                        
                        if charCount < 2
                        {
                            value += "2"
                            if value.last == ":"
                            {
                                currMin += 20
                            }
                            else
                            {
                                currMin += 2
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "2"
                }
            }){
                Image("two")
                    .resizable()
            }
            
            Button(action:
                    {
                if value == "0" || value.last == "+" || value.last == "-"
                {
                    value = "3"}
                else if value.contains(":")
                {
                    if let colonIndex = value.firstIndex(of: ":")
                    {
                        let charAfCol = value.suffix(from: value.index(after: colonIndex))
                        let charCount = charAfCol.count
                        
                        if charCount < 2
                        {
                            value += "3"
                            if value.last == ":"
                            {
                                currMin += 30
                            }
                            else
                            {
                                currMin += 3
                            }
                        }
                        else
                        {
                            withAnimation
                            {
                                showAlert = true
                            }
                            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                                withAnimation {
                                    showAlert = false
                                }
                            }
                        }
                    }
                }
                else{
                    value += "3"
                }
            }){
                Image("three")
                    .resizable()
            }
            Button(action:
                    {
                value = love.randomElement() ?? "Easter Egg: you suck"
            }){
                Image("sex")
                    .resizable()
            }
        }
        
        //fifth row
        HStack(alignment: .center, spacing: 5.0)
        {
            Button(action:
                    {
                if value.contains(":")
                {
                    if value.count <= 4
                    {
                        value += "0"
                    }
                }
                else if value != "0" || value.last == "+" || value.last == "-"
                {
                    value += "0"
                }
            }){
                Image("zero")
                    .resizable()
            }
            
             //WILL INPUT HR, MIN AND MAYBEEE S
            Button(action:
                    {
                //currHour & currMin
                if prevVal != "", let intVal = Int(value)
                {
                    outp += value
                    currVal = intVal
                    if opFlag == "+"
                    {
                        currVal += currMin
                        while currVal >= 60
                        {
                            currHour += 1
                            currVal -= 60
                            
                            if currHour >= 24
                            {
                                currHour -= 24
                            }
                        }
                    }
                    else if opFlag == "-"
                    {
                        currVal = currMin - currVal
                        while currVal < 0
                        {
                            currVal += 60
                            currHour -= 1
                            
                            if currHour < 0
                            {
                                currHour += 24
                            }
                        }
                    }
                    else
                    {
                        withAnimation
                        {
                            showAlert = true
                        }
                        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                            withAnimation {
                                showAlert = false
                            }
                        }
                    }
                    
                    //for 12
                    if format12
                    {
                        if currHour >= 13{
                            //amFlag = false
                            //meridian = "PM"
                            value = String(currHour-12) + ":"
                        }
                        else if currVal == 0
                        {
                            value = "12:"
                        }
                        else{
                            //amFlag = true
                            //meridian = "AM"
                            value = String(currHour) + ":"
                        }
                    }
                    else
                    {
                        value = String(currHour) + ":"
                    }
                    if currVal == 0
                    {
                        value += "0"
                    }
                    value += String(currVal)
                    currMin = currVal
                }
                
            }){
                Image("min")
                    .resizable()
            }
            
            Button(action:
                    {
                if prevVal != "", let intVal = Int(value)
                {
                    currVal = intVal
                    
                    if opFlag == "+"
                    {
                        currVal += currHour
                    }
                    else if opFlag == "-"
                    {
                        currVal = currHour - currVal
                    }
                    else
                    {
                        withAnimation
                        {
                            showAlert = true
                        }
                        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                            withAnimation {
                                showAlert = false
                            }
                        }
                    }
                    
                    if currVal >= 24
                    {
                        currVal %= 24
                    }
                    
                    if format12{
                        if currVal >= 13
                        {
                            //amFlag = false
                            //meridian = "PM"
                            value = String(currVal-12) + ":"
                        }
                        else if currVal == 0
                        {
                            value = "12:"
                        }
                        else
                        {
                            value = String(currVal) + ":"
                        }
                    }
                    else
                    {
                        //amFlag = true
                        //meridian = "AM"
                        value = String(currVal) + ":"
                    }
                    value += String(currMin)
                    currHour = currVal
                }
            }){
                Image("hr")
                    .resizable()
            }
        }
        
    }
    
}


#Preview {
    TimeCalcView()
}
