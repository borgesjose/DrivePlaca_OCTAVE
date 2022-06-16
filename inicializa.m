function z = inicializa(porta)
global SerPic % Cria a variavel que recebe a classe serial
pkg load instrument-control  %Carrega a bilbioteca que contem as funções de comunicação serial


disp('Inicializando Serial ... '); %%Informa o usuario o passo que o program esta executando;

SerPic = serial(porta); % Cria o objeto que sera utilizado na comunicação

% Configurando a comunicação:

set(SerPic, 'baudrate',115200 , 'bytesize',8 , 'parity','odd' , stopbits, 1, )

fopen(SerPic);
