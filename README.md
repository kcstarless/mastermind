# Ruby: Mastermind

## 1. Description
Mastermind is a terminal based code breaking game. Player plays either as code Creator or code Guesser against computer opponent.  

## 2. Usage
1. Run the game:
``` ruby main.rb ```
2. Player will need to choose between Creator[1] or Guesser[2]:
```
WELCOME TO MASTERMIND!
Press [1] for Creator OR [2] for Guesser: 
```
3. Game Mode
    - <strong><i>Creator option</i><strong><br>
        Player creates the secret code and computer attempts to crack the code.
    - <strong><i>Guesser option</i></strong><br>
        Computer generates the secret code and player attempts to crack the code. 

## 3. Game Rules
- Player picks 4 colors from pool of 6 colors. 
- Player have 12 attempts to crack the code. 
- Each guess will show hint of two numbers ```2 1```
    - First number in white represents correct color and position.
    - Second number in grey rpresents correct color but out of position. 
- Current and previous guess will be displayed along with hints.
- If the secret code is cracked game will display message along with the secret code. 

## 4. Algorithm for computer to crack the code. 
1. Computer first attemps to get the four colors by randomly selecting a color from `#colorPool`.
    - First guess will pick four of the same color. It will hold resulting sum of two hint numbers. Eg. If first guess was red, red, red, red and resulting hint is `1 1`. Two red will be stored in `#colorMatch`.
    - Based on previous guess next color will be picked. This is repeated until the resulting size of `#colorMatch` is equals to 4. 

2. Once four colors are found program will try to crack the code by swapping different color position of `#colorMatch`

    - Last two, swap last two color position.
    - Middle two, swap middle two position.
    - First two, swap first two position.
    - First and last, swap first and last position.
    - 0 and 2 index, swap even index position.
    - 1 and 3 index, swap odd position.

Each guess will check with previuos hint result and if number of correct color and position is greater then it will keep the current guess in `#colorMatch` or else it will switch back previous version of `#colorMatch`.

This process is repeated until code is cracked or run out of number of rounds.

## 5. Thought on the project
This project took me longer than expected and more optimization can be done. 
One area I didn't look into was the [Knuth](https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind) algorith. I will implement this algorithm when I revisit this project.