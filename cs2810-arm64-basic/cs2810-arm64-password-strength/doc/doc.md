Many web sites and applications have specific requirements for
making strong passwords, such as requiring a letter, a digit, a
symbol, and between 8 and 12 characters. In practice, requirements
like these are usually a lowsy way to get people to use good
passwords, and people who actually understand security tend to avoid
them. They are also annoying to users.

While they are bad for security, they can make for an interesting
programming problem. Your task is to write a function that examines
a password (a string) and gives it a score. The following points
contribute to the overall score:

*   1 point if it contains a lower-case letter
*   1 point if it contains an upper-case letter
*   1 point if it contains a digit
*   1 point if it contains a non-alphanumeric symbol, i.e., anything
    besides letters and digits (this can include a space character)
*   1 point if it is 12 characters or longer
*   1 additional point if it is 16 characters or longer

The function is given a single parameter: the address of the
password in memory. The password will only contain printable ASCII
characters with values between 32 and 126, inclusive. The password
is terminated with a null byte, which is just a byte whose value is
zero.

The function should return the score for the password.

Here is pseudo-code for the function:

```
function strength(password):
    length = 0
    hasLower = 0
    hasUpper = 0
    hasDigit = 0
    hasSymbol = 0
    repeat {
        ch = password[length] (the byte at address password + length)
        if ch == 0 {
            break
        }
        length += 1
        if ch >= 'a' and ch <= 'z' {
            hasLower = 1
        } else if ch >= 'A' and ch <= 'Z' {
            hasUpper = 1
        } else if ch >= '1' and ch <= '9' {
            hasDigit = 1
        } else {
            hasSymbol = 1
        }
    }
    score = hasLower + hasUpper + hasDigit + hasSymbol
    if length >= 12 {
        score += 1
    }
    if length >= 16 {
        score += 1
    }
    return score
}
```
