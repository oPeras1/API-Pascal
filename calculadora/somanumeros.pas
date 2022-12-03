var respostasomanum:string;
    tiposoma,numdef,loopsoma,somatotal,yautalsoma:integer;
    opcoesescolhiveissoma:array[1..4] of string;

procedure SomaNumeros;
  begin
       Beep(700,50);
       respostasomanum:='s';
       repeat
          window(1,1,WindMaxX,WindMaxY);
          stringfinal:='/____/\____/_/ /_/ /_/\__,_/   \__,_/\___/  /_/ |_/\__,_/_/ /_/ /_/\___/_/   \____/____/  ';
          textbackground(lightgray);
          textcolor(black);
          clrscr;
          cursoroff; //desativa o cursor
          writeln;
          writeln;
          lenghtescolha:=(WindMaxX - Length(stringfinal)) div 2+10;
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('   _____                              __        _   __  __                                ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('  / ___/____  ____ ___  ____ _   ____/ /__     / | / /_/_/_____ ___  ___  _________  _____');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('  \__ \/ __ \/ __ `__ \/ __ `/  / __  / _ \   /  |/ / / / / __ `__ \/ _ \/ ___/ __ \/ ___/');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln(' ___/ / /_/ / / / / / / /_/ /  / /_/ /  __/  / /|  / /_/ / / / / / /  __/ /  / /_/ (__  ) ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln(stringfinal);
	  Delay(100);
          writeln;
          writeln;
          writeln;
          im1:=1;
          yautalsoma:=WhereY;
          opcoesescolhiveissoma[1]:='Soma de Números Pares';       //Definir todas as opções
          opcoesescolhiveissoma[2]:='Soma de Números Ímpares';
          opcoesescolhiveissoma[3]:='Soma de Quaisquer Números';
          opcoesescolhiveissoma[4]:='Voltar';
          while (im1<=length(opcoesescolhiveissoma)) do  //'Animação' das opções disponiveis e o seu centramento
            begin
              writeln;
              writelnxy(opcoesescolhiveissoma[im1],0,WhereY);
              Delay(100);
              im1:=im1+1;
            end;
          TextColor(cyan);
          writelnxy(opcoesescolhiveissoma[1],0,12);
          tiposoma:=MenuCimaBaixo(opcoesescolhiveissoma,10);
          if (tiposoma=4) then
            respostasomanum:='n'
          else
            begin
              Beep(700,50);
              window(1,yautalsoma,WindMaxX,WindMaxY);
              clrscr;
              somatotal:=0;
              stringfinal:=opcoesescolhiveissoma[tiposoma];
              writeln;
              textcolor(cyan);
              GotoXY((WindMaxX-length(stringfinal)) div 2,WhereY);
              writeln(opcoesescolhiveissoma[tiposoma]);
              textcolor(black);
              writeln;
              writeln;
              repeat
                GotoXY(lenghtescolha-10,WhereY);
                cursoron;
                write('Introduza o número final da soma (subtração em caso de números negativos): ');
                readln(numdef);
                writeln;
                writeln;
                if (numdef<=1) and (numdef>=-1) then
                  begin
                    textcolor(red);
                    stringfinal:='________________Apenas são aceites números maiores que 1 ou menores que -1________________';
                    GotoXY((WindMaxX-length(stringfinal)) div 2,WhereY-1);
                    writeln('________________                                                          ________________');
                    GotoXY((WindMaxX-length(stringfinal)) div 2,WhereY);
                    writeln(stringfinal);
                    writeln;
                    writeln;
                    textcolor(black);
                  end;
              until (numdef>=2) or (numdef<=-2);
              for loopsoma:=1 to Abs(numdef) do //caso o numero seja negativo, tornalo positivo
                  begin
                    if (tiposoma=1) then//soma num pares
                      begin
                        if ((loopsoma mod 2)=0) then
                          somatotal:=somatotal+loopsoma;
                      end
                    else if (tiposoma=2) then//soma num impares
                      begin
                        if ((loopsoma mod 2)<>0) then
                          somatotal:=somatotal+loopsoma;
                      end
                    else                      //soma quaisquer numeros
                      begin
                        somatotal:=somatotal+loopsoma
                      end;
                  end;
              if (numdef<0) then
                begin
                  somatotal:=somatotal*(-1); //tornar em subtracao de numeros negativos
                end;
              GotoXY(lenghtescolha-10,WhereY);
              writeln('A ',opcoesescolhiveissoma[tiposoma],' até ao número ',numdef,' é ',somatotal);
              GotoXY(lenghtescolha-10,WhereY+2);
              write('Pretende repetir? (S/N) ');
              readln(respostasomanum);
            end;
       until (lowercase(respostasomanum)<>'s');
       cursoroff;
       Beep(300,50);
       window(1,1,WindMaxX,WindMaxY);
  end;

