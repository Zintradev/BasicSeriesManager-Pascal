unit UListar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ExtDlgs, DBExtCtrls, DBCtrls, EditBtn;

type

  { TFListar }

  TFListar = class(TForm)
    BAnterior: TButton;
    BSiguiente: TButton;
    BModificar: TButton;
    BBorrar: TButton;
    BFoto: TButton;
    BVolver: TButton;
    DBCalendar1: TDBCalendar;
    DBDateEdit1: TDBDateEdit;
    Image2: TImage;
    Label5: TLabel;
    ListBox1: TListBox;
    OpenPictureDialog1: TOpenPictureDialog;
    TNombre: TEdit;
    TAno: TEdit;
    TResenas: TEdit;
    TVisualizaciones: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BAnteriorClick(Sender: TObject);
    procedure BBorrarClick(Sender: TObject);
    procedure BFotoClick(Sender: TObject);
    procedure BModificarClick(Sender: TObject);
    procedure BSiguienteClick(Sender: TObject);
    procedure BVolverClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure ActualizarFicha(Posicion:integer);
    procedure ListBox1Click(Sender: TObject);
  private

  public

  end;

var
  FListar: TFListar;

implementation

{$R *.lfm}

{ TFListar }
uses
  UMenu,USeries;
var
  posicion,ultimo:integer;
  serie1:series;
  cadena,cadena1:string;
  Nombre_Foto:string;
  nombrefoto:string;

procedure  TFListar.ActualizarFicha(Posicion:integer);
begin
  serie1.leer(fichero,posicion);
  TNombre.text:=serie1.nombre;
  cadena:=IntToStr(serie1.ano);
  TAno.text:=cadena;
  TResenas.text:=serie1.resenas;
  cadena1:=IntToStr(serie1.visualizaciones);
  TVisualizaciones.text:=cadena1;
  if FileExists(Dir_fotos+serie1.foto) then
       Nombre_Foto:= serie1.foto
     else
       Nombre_Foto:= 'blanco.jpg';
  Image1.Picture.LoadFromFile(Dir_fotos+Nombre_Foto);

end;

procedure TFListar.ListBox1Click(Sender: TObject);
begin
  ListBox1.Items.Add(serie1.nombre);
end;

procedure TFListar.FormCreate(Sender: TObject);
begin

end;

procedure TFListar.Label2Click(Sender: TObject);
begin

end;

procedure TFListar.Label4Click(Sender: TObject);
begin

end;

procedure TFListar.BVolverClick(Sender: TObject);
begin
  FListar.Hide;
  FMenu.Show;
end;

procedure TFListar.FormActivate(Sender: TObject);
begin
   posicion:=0;
   Ultimo:=NumRegistros(fichero)-1;
  ActualizarFicha(posicion);
end;

procedure TFListar.BAnteriorClick(Sender: TObject);
begin
   if posicion>0then
   posicion:=posicion-1;
   ActualizarFicha(posicion);
end;

procedure TFListar.BBorrarClick(Sender: TObject);
begin
   serie1.borrar(fichero,fcopia,Posicion);
   if posicion>0 then posicion:=posicion-1;
   ultimo:=ultimo-1;
   ActualizarFicha(posicion);
end;

procedure TFListar.BFotoClick(Sender: TObject);
var
  Ruta_Foto:string;
begin
  if openpicturedialog1.Execute then
    begin
       Ruta_foto:=openpicturedialog1.FileName;
       Nombre_Foto:=ExtractFilename(Ruta_Foto);
       Image1.Picture.LoadFromFile(Ruta_foto);
       Image1.Picture.SaveToFile(Dir_Fotos+Nombre_Foto);
       nombrefoto:=Nombre_Foto;
    end;
end;

procedure TFListar.BModificarClick(Sender: TObject);
begin
    serie1.iniciar(TNombre.text,StrToInt(TAno.text),TResenas.text,StrToInt(TVisualizaciones.text),Nombre_Foto);
    serie1.guardar(fichero,posicion);
    ShowMessage('Ficha modificada');
end;

procedure TFListar.BSiguienteClick(Sender: TObject);
begin
   if posicion<Ultimo then
   posicion:=posicion+1;
   ActualizarFicha(posicion);
end;

end.

