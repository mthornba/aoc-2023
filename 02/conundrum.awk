#!/usr/bin/env awk -f

BEGIN {
  bag["red"] = 12;
  bag["green"] = 13;
  bag["blue"] = 14;
  sum = 0;
  powerSum = 0;
}

{
  split($0, line, ":");
  game = line[1];
  data = line[2];
  split(game, b, " ");
  gameNum = b[2];
  possible = 1; # true to count round by default
  max["red"] = 0;
  max["green"] = 0;
  max["blue"] = 0;

  split(data, rounds, ";");
  for (i in rounds) {
    split(rounds[i], cubes, ",");
    for (j in cubes) {
      split(cubes[j], cube, " ");
      count = cube[1];
      colour = cube[2];
      if (count > bag[colour]) {
        possible = 0; # false
      };
      if (count > max[colour]) {
        max[colour] = count;
      }
    }
  }

  if (possible == 1) {
    sum = sum + gameNum;
  }

  power = max["red"] * max["green"] * max["blue"];
  powerSum = powerSum + power;
}

END{
  print "Part 1 sum: " sum;
  print "Part 2 power sum: " powerSum;
}
