import random
import sys

print('Welcome to RPS')
moves: dict = {'rock': 'R','paper':'P' , 'scissor':'S'}
valid_moves: list[str] = list(moves.keys())

while True:
    user_move: str = input("Rock , paper , or scissors? >> ").lower()

    if  user_move == 'exit':
        print('Thanks for playing')
        sys.exit()

    if user_move not in valid_moves:
        print('Invalid move')
        continue

        #AI decides
        ai_moves: str = random.choice(valid_moves)

        print('------')
        print(f'You:{moves[user_move]}')
        print(f'AI:{moves[ai_move]}')
        print('------')

#Check moves
if user_move == ai_moves:
    print('Its is a tie')
elif user_move == 'rock' and ai_moves == "scissors":
    print('You win')
elif user_move == 'scissors' and ai_moves == "paper":
    print('You win')
elif user_move == 'paper' and ai_moves == "rock":
    print('You win')
else:
    print('AI wins')