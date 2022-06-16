function x = set_pwm(duty)
  global SerPic
  fprintf(SerPic,'%c','p'); % Envia para o PIC o comando P

  %Saturação Superior
  if duty>100
      duty = 100;
  endif
  %Saturaão Inferior
  if duty<0
      duty = 0;
  endif

  duty = (251)*(duty/100);
  dutyy = num2str(duty);
  fprintf(SerPic, '%s\r', dutyy); % Envia para o PIC o valor de Duty

  end
