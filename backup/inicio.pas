program inicio;

uses sysutils, windows, MMSystem, Classes, variants, crt, graph, math, fphttpclient, openssl, opensslsockets, fpjson, jsonparser, dateutils, keyboard;

var respostamain,s,nomemaquina,ConteudoJSON:string;
    textoopcao:array[1..7] of string;   //Opçoes passíveis de serem escolhidas
    im1,cursorp,volume,volumeantigo,valorcoord:integer;
    opcaopescolhermain,musicaloop,musicaambiente,primeiravez,cancelarmenu:bool;
    rk:char;
    HTTPS:TFPHttpClient;
    JSONString:TJSONData;

procedure UpdateCrtDimensions;
// secção `initialization` do crt.pp
var
  ConsoleInfo: TConsoleScreenBufferinfo;
begin
  FillChar(ConsoleInfo, SizeOf(ConsoleInfo), 0);
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), ConsoleInfo);
  WindMinX := (ConsoleInfo.srWindow.Left) + 1;
  WindMinY := (ConsoleInfo.srWindow.Top) + 1;
  WindMaxX := (ConsoleInfo.srWindow.Right) + 1;
  WindMaxY := (ConsoleInfo.srWindow.Bottom) + 1;
  WindMax:=((WindMaxY-1) Shl 8)+(WindMaxX-1);
end;

procedure writelnxy(frase:string;xadicional:integer;y:integer);
  begin
    UpdateCrtDimensions;
    GotoXY((WindMaxX - Length(frase)) div 2+xadicional,y);
    writeln(frase);
  end;

procedure writexy(frase:string;xadicional:integer;y:integer);
  begin
    UpdateCrtDimensions;
    GotoXY((WindMaxX - Length(frase)) div 2+xadicional,y);
    write(frase);                                               a
  end;

function MenuCimaBaixo(arrarmenu:array of string;somay:integer): integer; //MENU PARA SUBIR,DESCER, TROCAR DE MENUS...
  var imenu:integer;
  begin
    cancelarmenu:=true;
    imenu:=1;
    while cancelarmenu do
        begin
          rk:=readkey;
          if (rk=#80)then
            begin
              TextColor(black);
              writelnxy(arrarmenu[imenu-1],0,(imenu)*2+somay);
              if (imenu=Length(arrarmenu)) then
                imenu:=0;
              imenu:=imenu+1;
              TextColor(cyan);
              writelnxy(arrarmenu[imenu-1],0,imenu*2+somay);
              Beep(400,50);
            end
          else if (rk=#72) then
            begin
              TextColor(black);
              writelnxy(arrarmenu[imenu-1],0,(imenu)*2+somay);
              if (imenu=1) then
                imenu:=Length(arrarmenu)+1;
              imenu:=imenu-1;
              TextColor(cyan);
              writelnxy(arrarmenu[imenu-1],0,(imenu)*2+somay);
              Beep(400,50);
            end
          else if (rk=#13) then
            begin
              if (imenu<=Length(arrarmenu)) then
                begin
                 cancelarmenu:=false;
                 MenuCimaBaixo:=imenu;
                end;
            end;
        end;
    end;

//Dependencias - Subprogramas
{$I 'ferramentas/mainferramentas.pas'}
{$I 'calculadora/maincalculadora.pas'}
{$I 'jogos/mainjogos.pas'}
{$I 'mp3/mainmp3.pas'}
{$I 'desenhos/quadro.pas'}

procedure CentrarTexto(ipos:integer);
  begin
      GotoXY(ipos,7);
      DelLine;
      GotoXY(ipos,6);
      DelLine;
      GotoXY(ipos,5);
      DelLine;
      GotoXY(ipos,4);
      DelLine;
      GotoXY(ipos,3);
      DelLine;
      GotoXY(ipos,3);
      writeln('    ____      __     _    ');
      GotoXY(ipos,4);
      writeln('   /  _/___  /_/____(_)___');
      GotoXY(ipos,5);
      writeln('   / // __ \/ / ___/ / __ \');
      GotoXY(ipos,6);
      writeln('  / // / / / / /__/ / /_/ /');
      GotoXY(ipos,7);
      writeln('/___/_/ /_/_/\___/_/\____/');
  end;

begin
  //TempoCidade;
  ShowWindow(GetConsoleWindow(), SW_SHOWMAXIMIZED);
  UpdateCrtDimensions;
  window(1,1,WindMaxX,WindMaxY);
  respostamain:='s';
  volume:=100;
  volumeantigo:=100;
  musicaloop:=false;
  musicaambiente:=true;
  primeiravez:=true;
  repeat
    ShowWindow(GetConsoleWindow(), SW_SHOWMAXIMIZED);
    UpdateCrtDimensions;
    window(1,1,WindMaxX,WindMaxY);
    textbackground(lightgray);
    textcolor(black);
    clrscr;
    cursoroff; //desativa o cursor
    writeln();
    writeln();
    writeln('    ____      __     _    ');
    writeln('   /  _/___  /_/____(_)___');
    writeln('   / // __ \/ / ___/ / __ \');
    writeln('  / // / / / / /__/ / /_/ /');
    writeln('/___/_/ /_/_/\___/_/\____/');
    im1:=1;
    while (im1<((WindMaxX - Length('/___/_/ /_/_/\___/_/\____/')) div 2)) do
        begin
          CentrarTexto(im1);
          im1:=im1+5;
          Delay(15);
        end;
    im1:=((WindMaxX - Length('/___/_/ /_/_/\___/_/\____/')) div 2);
    CentrarTexto(im1);
    Delay(100);
    writeln;
    writeln;
    writeln;
    im1:=1;
    textoopcao[1]:='Ferramentas';       //Definir todas as opções
    textoopcao[2]:='Calculadora';
    textoopcao[3]:='Desenhos';
    textoopcao[4]:='Jogos';
    textoopcao[5]:='MP3 Player';
    textoopcao[6]:='Sobre e Créditos';
    textoopcao[7]:='Sair';
    while (im1<=length(textoopcao)) do  //'Animação' das opções disponiveis e o seu centramento
      begin
        writeln;
        writelnxy(textoopcao[im1],0,WhereY);
        Delay(100);
        im1:=im1+1;
      end;
    cursorp:=1;
    TextColor(cyan);
    writelnxy(textoopcao[cursorp],0,cursorp+11);       //Escolher as opções apartir das "arrow keys", definir cor ciano para a opcao pre-selecionada e cor default para a que deixou de ser pre-selecionada
    opcaopescolhermain:=true;
    if (primeiravez) then
      begin
        primeiravez:=false;
        GotoXY(1,1);
        TextColor(red);
        write('AVISO:');
        TextColor(yellow);
        writeln(' Este programa faz uso das setas do teclado e do ENTER para navegar entre menus.');
      end;
    case MenuCimaBaixo(textoopcao,10) of
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
             Quadro;
             opcaopescolhermain:=false;
        end;
      4:
        begin
             Jogos();
             opcaopescolhermain:=false;
        end;
      5:
        begin
             MP3Player;
             opcaopescolhermain:=false;
        end;
      6:
        begin
             opcaopescolhermain:=false;
        end;
      7:
        begin
             respostamain:='n';
             opcaopescolhermain:=false;
             Beep(300,200);
             Beep(200,200);
             Beep(100,200);
             Beep(400,50);
        end;
    end;
  until (lowercase(respostamain)<>'s');
end.


