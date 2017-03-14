unit graph;


{$mode objfpc}{$H+}

interface

uses
  Dialogs, Classes, SysUtils, DataModule;

type
  matrix = array of array of integer;
  mass = array [1..100] of integer;
  endless = array of integer;

procedure FormAdjecencyMatrix (amount: integer; var a: matrix);

function Dijkstra(var a: matrix; var s: integer; amount: integer): mass;


implementation

procedure FormAdjecencyMatrix (amount: integer; var a: matrix);
var i, j, id, n, m: integer;
const inf = 9999;
begin
  {Иницицализация всех возможных ребер}
  for i:=1 to amount do
     for j:=1 to amount do
        a[i][j] := inf;
  {Заполнение матрицы существующими ребрами}
  DataModule1.EdgesQuery.Open;
  //for id:=1 to amount do
  while not (DataModule1.EdgesQuery.EOF) do
     begin
         //DataModule1.EdgesQuery.Close;
         //DataModule1.EdgesQuery.ParamByName('id_edge').AsInteger := id;
         //DataModule1.EdgesQuery.Open;
         n := DataModule1.EdgesQueryfirst_node.Asinteger;
         m := DataModule1.EdgesQuerysecond_node.Asinteger;
         a[n][m] := DataModule1.EdgesQuerydistance.AsInteger;
         a[m][n] := DataModule1.EdgesQuerydistance.AsInteger;
         DataModule1.EdgesQuery.Next;
         //DataModule1.DataSource1.ComponentIndex := DataModule1.DataSource1.ComponentIndex+1;
      end;
end;

function ExtractMin (d: mass; var Q: endless): integer;
const
  inf = 9999;
var i, j: integer;
    index, min: integer;
begin
   min := inf;
   for i:=0 to length(Q)-1 do
      if (d[Q[i]] < min) {and (d[Q[i]] <> 0)} then
         begin
            min := d[Q[i]];
            index := Q[i];
         end;
   i := 0;

   while (i < length(Q)) and (Q[i] <> index) do
      inc(i);
      //repeat inc(i) until (i = length(Q)-1) or (Q[i] = index);
   if i < length(q) then
    begin
      Q[i] := Q[length(Q)-1];
      setlength(Q, length(Q)-1);
    end;

result := index;
end;

function Dijkstra(var a: matrix; var s: integer; amount: integer): mass;
const
  inf = 9999;
var
    d, p: mass; //distance
    q: endless; //queue
    i, j, curr: integer;
begin
     for i:=1 to amount do
         d[i] := inf;
     for i:=1 to amount do
         p[i] := 0;
     d[s] := 0; //distance of current node S
     for i:=1 to amount do
         begin
              setlength(q, length(q)+1);
              q[i-1] := i; //i-1
         end;
         while length(q) > 0 do
               begin
                    curr := ExtractMin(d, Q);
                    for i:=1 to amount do
                        if(d[i] > d[curr] + a[curr][i]) then
                           begin
                                d[i] := d[curr] + a[curr][i];
                                p[i] := curr;
                                //ShowMessage ('Distance changed for id: '+inttostr(i)+'; new: '+inttostr(d[i]));
                           end;
               end;
     Dijkstra := d;
end;

end.

