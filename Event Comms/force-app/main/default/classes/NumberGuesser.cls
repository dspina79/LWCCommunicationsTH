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


    public GuessResult guessNumber(Integer limits, Boolean debug) {
        GuessResult result = new GuessResult();
        Boolean numberHigher = false;
        while (result.NumberGuesses < limits) {
            if (lastGuess != null && numberHigher) {
                lowLimit = lastGuess;
            } else if (lastGuess != null) {
                highLimit = lastGuess;
            }

            lastGuess = (highLimit + lowLimit) / 2;
            result.NumberGuesses++;
            String guess = checkGuess();
            if (debug) {
                System.debug('The guess was ' + lastGuess + ' and the result was: ' + guess);
            }
            if (guess == 'CORRECT') {
                result.Success = true;
                break;
            } else {
                numberHigher = (guess == 'HIGHER');
            }
        }
        if (debug) {
            System.debug('Ran ' + result.NumberGuesses + ' guesses.');
            String endMessage = result.Success ? 'There was success!' : 'The system could not find the answer.';
            System.debug(endMessage);
        }
        return result;
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

    public class GuessResult {
        public Integer NumberGuesses;
        public Boolean Success;

        public GuessResult() {
            this.NumberGuesses = 0;
            this.Success = false;
        }
    }
    public class NumberGuesserException extends Exception {}
}
