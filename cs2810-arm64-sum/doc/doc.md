Compute the sum of two numbers in a function called `sum`:

    int64 sum(int64 a, int64 b) {
        return a + b;
    }

Recall that the first two parameters (a and b) will already be in x0
and x1 when sum is called. The results should be placed in x0 before
returning.

This is a leaf function (it does not call any other functions), so
you can leave the return address in the lr register until it is time
to return (no need to store it on the stack). Also, since there is
minimal need for registers, you can ignore the stack entirely.

To test your code, use:

    make test
