var respostamp3,musicaescolhida:string;
    opcoesescolhiveismp3:array[1..6] of string;
    opcoesdasopcoes:array[1..4] of string;
    opcaopescolhermp3,esquerda,pode:bool;
    tamanhoxwind:integer;

procedure MP3Player;
  begin
       pode:=true;
       esquerda:=true;
       Beep(700,50);
       respostamp3:='s';
       repeat
          stringfinal:='/_/  /_/_/   /____/  /_/   /_____/_/  |_/_/_____/_/ |_|               ;   ;�       ';
          textbackground(lightgray);
          textcolor(black);
          clrscr;
          cursoroff; //desativa o cursor
          writeln;
          writeln;
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                         ;            ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                         ;;          ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                         ;`;.         ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('       __  _______ _____    ____  __    _____  ____________              ;  ;;        ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('      /  |/  / __ \__  /   / __ \/ /   /   \ \/ / ____/ __ \             ;   ;;       ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('     / /|_/ / /_/ //_ <   / /_/ / /   / /| |\  / __/ / /_/ /             ;    ;;       ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('    / /  / / ____/__/ /  / ____/ /___/ ___ |/ / /___/ _, _/              ;    ;;        ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
	  writeln('   /_/  /_/_/   /____/  /_/   /_____/_/  |_/_/_____/_/ |_|               ;   ;�          ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                         ;  �          ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                    ,;;;,;             ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                    ;;;;;;             ');
          GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
          writeln('                                                                    `;;;;`             ');
	  Delay(100);
          writeln;
          writeln;
          writeln;
          im1:=1;
          opcoesescolhiveismp3[1]:='Fui ao Jardim da Celeste';       //Definir todas as op��es
          opcoesescolhiveismp3[2]:='Sou uma Ta�a';
          opcoesescolhiveismp3[3]:='� Natal';
          opcoesescolhiveismp3[4]:='M�sica de Elevador';
          opcoesescolhiveismp3[5]:='Ver�o e Amor';
          opcoesescolhiveismp3[6]:='Nenhuma';
          while (im1<=length(opcoesescolhiveismp3)) do  //'Anima��es das op��es disponiveis e o seu centramento
            begin
              writeln;
              GotoXY(WindMaxX div 4,WhereY);
              writeln(opcoesescolhiveismp3[im1]);
              Delay(100);
              im1:=im1+1;
            end;
          cursorp:=1;
          GotoXY(WindMaxX div 4,cursorp+18);      //Escolher as op��es apartir das "arrow keys", definir cor ciano para a opcao pre-selecionada e cor default para a que deixou de ser pre-selecionada
          TextColor(cyan);
          writeln(opcoesescolhiveismp3[cursorp]);
          opcaopescolhermp3:=true;
          TextColor(black);
          im1:=1;
          opcoesdasopcoes[1]:='Volume da M�sica: '+VarToStr(volume)+'%';       //Definir todas as op��es
          opcoesdasopcoes[2]:='         Em Loop: [ ]';
          if (musicaloop) then
            opcoesdasopcoes[2]:='         Em Loop: [X]';
          opcoesdasopcoes[3]:=' M�sica Ambiente: [X]';
          if (not musicaambiente) then
            opcoesdasopcoes[3]:=' M�sica Ambiente: [ ]';
          opcoesdasopcoes[4]:='               Voltar';
          tamanhoxwind:=(3*WindMaxX div 4)-Length(opcoesdasopcoes[1])+5;
          window(tamanhoxwind,19, WindMaxX, WindMaxY);
          GotoXY(1,1);
          while (im1<=length(opcoesdasopcoes)) do  //'Anima��es das op��es disponiveis e o seu centramento
            begin
              writeln(opcoesdasopcoes[im1]);
              writeln;
              Delay(100);
              im1:=im1+1;
            end;
          window(1,1, WindMaxX, WindMaxY);
          while opcaopescolhermp3 do
            begin
              rk:=readkey;
              if (rk=#80)then
                begin
                  if (esquerda) then
                    begin
                      GotoXY(WindMaxX div 4,(cursorp)*2+17);
                      TextColor(black);
                      writeln(opcoesescolhiveismp3[cursorp]);
                      if (cursorp=Length(opcoesescolhiveismp3)) then
                        cursorp:=0;
                      cursorp:=cursorp+1;
                      GotoXY(WindMaxX div 4,cursorp*2+17);
                      TextColor(cyan);
                      writeln(opcoesescolhiveismp3[cursorp]);
                    end
                  else
                    begin
                      window(tamanhoxwind,19, WindMaxX, WindMaxY);
                      GotoXY(1,cursorp*2-1);
                      TextColor(black);
                      writeln(opcoesdasopcoes[cursorp]);
                      if (cursorp=Length(opcoesdasopcoes)) then
                        cursorp:=0;
                      cursorp:=cursorp+1;
                      GotoXY(1,cursorp*2-1);
                      TextColor(cyan);
                      writeln(opcoesdasopcoes[cursorp]);
                      window(1,1, WindMaxX, WindMaxY);
                    end;
                    Beep(400,50);
                end
              else if (rk=#72) then
                begin
                  if (esquerda) then
                    begin
                      GotoXY(WindMaxX div 4,(cursorp)*2+17);
                      TextColor(black);
                      writeln(opcoesescolhiveismp3[cursorp]);
                      if (cursorp=1) then
                        cursorp:=Length(opcoesescolhiveismp3)+1;
                      cursorp:=cursorp-1;
                      GotoXY(WindMaxX div 4,cursorp*2+17);
                      TextColor(cyan);
                      writeln(opcoesescolhiveismp3[cursorp]);
                    end
                  else
                    begin
                      window(tamanhoxwind,19, WindMaxX, WindMaxY);
                      GotoXY(1,cursorp*2-1);
                      TextColor(black);
                      writeln(opcoesdasopcoes[cursorp]);
                      if (cursorp=1) then
                        cursorp:=Length(opcoesdasopcoes)+1;
                      cursorp:=cursorp-1;
                      GotoXY(1,cursorp*2-1);
                      TextColor(cyan);
                      writeln(opcoesdasopcoes[cursorp]);
                      window(1,1, WindMaxX, WindMaxY);
                    end;
                  Beep(400,50);
                end
              else if (rk=#13) then
                begin
                  if (esquerda) then
                    begin
                      musicaescolhida:='.\mp3\'+opcoesescolhiveismp3[cursorp];
                      pode:=true;
                      volumeantigo:=volume;
                    end
                  else
                    begin
                      case cursorp of
                        1:
                         begin
                           window(tamanhoxwind,19, WindMaxX, WindMaxY);
                           GotoXY(1,cursorp*2-1);
                           InsLine;
                           writeln('Volume da M�sica: ');
                           DelLine;
                           cursoron;
                           GotoXY(1+18,cursorp*2-1);
                           volumeantigo:=volume;
                           readln(volume);
                           cursoroff;
                           if (volume>100) or (volume<0) then
                             begin
                               pode:=false;
                               volume:=volumeantigo;
                             end;
                           GotoXY(1,cursorp*2-1);
                           opcoesdasopcoes[1]:='Volume da M�sica: '+VarToStr(volume)+'%     ';
                           write('Volume da M�sica: ',volume,'%');
                         end;
                        2:
                         begin
                           window(tamanhoxwind,19, WindMaxX, WindMaxY);
                           GotoXY(1,cursorp*2-1);
                           if (musicaloop) then
                             begin
                               musicaloop:=false;
                               opcoesdasopcoes[cursorp]:='         Em Loop: [ ]';
                             end
                           else
                             begin
                               musicaloop:=true;
                               opcoesdasopcoes[cursorp]:='         Em Loop: [X]';
                             end;
                           writeln(opcoesdasopcoes[cursorp]);
                         end;
                        3:
                         begin
                           pode:=false;
                           window(tamanhoxwind,19, WindMaxX, WindMaxY);
                           GotoXY(1,cursorp*2-1);
                           if (musicaambiente) then
                             begin
                               musicaambiente:=false;
                               opcoesdasopcoes[cursorp]:=' M�sica Ambiente: [ ]';
                             end
                           else
                             begin
                               musicaambiente:=true;
                               opcoesdasopcoes[cursorp]:=' M�sica Ambiente: [X]';
                             end;
                           writeln(opcoesdasopcoes[cursorp]);
                         end;
                        4:
                         begin
                           respostamp3:='n';
                           opcaopescolhermp3:=false;
                           Beep(300,50);
                         end;
                      end;
                    end;
                    if (respostamp3='n') and (not musicaambiente) then
                      musicaescolhida:='.\mp3\Nenhuma';
                    if ((respostamp3='s') and (pode)) or ((respostamp3='n') and (not musicaambiente) and (pode)) then
                      begin
                        if (volumeantigo=volume) then
                          begin
                            SndPlaySound(nil,SND_ASYNC);
                            if (musicaescolhida<>'.\mp3\Nenhuma') then
                              begin
                                if (musicaloop) then
                                  begin
                                    SndPlaySound(PChar(musicaescolhida),SND_ASYNC + SND_LOOP);
                                  end
                                else
                                  begin
                                    SndPlaySound(PChar(musicaescolhida),SND_ASYNC);
                                  end;
                              end;
                          end;
                        WaveOutSetVolume(WAVE_MAPPER, MakeLong(Round(65535*volume/100), Round(65535*volume/100))); //https://stackoverflow.com/questions/22785199/change-left-and-right-channels-volume-seperatly-waveoutsetvolume-c
                      end;
                    pode:=true;
                end
              else if (rk=#77) and (esquerda) then
                begin
                  esquerda:=false;
                  GotoXY(WindMaxX div 4,(cursorp)*2+17);
                  TextColor(black);
                  writeln(opcoesescolhiveismp3[cursorp]);
                  cursorp:=1;
                  window(tamanhoxwind,19, WindMaxX, WindMaxY);
                  GotoXY(1,(cursorp)*2-1);
                  TextColor(cyan);
                  writeln(opcoesdasopcoes[cursorp]);
                  window(1,1, WindMaxX, WindMaxY);
                  Beep(450,50);
                end
              else if (rk=#75) and (not esquerda) then
                begin
                  esquerda:=true;
                  window(tamanhoxwind,19, WindMaxX, WindMaxY);
                  GotoXY(1,(cursorp)*2-1);
                  TextColor(black);
                  writeln(opcoesdasopcoes[cursorp]);
                  cursorp:=1;
                  window(1,1, WindMaxX, WindMaxY);
                  GotoXY(WindMaxX div 4,(cursorp)*2+17);
                  TextColor(cyan);
                  writeln(opcoesescolhiveismp3[cursorp]);
                  Beep(450,50);
                end;
            end;
       until (lowercase(respostamp3)<>'s');
  end;
