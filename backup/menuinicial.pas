unit menuinicial;
interface

uses alarme, crt, windows;

procedure Iniciom;

implementation
  procedure Iniciom;
       begin
            clrscr;
            writeln();
            writeln();
            writeln('                                                 ____      __     _    ');
            writeln('                                                /  _/___  /_/____(_)___');
            writeln('                                                / // __ \/ / ___/ / __ \');
            writeln('                                              _/ // / / / / /__/ / /_/ /');
            writeln('                                             /___/_/ /_/_/\___/_/\____/');
            writeln;
            writeln;
            writeln;
            writeln('   Escolha a unidade de tempo pretendida (1, 2, 3): ');
            writeln;
            writeln('      o Segundos');
            writeln('      o Minutos');
            writeln('      o Horas');
            readkey;

       end;
end.
