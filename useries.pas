unit USeries;
{$codepage UTF8}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Crt, Dialogs;

type
  string30 = string[30];

  series = object
    nombre: string30;
    ano: integer;
    resenas: string30;
    visualizaciones: integer;
    foto: string30;
    procedure iniciar(nom: string30; an: integer; res: string30; vis: integer; fot: string30);
    procedure mostrar();
    procedure guardar(Ruta: string; Posicion: integer);
    procedure leer(Ruta: string; Posicion: integer);
    procedure borrar(Ruta, copia: string; Posicion: integer);
  end;


const
  fichero = 'series.txt';
  fcopia = 'copia.txt';
  Dir_Fotos = 'imagenes' + DirectorySeparator;

function NumRegistros(fichero: string): integer;

implementation

function NumRegistros(fichero: string): integer;
var
  FOrigen: file of series;
begin
  if FileExists(fichero) then
  begin
    Assign(FOrigen, fichero);
    Reset(FOrigen);
    NumRegistros := FileSize(FOrigen);
    Close(FOrigen);
  end
  else
    NumRegistros := 0;
end;

procedure series.iniciar(nom: string30; an: integer; res: string30; vis: integer; fot: string30);
begin
  nombre := nom;
  ano := an;
  resenas := res;
  visualizaciones := vis;
  foto := fot;
end;

procedure series.mostrar;
begin
  TextBackground(White);
  TextColor(Black);
  Writeln('\\\\\\\\\\\\\\\\\\\\FILTRO DE SERIE////////////////////');
  TextBackground(Black);
  TextColor(Green);
  Writeln('Tipo: ', nombre, '                 Año: ', ano);
  Writeln('Reseñas: ', resenas, '           Visualizaciones: ', visualizaciones);
  Writeln;
end;

procedure series.guardar(Ruta: string; Posicion: integer);
var
  FDestino: file of series;
begin
  Assign(FDestino, Ruta);
  if FileExists(Ruta) then
  begin
    Reset(FDestino);
    Seek(FDestino, Posicion);
  end
  else
    Rewrite(FDestino);
  Write(FDestino, self);
  Close(FDestino);
end;

procedure series.leer(Ruta: string; Posicion: integer);
var
  FDestino: file of series;
begin
  if FileExists(Ruta) then
  begin
    if NumRegistros(Ruta) > 0 then  
    begin
      Assign(FDestino, Ruta);
      Reset(FDestino);
      Seek(FDestino, Posicion);
      Read(FDestino, Self);
      Close(FDestino);
    end
    else
    begin
      nombre := '';
      ano := 0;
      resenas := '';
      visualizaciones := 0;
      foto := '';
    end;
  end;
end;

procedure series.borrar(Ruta, copia: string; Posicion: integer);
var
  FOrigen, FCopia: file of series;
  i, UltimoRegistro: integer;
begin
  UltimoRegistro := NumRegistros(Ruta) - 1;
  Assign(FOrigen, Ruta);
  Reset(FOrigen);
  Assign(FCopia, copia);
  Rewrite(FCopia);
  for i := 0 to UltimoRegistro do
  begin
    Seek(FOrigen, i);
    Read(FOrigen, self);
    if i <> Posicion then
      Write(FCopia, self);
  end;
  Close(FOrigen);
  Close(FCopia);
  DeleteFile(Ruta);
  RenameFile(copia, Ruta);
end;

end.

