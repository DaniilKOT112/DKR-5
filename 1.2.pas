var f: text;
    g: file of integer;
    n, ni, nj, t, pm: integer;
    i, j: longword;
begin
  assign(f, 'tt.txt');
  reset(f);
  assign(g, 'rr.txt');
  rewrite(g);
  while not eof(f) do 
    begin
      readln(f, n);
      if not odd(n) then write(g, n)
    end;
  close(f);
  if filesize(g) = 0
    then begin
      close(g);
      erase(g);
      write('Even numbers not found');
      readln
    end
    else begin
      reset(g);
      for i := 0 to filesize(g) - 2 do
        begin
          pm := i; 
          seek(g, i); 
          read(g, ni); 
          nj := ni; 
          for j := i + 1 to filesize(g) - 1 do 
            begin
              read(g, t); 
              if t < nj 
                then begin 
                  pm := j; 
                  nj := t 
                end
            end;
          if pm <> i then 
            begin 
              seek(g, pm);
              write(g, ni);
              seek(g, i);
              write(g, nj)
            end;
        end;
     
      assign(f, 'kon.txt');
      rewrite(f);
      reset(g);
      for i := 0 to filesize(g) - 1 do
        begin
          read(g, n);
          writeln(f, n)
        end;
      close(f);
      close(g)
    end
end.