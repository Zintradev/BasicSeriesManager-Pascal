unit UTerror;//En realidad es UAltas

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ExtDlgs;

type

  { TFTerror }

  { TFAltas }

  TFAltas = class(TForm)
    BFoto: TButton;
    BGuardar: TButton;
    BVolver: TButton;
    BVolverT: TButton;
    ENombre: TEdit;
    EAno: TEdit;
    EResenas: TEdit;
    EVisualizaciones: TEdit;
    Image1: TImage;
    Label1: TLabel;
    LVisaluizaciones: TLabel;
    LResenas: TLabel;
    LNombre: TLabel;
    LAno: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Serie1_altas: TImage;
    procedure BFotoClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure BVolverClick(Sender: TObject);
    procedure BVolverTClick(Sender: TObject);
    procedure ENombreEditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Serie1_altasClick(Sender: TObject);
  private

  public

  end;

var
  FAltas: TFaltas;

implementation

{$R *.lfm}

{ TFTerror }
uses
  UMenu,USeries;

var
  serie1:series;
  Nombre_Foto:string;
  nombrefoto:string;

procedure TFAltas.ENombreEditingDone(Sender: TObject);
begin

end;

procedure TFAltas.BFotoClick(Sender: TObject);
var
  Ruta_Foto:string;
begin
  if openpicturedialog1.Execute then
    begin
      Ruta_foto:=openpicturedialog1.FileName;
      Nombre_Foto:=ExtractFilename(Ruta_Foto);
      Serie1_Altas.Picture.LoadFromFile(Ruta_foto);
      Serie1_Altas.Picture.SaveToFile(Dir_Fotos+Nombre_Foto);
      nombrefoto:=Nombre_Foto;
    end;
end;

procedure TFAltas.BGuardarClick(Sender: TObject);
begin
  if ((ENombre.text='') or (EAno.text='') or (EResenas.text='') or (EVisualizaciones.text=''))then
  ShowMessage('Campos incorrectos')
  else
  serie1.iniciar(ENombre.text,StrToInt(EAno.text),EResenas.text,StrToInt(EVisualizaciones.text),nombre_foto);
  serie1.guardar(fichero,NumRegistros(fichero));
  ENombre.text:=' ';
  EAno.text:=' ';
  EResenas.text:=' ';
  EVisualizaciones.text:=' ';
  Serie1_altas.Picture.LoadFromFile(dir_fotos+'blanco.jpg');
end;

procedure TFAltas.BVolverClick(Sender: TObject);
begin
   FAltas.Hide;
   FMenu.Show;
end;

procedure TFAltas.BVolverTClick(Sender: TObject);
begin

end;

procedure TFAltas.FormCreate(Sender: TObject);
begin

end;

procedure TFAltas.Label1Click(Sender: TObject);
begin

end;

procedure TFAltas.Serie1_altasClick(Sender: TObject);
begin

end;


end.

