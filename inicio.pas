program inicio;

uses sysutils, crt, windows, MMSystem, Classes, variants;

var respostamain:string;
    textoopcao:array[1..5] of string;   //Opçoes passíveis de serem escolhidas
    im1,cursorp,volume,volumeantigo:integer;
    opcaopescolhermain,musicaloop,musicaambiente:bool;

//Dependencias - Subprogramas
{$I 'ferramentas/mainferramentas.pas'}
{$I 'calculadora/maincalculadora.pas'}
{$I 'mp3/mainmp3.pas'}

begin
  ShowWindow(GetConsoleWindow(), SW_MAXIMIZE);
  Delay(1000);
  WaveOutSetVolume(WAVE_MAPPER, MakeLong(Round(65535), Round(65535))); //https://stackoverflow.com/questions/22785199/change-left-and-right-channels-volume-seperatly-waveoutsetvolume-c
  respostamain:='s';
  volume:=100;
  volumeantigo:=100;
  musicaloop:=false;
  musicaambiente:=true;
  repeat
    textbackground(lightgray);
    textcolor(black);
    cursoroff; //desativa o cursor
    writeln();
    writeln();
    writeln('    ____      __     _    ');
    writeln('   /  _/___  /_/____(_)___');
    writeln('   / // __ \/ / ___/ / __ \');
    writeln('  / // / / / / /__/ / /_/ /');
    writeln('/___/_/ /_/_/\___/_/\____/');
    im1:=1;
    while (im1<48) do
        begin
          GotoXY(im1,7);
          DelLine;
          GotoXY(im1,6);
          DelLine;
          GotoXY(im1,5);
          DelLine;
          GotoXY(im1,4);
          DelLine;
          GotoXY(im1,3);
          DelLine;
          GotoXY(im1,3);
          writeln('    ____      __     _    ');
          GotoXY(im1,4);
          writeln('   /  _/___  /_/____(_)___');
          GotoXY(im1,5);
          writeln('   / // __ \/ / ___/ / __ \');
          GotoXY(im1,6);
          writeln('  / // / / / / /__/ / /_/ /');
          GotoXY(im1,7);
          writeln('/___/_/ /_/_/\___/_/\____/');
          im1:=im1+2;
          Delay(10);
        end;
    Delay(100);
    writeln;
    writeln;
    writeln;
    im1:=1;
    textoopcao[1]:='Ferramentas';       //Definir todas as opções
    textoopcao[2]:='Calculadora';
    textoopcao[3]:='Jogos';
    textoopcao[4]:='MP3 Player';
    textoopcao[5]:='Sair';
    while (im1<=length(textoopcao)) do  //'Animação' das opções disponiveis e o seu centramento
      begin
        writeln;
        GotoXY(((WindMaxX+1 - Length(textoopcao[im1])) div 2),WhereY);
        writeln(textoopcao[im1]);
        Delay(100);
        im1:=im1+1;
      end;
    cursorp:=1;
    GotoXY(((WindMaxX+1 - Length(textoopcao[cursorp])) div 2),cursorp+11);      //Escolher as opções apartir das "arrow keys", definir cor ciano para a opcao pre-selecionada e cor default para a que deixou de ser pre-selecionada
    TextColor(cyan);
    writeln(textoopcao[cursorp]);
    opcaopescolhermain:=true;
    while opcaopescolhermain do
      begin
        rk:=readkey;
        if (rk=#80)then
          begin
            GotoXY(((WindMaxX+1 - Length(textoopcao[cursorp])) div 2),(cursorp)*2+10);
            TextColor(black);
            writeln(textoopcao[cursorp]);
            if (cursorp=Length(textoopcao)) then
              cursorp:=0;
            cursorp:=cursorp+1;
            GotoXY(((WindMaxX+1 - Length(textoopcao[cursorp])) div 2),cursorp*2+10);
            TextColor(cyan);
            writeln(textoopcao[cursorp]);
            Beep(400,50);
          end
        else if (rk=#72) then
          begin
            GotoXY(((WindMaxX+1 - Length(textoopcao[cursorp])) div 2),(cursorp)*2+10);
            TextColor(black);
            writeln(textoopcao[cursorp]);
            if (cursorp=1) then
              cursorp:=Length(textoopcao)+1;
            cursorp:=cursorp-1;
            GotoXY(((WindMaxX+1 - Length(textoopcao[cursorp])) div 2),cursorp*2+10);
            TextColor(cyan);
            writeln(textoopcao[cursorp]);
            Beep(400,50);
          end
        else if (rk=#13) then
          begin
            case cursorp of
              1:
                begin
                     Ferramentas();
                     opcaopescolhermain:=false;
                end;
              2:
                begin
                     Calculadora();
                     opcaopescolhermain:=false;
                end;
              3:
                begin
                     opcaopescolhermain:=false;
                end;
              4:
                begin
                     MP3Player;
                     opcaopescolhermain:=false;
                end;
              5:
                begin
                     respostamain:='n';
                     opcaopescolhermain:=false;
                end;
            end;
          end;
      end;
  until (lowercase(respostamain)<>'s');
end.


