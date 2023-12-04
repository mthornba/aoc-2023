#!/usr/bin/env awk -f

BEGIN {
  FS = "[:|]";
  sum = 0;
  ticketCount = 0;
  delete copies;
}

{
  value = 0;
  delete matches;
  split($1, cardNumArray, " ");
  cardNum = cardNumArray[2];
  split($2, winningNums, " ");
  split($3, myNums, " ");

  matches[cardNum] = 0;
  for (i in winningNums) {
    for (j in myNums) {
      if (winningNums[i] == myNums[j]) {
        matches[cardNum]++;
      }
    }
  }

  if(matches[cardNum] > 0) {
    value = 2 ** (matches[cardNum] - 1);
    sum = sum + value;
  }
if (!(cardNum in copies)) {
  copies[cardNum] = 1;
}

  for(i=cardNum+1; i<=cardNum+matches[cardNum]; i++) {
    if (!(i in copies)) {
      copies[i] = 1;
    }
    copies[i] = copies[i] + copies[cardNum];
  }

}

END {
  print "Total value: " sum;
  for(i=1; i<=length(copies); i++) {
    ticketCount = ticketCount + copies[i];
  }
  print "Ticket count: " ticketCount;
}
