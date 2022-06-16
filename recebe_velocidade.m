 function vel = recebe_velocidade

  global SerPic
  pkg load instrument-control  %Carrega a bilbioteca que contem as funções de comunicação serial


  flushinput(SerPic);  %Limpa a porta serial de entrada
  fprintf(SerPic,'%c','w');

  % 5 é o numero de Bytes lidos pela função, cada byte é um caractere
  [read_data,count] = fread(SerPic, 5); %lendo os dados no PIC;

  vel = str2double(char(read_data)); % tranforma os dadso em Double


  if vel > 80 % Checagem de erro se velocidade é positiva
    fprintf(SerPic,'%c','w');
    [read_data,count] = fread(SerPic, 5);
    vel = str2double(read_data);
  endif
  if vel<0 %Checagem de erro se velocidade é negativa
       fprintf(SerPic,'%c','w');
       read_data = fscanf(SerPIC,'%s');
       vel = str2double(char(read_data));
  endif
  if isnan(vel) %Checagem de erro se velocidade e NaN
       fprintf(SerPic,'%c','w');
       read_data = fscanf(SerPIC,'%s');
       vel = str2double(char(read_data));
  endif

  flushoutput(SerPic);
  end
