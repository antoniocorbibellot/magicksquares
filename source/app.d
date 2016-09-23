import std.stdio;
import square;

void main()
{
	writeln("Edit source/app.d to start your project.");

    for (int n = 3; n < 7; n += 2) {
      Square s = new Square (n);
      s.computeValues;
      writeln ("\n",s);
      writefln ("sum row[0] = %d", s.sumRow(0));
      writefln ("sum row[%d] = %d", n-1, s.sumRow(n-1));

      writefln ("sum col[0] = %d", s.sumColumn(0));
      writefln ("sum col[%d] = %d", n-1, s.sumColumn(n-1));

      writefln ("sum diagA = %d", s.sumDiagA);
      writefln ("sum diagB = %d", s.sumDiagB);
    }
}
