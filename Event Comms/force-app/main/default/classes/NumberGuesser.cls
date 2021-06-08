public with sharing class NumberGuesser {
    private Integer actualNumber;
    private Integer lastGuess;
    private Integer lowLimit = 1;
    private Integer highLimit = 1000;

    public NumberGuesser() {
        this.actualNumber = Integer.valueOf(Math.random() * 999) + 1;
    }
 
    public NumberGuesser(Integer seedNumber) {
        if (number < 0 || number > 1000) {
            throw new NumberGuesserException('Number must be between 1 and 1000.');
        }
        this.actualNumber = seedNumber;
    }

    public guessNumber(Integer limits) {
        Integer totalGuesses = 0;
        Boolean success = false;
        Boolean numberHigher = false;
        while (totalGuesses <= limits) {
            if (lastGuess != null && numberHigher) {
                lowLimit = lastGuess;
            } else {
                highLimit = lastGuess;
            }

            lastGuess = (highLimit + lowLimit) / 2;
            totalGuesses++;
        }
    }



    public class NumberGuesserException extends Exception {}
}
