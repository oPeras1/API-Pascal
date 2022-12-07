var respostaj:string;
    opcoesescolhiveisj:array[1..5] of string;

{$I 'jogos/pedrapapeltesoura.pas'}
{$I 'jogos/jogogalo.pas'}
{$I 'jogos/parimpar.pas'}
{$I 'jogos/forca.pas'}

procedure Jogos;
  begin
       respostaj:='s';
       Beep(700,50);
       repeat
          stringfinal:='\____/\____/\__, /\____/____/  ';
          textbackground(lightgray);
          textcolor(black);
          UpdateCrtDimensions;
          window(1,1,WindMaxX,WindMaxY);
          clrscr;
          cursoroff; //desativa o cursor
          writeln;
          writeln;
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('       __                      ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('      / /___  ____ _____  _____');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln(' __  / / __ \/ __ `/ __ \/ ___/');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('/ /_/ / /_/ / /_/ / /_/ (__  ) ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln(stringfinal);
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('           /____/              ');
	  Delay(100);
          writeln;
          writeln;
          writeln;
          im1:=1;
          opcoesescolhiveisj[1]:='Jogo do Galo';       //Definir todas as opções
          opcoesescolhiveisj[2]:='Jogo da Forca';
          opcoesescolhiveisj[3]:='Pedra, Papel ou Tesoura';
          opcoesescolhiveisj[4]:='Par ou Ímpar';
          opcoesescolhiveisj[5]:='Voltar';
          while (im1<=length(opcoesescolhiveisj)) do  //'Animação' das opções disponiveis e o seu centramento
            begin
              writeln;
              writelnxy(opcoesescolhiveisj[im1],0,WhereY);
              Delay(100);
              im1:=im1+1;
            end;
          TextColor(cyan);
          writelnxy(opcoesescolhiveisj[1],0,13);
          case MenuCimaBaixo(opcoesescolhiveisj,11) of
            1:
              begin
                JogoGalo();

              end;
            2:
              begin
                JogoForca();
              end;
            3:
              begin
                PedraPapelTesoura();
              end;
            4:
              begin
                ParImpar();
              end;
            5:
              begin
                respostaj:='n';
                Beep(300,50);
              end;
          end;
       until (lowercase(respostaj)<>'s');
  end;

