var respostac:string;
    opcoesescolhiveisc:array[1..4] of string;

{$I 'calculadora/operacoes.pas'}
{$I 'calculadora/media.pas'}
{$I 'calculadora/tabuada.pas'}

procedure Calculadora;
  begin
       Beep(700,50);
       respostac:='s';
       repeat
          stringfinal:='\____/\__,_/_/\___/\__,_/_/\__,_/\__,_/\____/_/   \__,_/';
          textbackground(lightgray);
          textcolor(black);
          clrscr;
          cursoroff; //desativa o cursor
          writeln;
          writeln;
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('   ______      __           __          __');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('  / ____/___ _/ /______  __/ /___ _____/ /___  _________ _');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln(' / /   / __ `/ / ___/ / / / / __ `/ __  / __ \/ ___/ __ `/');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('/ /___/ /_/ / / /__/ /_/ / / /_/ / /_/ / /_/ / /  / /_/ /');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln(stringfinal);
	  Delay(100);
          writeln;
          writeln;
          writeln;
          im1:=1;
          opcoesescolhiveisc[1]:='Opera��es';       //Definir todas as op��es
          opcoesescolhiveisc[2]:='M�dia';
          opcoesescolhiveisc[3]:='Tabuada';
          opcoesescolhiveisc[4]:='Voltar';
          while (im1<=length(opcoesescolhiveisc)) do  //'Anima��o' das op��es disponiveis e o seu centramento
            begin
              writeln;
              writelnxy(opcoesescolhiveisc[im1],0,WhereY);
              Delay(100);
              im1:=im1+1;
            end;
          TextColor(cyan);
          writelnxy(opcoesescolhiveisc[1],0,12);
          case MenuCimaBaixo(opcoesescolhiveisc,10) of
            1:
              begin
                   Operacoes();
              end;
            2:
              begin
                  Media();
              end;
            3:
              begin
                  Tabuada();
              end;
            4:
              begin
                  respostac:='n';
                  Beep(300,50);
              end;
          end;
       until (lowercase(respostac)<>'s');
  end;

