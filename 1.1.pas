const n=15;
var f, outp:file of integer;
    a,b:integer;
    l, j, i:integer; 
begin
randomize;
assign(f,'fileF.txt');
assign(outp, 'sort.txt');
reset(f);
rewrite(outp);
for i:=1 to n do
 begin
  a:=random(500);
  write(f,a);
 end;
writeln('Содержание исходного файла:');
reset(f);
for i:=0 to filesize(f)-1 do
 begin
  read(f,a);
  write(a:4);
 end;
writeln;
writeln;
seek(f,0);
for i:=0 to filesize(f)-2 do
for j:=filesize(f)-1 downto i+1 do
 begin
  seek(f,j-1);
  read(f,a);
  seek(f,j);
  read(f,b);
  if a>b then
  begin
   seek(f,j-1);
   write(f,b);
   seek(f,j);
   write(f,a);
  end;
 end;
seek(f,0);
writeln('Содержание отсортированного файла:');
for i:=0 to filesize(f)-1 do
 begin
  read(f,a);
  write(a:4);
  Write(outp,a);
  end;
  close(f);
  close(outp);
  end.
 
 