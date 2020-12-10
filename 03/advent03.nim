import algorithm, parseutils, sequtils, strutils

const rows = block:
  var result : seq[string]
  for line in staticRead("input").splitLines:
    if line != "": result.add line
  result

proc getCrashCount(rSteps: int, dSteps: int): int =
  var colIndex: int = 0
  var rowIndex: int = 0
  var crashCount: int = 0
  while rowIndex < rows.len:
    if rows[rowIndex][colIndex mod rows[rowIndex].len] == '#':
      inc(crashCount)
    colIndex = colIndex + rSteps
    rowIndex = rowIndex + dSteps
  return crashCount


echo getCrashCount(3, 1)
echo getCrashCount(1, 1) * getCrashCount(3, 1) * getCrashCount(5, 1) * getCrashCount(7, 1) * getCrashCount(1, 2) 
