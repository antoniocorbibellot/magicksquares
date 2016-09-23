module square;

import std.stdio;
import std.algorithm: each;
import std.range: iota;

class Square
{
  // The magick square
  private int[][] matrix;

  /**
   * Parameters:
   * n = must be odd.
   */
  public this (int n) {
    assert (n > 0);
    assert (n % 2 != 0);

    matrix = new int[][n];    
    //foreach (ref r; matrix)  r = new int[n];

    matrix.each!((ref r) => r = new int[n]);
  }

  public void computeValues () {
    int nr = cast(int) matrix.length;
    int ne = cast(int) nr^^2;
    int i = ((nr-1)/2)-1;
    int j = ((nr+1)/2)-1;

    // Set first pos to 1
    matrix[i][j] = 1;
    
    // And the rest of values.
    iota (2, ne+1).each! ( (e) {
        i = i-1 < 0 ? nr-1 : i-1;
        j = j+1 == nr ? 0 : j+1;
        debug writeln ("Placing ",e,"@[", i, ",", j, "]");
        if (matrix[i][j] != 0) { // New place is not free!
          i = i-1 < 0 ? nr-1 : i-1;
          j = j-1 < 0 ? nr-1 : j-1;
        }
        matrix[i][j] = e;
      }
      );
  }
  
  public override string toString () {
      import std.format;
      import std.array : appender, replicate;
      import std.range : repeat;
    
      auto writer = appender!string();
      auto n = matrix.length;
    
      formattedWrite (writer, "[%d X %d]\n", n, n);
      formattedWrite (writer, "-".replicate(6*matrix.length)~"\n");
      for(int r = 0 ; r < matrix.length; r++) {
        for (int c = 0 ; c < matrix[r].length; c++) {
          formattedWrite (writer, "[%4s]", matrix[r][c]);
          //writeln ("ncol: ", matrix[r][c]);
        }
        formattedWrite (writer, "\n");
      }
      formattedWrite (writer, "-".replicate(6*matrix.length)~"\n");
    
      return writer.data;
    }

    public size_t sumColumn (int c) {
      assert ((c < matrix.length) && (matrix.length > 0));

      size_t s;
      iota (matrix.length).each!(r => s += matrix[r][c]);

      return s;
    }
    public size_t sumRow (int r) {
      assert ((r < matrix.length) && (matrix.length > 0));

      size_t s;
      /*for (int c = 0; c < matrix.length; c++)
        s += matrix[r][c];*/

      iota (matrix.length).each!(c => s += matrix[r][c]);

      return s;
    }
    public size_t sumDiagA () {
      assert (matrix.length > 0);

      size_t s;
      /*for (int i = 0; i < matrix.length; i++)
        s += matrix[i][i];*/
      iota (matrix.length).each!(i => s += matrix[i][i]);

      return s;
    }
    public size_t sumDiagB () {
      assert (matrix.length > 0);

      int c = cast(int) matrix.length - 1;
      size_t s;
      /*for (int i = 0; i < matrix.length; i++) {
        s += matrix[i][c-i];
        //writefln ("matrix[%d][%d]=%d, s = %d", i, c-i, matrix[i][c-i], s);
        }*/
      iota (matrix.length).each!(i => s += matrix[i][c-i]);

      //writefln ("diagB returns: %d", s);
      return s;
    }

  }
