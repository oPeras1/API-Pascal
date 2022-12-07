var nomeforca,letradigitada:string;
    loopjogoforca,posletra,numvidas,vezescontadas,posxforca,posyforca,xdigite,ydigite:integer;

procedure FaseJogosForca;
  begin
       window(WhereX,WhereY,WindMaxX,WindMaxY);
       //FASE 1
       writeln(' __');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');


       readkey;

       //FASE 2
       clrscr;
       writeln(' ____________________    ');
       writeln('| .__________________|   ');
       writeln('| | / /                  ');
       writeln('| |/ /                   ');
       writeln('| | /                    ');
       writeln('| |/                     ');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');


       readkey;

       //FASE 3
       clrscr;
       writeln(' ___________.._______    ');
       writeln('| .__________))______|   ');
       writeln('| | / /      ||          ');
       writeln('| |/ /       ||          ');
       writeln('| | /        ||.-''.     ');
       writeln('| |/         |/ .  .\    ');
       writeln('| |          ||  (  |    ');
       writeln('| |          (\\ _ .´     ');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');


       readkey;

       //FASE 4
       clrscr;
       writeln(' ___________.._______    ');
       writeln('| .__________))______|   ');
       writeln('| | / /      ||          ');
       writeln('| |/ /       ||          ');
       writeln('| | /        ||.-''.     ');
       writeln('| |/         |/ .  .\    ');
       writeln('| |          ||  (  |    ');
       writeln('| |          (\\ _ .´     ');
       writeln('| |         .-`--´.      ');
       writeln('| |        //|. .|\\     ');
       writeln('| |       // |   | \\    ');
       writeln('| |      //  | . |  \\   ');
       writeln('| |     (´)  | _ |  (´)  ');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');
       writeln('| |');


       readkey;

       //FASE 5
       clrscr;
       writeln(' ___________.._______    ');
       writeln('| .__________))______|   ');
       writeln('| | / /      ||          ');
       writeln('| |/ /       ||          ');
       writeln('| | /        ||.-''.     ');
       writeln('| |/         |/ x  x\    ');
       writeln('| |          ||  (  |    ');
       writeln('| |          (\\ _ .´     ');
       writeln('| |         .-`--´.      ');
       writeln('| |        //|. .|\\     ');
       writeln('| |       // |   | \\    ');
       writeln('| |      //  | . |  \\   ');
       writeln('| |     (´)  | _ |  (´)  ');
       writeln('| |          || ||       ');
       writeln('| |          || ||       ');
       writeln('| |          || ||       ');
       writeln('| |          || ||       ');
       writeln('| |         / | | \      ');
       writeln('| |         `-´ `-´      ');
       writeln('| |                      ');
       writeln('| |                      ');
       writeln('| |                      ');
       writeln('| |                      ');
  end;

procedure JogoForca;
 begin
   textbackground(lightgray);
   textcolor(black);
   clrscr;
   cursoron;
   writeln;
   writeln;
   stringfinal:='\____/\____/\__, /\____/   \__,_/\__,_/  /_/    \____/_/   \___/\__,_/  ';
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('       __                         __         ______                     ');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('      / /___  ____ _____     ____/ /___ _   / ____/___  ______________ _');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln(' __  / / __ \/ __ `/ __ \   / __  / __ `/  / /_  / __ \/ ___/ ___/ __ `/');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('/ /_/ / /_/ / /_/ / /_/ /  / /_/ / /_/ /  / __/ / /_/ / /  / /__/ /_/ / ');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln(stringfinal);
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('           /____/                                                       ');
   writeln;
   writeln;
   window(1,WhereY,WindMaxX,WindMaxY);
   respostamet:='s';
   while (respostamet='s') do
     begin
       numvidas:=5;
       clrscr;
       InitSSLInterface;
       HTTPS := TFPHttpClient.Create(nil);
       cursoroff;
       ConteudoJSON:=HTTPS.Get('https://random-words-api.vercel.app/word/noun'); //Buscar uma palavra aleatoria
       JSONString:=GetJSON(ConteudoJSON);
       nomeforca:=lowercase(JSONString.FindPath('[0].word').AsString);
       HTTPS := TFPHttpClient.Create(nil);
       HTTPS.AddHeader('Authorization','a_Frj1AYAweaRNu6fdjH378q9kITIaQMvO4XN1XCAR1EZ9VaLM4NBkESPUOD7o21wHFPbVxTDcMiqJ1Tx3');
       HTTPS.AddHeader('Content-Type','application/json; charset=UTF-8');
       HTTPS.AddHeader('Accept', 'application/json');
       HTTPS.RequestBody := TRawByteStringStream.Create('{"translateMode": "html", "platform": "api", "from": "en_GB", "to": "pt_PT", "data": ["'+nomeforca+'"]}');
       ConteudoJSON:=Utf8ToAnsi(HTTPS.Post('https://api-b2b.backenster.com/b1/api/v3/translate'));
       nomeforca:=(GetJSON(ConteudoJSON)).FindPath('result[0]').AsString;
       FreeAndNil(HTTPS);
       nomeforca:=AnsiToUtf8(nomeforca);
       writeln(length(nomeforca));
       writeln(nomeforca);
       writeln;
       writeln;
       writeln;//espaco para as letras
       for loopjogoforca:=1 to length(nomeforca) do
         begin
            write('- ');
         end;
       writeln;
       xdigite:=Wherex;
       ydigite:=Wherey;
       repeat
         GotoXY(xdigite,ydigite);
         writeln;
         writeln;
         write('Digite uma letra: ');
         readln(letradigitada);
         vezescontadas:=0;
         posxforca:=WhereX;
         posyforca:=WhereY;
         repeat
           GotoXY(posxforca,posyforca);
           posletra:=pos(letradigitada,nomeforca);
           if (posletra>0) then //letra esta na palavra, na posicao posletra
             begin
               nomeforca:=StringReplace(nomeforca,letradigitada,'-',[]);//substituir para nao aparecer no proximo repeat
               vezescontadas:=vezescontadas+1;
               GotoXY(1,WhereY-5);//ir para a pos
               for loopjogoforca:=1 to length(nomeforca) do
                 begin
                    GotoXY((loopjogoforca*2-1),WhereY);
                    if (posletra=loopjogoforca) then
                      write(letradigitada)
                    else
                      write;
                    GotoXY((loopjogoforca*2-1),WhereY+1);
                    write('-');
                    GotoXY(1,WhereY-1);
                 end;
               writeln;
               writeln;
             end;
         until posletra<=0;
          if (vezescontadas<=0) then
             begin
               //n ha a letra, ou seja tirar uma vida e descer uma fase.
               numvidas:=numvidas-1
             end;
       until (numvidas<=0);
       readkey;
     end;
     cursoroff;
     Beep(300,50);
 end;
