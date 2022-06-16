global SerPic
pkg load instrument-control

flushoutput(SerPic);
fclose(SerPic);
%delete(SerPic);

clc;
