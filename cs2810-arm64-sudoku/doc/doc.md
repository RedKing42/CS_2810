Now it is time to write the solver. It will work as follows:

*   Check for conflicts on the board. If a conflict is found, return
    1 for failure

*   Find a blank cell on the board. If not found, return 0
    for success—the board is solved

*   for each n from 1 to 9:

    *   write n in the cell we found earlier
    *   see if we can solve the rest of the board with that value
        written in the cell.
    *   if so, return 0 for success (ending the loop early)

*   no solution was possible, so write 0 back to the cell and return
    1 for failure

This is a recursive solution: each call to search places one number
on the board and then asks if the rest of the board can be solved
with that number in place. If not, it tries another value in that
cell until all possibly values have been tried. If the board cannot
be solved with any value in that cell, then the mistake must have
happened earlier so it gives up and returns failure.

As soon as success is detected, it returns and leaves the numbers
written in the cells. Whenever it detects failure, it erases the
cell that it wrote to and returns. This implies:

*   When the solver is successful, it will return 0 and the board
    will be fully solved
*   When the solver fails, it will return 1 and the board will be
    the same as it was before the solver started working (it undoes
    the speculative numbers it writes in)
*   If multiple solutions are possible, it will only find one.

Here is pseudocode that implements this search:

```
def solve(board):
    if has_conflict(board) != 0:
        return 1
    for i = 0; i < 81; i++
        if board[i] != 0:
            continue
        for n = 1; n < 10; n++
            board[i] = n
            if solve(board) == 0:
                return 0
        board[i] = 0
        return 1
    return 0
```

`start.s` provides a test case with a board that is already solved.
Your solver should detect that it is solved (by not finding any
blank cells) and return 0.

To test it further, replace one of the cells with 0 and run your
solver again. It should find that blank cell, iterate through the
possible values until it finds the correct one, and then return 0 to
indicate success.

To test it further, replace another cell with 0 so the search has to
fill in two cells. Then try it with several more cells zeroed out.

Find a Sudoku puzzle somewhere and put its initial board into
`start.s`. Let your solver find the solution and use the debugger to
examine it.

Finally, run the unit tests.
