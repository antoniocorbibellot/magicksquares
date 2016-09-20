# magicksquares

This little program generates *magick squares* with an odd number of rows and columns.
It's written in the D programming language.

The kind of output generated is like this:
[3 X 3]
---------------------------
[   8][   1][   6]
[   3][   5][   7]
[   4][   9][   2]
---------------------------

## Algorithm

This simple algorithm works for odd sized squares. It's implemented in

```D
class Square
{
  // The magick square
  private int[][] matrix;
  ...
  public void computeValues () {...}
```

## Testing

I Should do more testing apart from using more functional style...

![Should I...](images/testfrytest.jpg)
