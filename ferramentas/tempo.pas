var HTTPS:TFPHttpClient;
   localizacao,ConteudoJSON,valorpais,respostamet,clima,descricao,paisescolhido:string;
   tempatual,tempsens,tempmin,tempmax,pressure,humidity,sea_level,visibilidade,vento:real;
   JSONString:TJSONData;
   numlugares,loopfortempo,lugardef,nascerdosol,pordosol:integer;
   lat,lon:real;

procedure TempoCidade;
 begin
   textbackground(lightgray);
   textcolor(black);
   clrscr;
   cursoron;
   writeln;
   writeln;
   stringfinal:=' / /  / /  __/ /_/  __/ /  /  __/ /_/ / / /_/ / /_/ / / /_/ /';
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('            _______                                                                                       ;   :   ;');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('    ,--,,--´       `-------,_         __  ___     __                       __                          .   \_,!,_/   ,');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('   (        ---              `,      /  |/  /__  / /____  ________  ____  / /___  ____ _(_)___ _        `.,´     `.,´');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('   .`          `-     ,__  ,_)      / /|_/ / _ \/ __/ _ \/ ___/ _ \/ __ \/ / __ \/ __ `/ / __ `/         /         \');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('  (      "          _     __)     ',stringfinal,'     ~ -- :         : -- ~');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('   ´--`"----.~.-`--` `---`        /_/  /_/\___/\__/\___/_/   \___/\____/_/\____/\__, /_/\__,_/           \         /');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('                                                                               /____/                   ,´`._   _.´`.');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('                                                                                                       ´   / `!` \   `');
   GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)-32,WhereY);
   writeln('                                                                                                          ;   :   ;');
   writeln;
   writeln;
   window(1,WhereY,WindMaxX,WindMaxY);
   respostamet:='s';
   while (respostamet='s') do
     begin
       clrscr;
       InitSSLInterface;
       HTTPS := TFPHttpClient.Create(nil);
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
       write('  Localização: ');
       readln(localizacao);
       cursoroff;
       //IR BUSCAR A LONGITUDE E A LATITUDE DE UM LUGAR COM X NOME
       ConteudoJSON:=HTTPS.Get('https://api.openweathermap.org/geo/1.0/direct?q='+localizacao+'&limit=5&appid=8b827ad11875bddec581fa5734ceab8c'); //obter dados sobre lugares com esse nome
       JSONString:=GetJSON(ConteudoJSON);
       numlugares:=JSONString.FindPath('').Count;//ver quantas cidades/lugares existem com o nome
       lugardef:=0;
       for loopfortempo:=1 to numlugares do //JSON Começa com valores em 0
         begin
           valorpais:=JSONString.FindPath('['+IntToStr(loopfortempo-1)+'].country').AsString;//obter o país
           if (valorpais='PT') and (lugardef=0) then  //Priorizar lugares portugueses, caso contrario, vai para o primeiro que aparecer
             lugardef:=loopfortempo-1;
           if (lugardef=loopfortempo-1) then
             paisescolhido:=valorpais;
         end;
       lat:=JSONString.FindPath('['+IntToStr(lugardef)+'].lat').AsFloat;//latitude
       lon:=JSONString.FindPath('['+IntToStr(lugardef)+'].lon').AsFloat;//longitude


       //IR BUSCAR O CLIMA E ALGUMAS INFORMACOES DE UM LUGAR COM UMA CERTA LATITUDE E LONGITUDE
       ConteudoJSON:=HTTPS.Get('https://api.openweathermap.org/data/2.5/weather?lat='+FloatToStr(lat)+'&lon='+FloatToStr(lon)+'&appid=8b827ad11875bddec581fa5734ceab8c'+'&units=metric'); //obter dados sobre o tempo do lugar
       JSONString:=GetJSON(ConteudoJSON);
       clima:=JSONString.FindPath('weather[0].main').AsString;
       descricao:=JSONString.FindPath('weather[0].description').AsString;
       tempatual:=(JSONString.FindPath('main.temp').AsFloat);
       tempsens:=(JSONString.FindPath('main.feels_like').AsFloat);
       tempmin:=(JSONString.FindPath('main.temp_min').AsFloat);
       tempmax:=(JSONString.FindPath('main.temp_max').AsFloat);
       pressure:=JSONString.FindPath('main.pressure').AsFloat*0.001; //converter hectopascal para bar
       humidity:=JSONString.FindPath('main.humidity').AsFloat;
       vento:=JSONString.FindPath('wind.speed').AsFloat*3600/1000; //converter para km/h
       nascerdosol:=JSONString.FindPath('sys.sunrise').AsInteger;
       pordosol:=JSONString.FindPath('sys.sunset').AsInteger;
       FreeAndNil(HTTPS);
       //sea_level:=JSONString.FindPath('main.sea_level').AsFloat;
       //visibilidade:=JSONString.FindPath('visibility').AsFloat;



       //TRADUÇÃO DA DESCRICAO E DO CLIMA ATRAVÉS DE UMA API
       HTTPS := TFPHttpClient.Create(nil);
       HTTPS.AddHeader('Authorization','a_Frj1AYAweaRNu6fdjH378q9kITIaQMvO4XN1XCAR1EZ9VaLM4NBkESPUOD7o21wHFPbVxTDcMiqJ1Tx3');
       HTTPS.AddHeader('Content-Type','application/json; charset=UTF-8');
       HTTPS.AddHeader('Accept', 'application/json');
       HTTPS.RequestBody := TRawByteStringStream.Create('{"translateMode": "html", "platform": "api", "from": "en_GB", "to": "pt_PT", "data": ["'+clima+'","'+descricao+'"]}');
       ConteudoJSON:=Utf8ToAnsi(HTTPS.Post('https://api-b2b.backenster.com/b1/api/v3/translate'));
       clima:=(GetJSON(ConteudoJSON)).FindPath('result[0]').AsString;
       descricao:=(GetJSON(ConteudoJSON)).FindPath('result[1]').AsString;
       descricao[1]:=UpCase(descricao[1]);//Colocar 1ª letre em Maiusculo
       FreeAndNil(HTTPS);
       writeln;
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY);
       writeln('  Informações Metereológicas sobre ', localizacao,' - ',paisescolhido);
       writeln;
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Descrição Diária -> ',clima);
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Clima Atual -> ',descricao);
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Temperatura Atual -> ',tempatual:0:2,'ºC');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Sensação Térmica -> ',tempsens:0:2,'ºC');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Temperatura Mínima -> ',tempmin:0:2,'ºC');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Temperatura Máxima -> ',tempmax:0:2,'ºC');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Presão -> ',pressure:0:0,' bar');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Humidade -> ',humidity:0:0,'%');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Vento -> ',vento:0:2,' km/h');
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Nascer do Sol -> ',TimeToStr(UnixToDateTime(nascerdosol)));
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2)+7,WhereY);
       writeln('Pôr do Sol -> ',TimeToStr(UnixToDateTime(pordosol)));
       writeln;
       GotoXY(((WindMaxX+1 - Length(stringfinal)) div 2),WhereY+2);
       cursoron;
       write('  Pretende repetir com outra localização? (S/N) ');
       readln(respostamet);
     end;
     cursoroff;
     Beep(300,50);
 end;
