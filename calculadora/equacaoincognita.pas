var respostaincognita,existe:string;
    a,b,c,resultado1,resultado2:real;

procedure Incognita;
  begin
    Beep(700,50);
    respostaincognita:='s';
    stringfinal:='/___/_/ /_/\___/\____/\__, /_/ /_/_/\__/\__,_/  ';
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    writeln;
    writeln;
    lenghtescolha:=(WindMaxX+1 - Length(stringfinal)+3) div 2+10;
    GotoXY(lenghtescolha-10,WhereY);
    writeln('    ____             __              _ __       ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   /  _/___  _______/_/ ____ _____  (_) /_____ _');
    GotoXY(lenghtescolha-10,WhereY);
    writeln('   / // __ \/ ___/ __ \/ __ `/ __ \/ / __/ __ `/');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(' _/ // / / / /__/ /_/ / /_/ / / / / / /_/ /_/ / ');
    GotoXY(lenghtescolha-10,WhereY);
    writeln(stringfinal);
    GotoXY(lenghtescolha-10,WhereY);
    writeln('                     /____/');
    writeln;
    writeln;
    window(1,WhereY,WindMaxX,WindMaxY);
    repeat
      clrscr;
      somamedia:=0;
      writeln;
      writeln;
      GotoXY(lenghtescolha-10,WhereY);
      writeln('Resolver Equações do tipo ax² + bx + c = 0');
      writeln;
      writeln;
      GotoXY(lenghtescolha-5,WhereY);
      cursoron;
      write('Valor de a: ');
      readln(a);
      writeln;
      GotoXY(lenghtescolha-5,WhereY);
      write('Valor de b: ');
      readln(b);
      writeln;
      GotoXY(lenghtescolha-5,WhereY);
      write('Valor de c: ');
      readln(c);
      writeln;
      writeln;
      GotoXY(lenghtescolha-10,WhereY);
      textcolor(green);
      if (a<>0) then //Equacao do 2º grau
        begin
          if (sqr(b)-4*a*c)<0 then
            begin
              textcolor(red);
              existe:='nenhum';
            end
          else if (sqr(b)-4*a*c)=0 then
            begin
              existe:='um';
              resultado1:=-b/(2*a)
            end
          else
            begin
              existe:='dois';
              resultado1:=(-b+sqrt((sqr(b)-4*a*c)))/(2*a);
              resultado2:=(-b-sqrt((sqr(b)-4*a*c)))/(2*a);
            end;
          write('A equação ',a:0:2,'x²',' + ',b:0:2,'x + ',c:0:2,' = 0')
        end
      else //equacao do 1º grau
        begin
          existe:='um';
          resultado1:=(-c)/b;
          write('A equação ',b:0:2,'x + ',b:0:2,' = 0');
        end;
      if (existe='nenhum') then
        begin
          writeln(' não tem nenhuma solução...');
          textcolor(black);
        end
      else if (existe='um') then
        begin
          writeln(' tem uma solução:');
          writeln;
          GotoXY(lenghtescolha-5,WhereY);
          textcolor(black);
          writeln('x=',resultado1:0:2);
        end
      else
        begin
          writeln(' tem duas soluções:');
          writeln;
          GotoXY(lenghtescolha-5,WhereY);
          textcolor(black);
          writeln('x=',resultado1:0:2,'      ou      x=',resultado2:0:2);
        end;
      writeln;
      writeln;
      GotoXY(lenghtescolha-10,WhereY);
      write('Pretende resolver outra equação? (S/N) ');
      readln(respostaincognita);
    until (lowercase(respostaincognita)<>'s');
    cursoroff;
    Beep(300,50);
    window(1,1,WindMaxX,WindMaxY);
  end;
