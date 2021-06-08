public with sharing class NumberGuesser {
    private Integer actualNumber;
    private Integer lastGuess;
    private Integer lowLimit = 1;
    private Integer highLimit = 1000;

    public NumberGuesser() {
        this.actualNumber = Integer.valueOf(Math.random() * 999) + 1;
    }
 
    public NumberGuesser(Integer seedNumber) {
        if (seedNumber < 0 || seedNumber > 1000) {
            throw new NumberGuesserException('Number must be between 1 and 1000.');
        }
        this.actualNumber = seedNumber;
    }

    public void guessNumber(Integer limits) {
        Integer totalGuesses = 0;
        Boolean success = false;
        Boolean numberHigher = false;
        while (totalGuesses < limits) {
            if (lastGuess != null && numberHigher) {
                lowLimit = lastGuess;
            } else if (lastGuess != null) {
                highLimit = lastGuess;
            }

            lastGuess = (highLimit + lowLimit) / 2;
            totalGuesses++;
            String result = checkGuess();
            System.debug('The guess was ' + lastGuess + ' and the result was: ' + result);
            if (result == 'CORRECT') {
                success = true;
                break;
            } else {
                numberHigher = result == 'HIGHER';
            }
        }
        System.debug('Ran ' + totalGuesses + ' guesses.');
        String endMessage = success ? 'There was success!' : 'The system could not find the answer.';
        System.debug(endMessage);
    }


    private String checkGuess() {
        if (this.lastGuess == this.actualNumber) {
            return 'CORRECT';
        } else if (this.lastGuess < this.actualNumber) {
            return 'HIGHER';
        } else {
            return 'LOWER';
        }
    }

    public class NumberGuesserException extends Exception {}
}
