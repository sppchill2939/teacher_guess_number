// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'game.dart';

void main() {
  const maxRandom = 100;
  var game = Game();
  var endGame = false;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and $maxRandom: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else if (result == 0) {
      var count = game.guessCount;
      print('║ ➜ $guess is CORRECT ❤, total guesses: $count');
      print('╟────────────────────────────────────────');

      var wantToPlay = false;
      do {
        stdout.write('Play again? (Y/N): ');
        var input = stdin.readLineSync();
        if (input == 'Y' || input == 'y') {
          game = Game();
          wantToPlay = true;
        } else if (input == 'N' || input == 'n') {
          endGame = true;
          break;
        }
      } while (!wantToPlay);

    }
  } while (!endGame);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}
