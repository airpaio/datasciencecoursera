rankall <- function(outcome, num = "best") {
    ## Read outcome data
    outcomeDf <- read.csv("outcome-of-care-measures.csv", 
                          colClasses = "character")
    
    
    # column - name
    #   11   - heart attack
    #   17   - heart failure
    #   23   - pneumonia
    outcomeDf[,11] <- suppressWarnings(as.numeric(outcomeDf[,11]))
    outcomeDf[,17] <- suppressWarnings(as.numeric(outcomeDf[,17]))
    outcomeDf[,23] <- suppressWarnings(as.numeric(outcomeDf[,23]))
    
    # table of the number of hospitals from each state
    stateObsDf <- data.frame(State = names(tapply(outcomeDf$State,
                                                  outcomeDf$State, length)), 
                             Freq = tapply(outcomeDf$State, 
                                           outcomeDf$State, length))
    rownames(stateObsDf) <- NULL
    
    # implement 'outcome' inputs as strings
    outcomesDf <- data.frame(Outcome = c("heart attack", "heart failure", "pneumonia"), 
                             Col = c(11, 17, 23))
    
    
    ## Check that outcome is valid
    if (!(is.element(outcome, outcomesDf$Outcome)))
        stop("invalid outcome")
    
    ## For each state, find the hospital of the given rank
    hospitalNames <- character(0)
    for (state in stateObsDf$State) {
        singleStateDf <- outcomeDf[outcomeDf$State == state, ]
        col <- outcomesDf[outcomesDf$Outcome == outcome, 2]
        singleStateDf <- singleStateDf[complete.cases(singleStateDf[,col]), ]
        singleStateDf <- singleStateDf[order(singleStateDf[,col],
                                             singleStateDf$Hospital.Name), ]
    
    
        # convert "best" and "worst" to the appropriate numerical values
        if (num == "best") 
            rabking <- 1
        else if (num == "worst") 
            ranking <- nrow(singleStateDf)
        else
            ranking <- suppressWarnings(as.numeric(num))
    
        # get names of hospitals in the ranking
        hospitalNames <- c(hospitalNames, singleStateDf[ranking, ]$Hospital.Name)
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    return(data.frame(hospital = hospitalNames, state = stateObsDf$State))
    
}