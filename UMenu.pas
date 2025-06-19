unit UMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFMenu }

  TFMenu = class(TForm)
    BAltas: TButton;
    BListar: TButton;
    Image1: TImage;
    LTitulo1: TLabel;
    procedure BAltasClick(Sender: TObject);
    procedure BListarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure LTituloClick(Sender: TObject);
  private

  public

  end;

var
  FMenu: TFMenu;

implementation

{$R *.lfm}

{ TFMenu }

uses
  UTerror,UListar,USeries;

procedure TFMenu.BListarClick(Sender: TObject);
begin
   FMenu.Hide;
   FListar.Show;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin

end;

procedure TFMenu.Image1Click(Sender: TObject);
begin

end;

procedure TFMenu.Image2Click(Sender: TObject);
begin

end;

procedure TFMenu.LTituloClick(Sender: TObject);
begin

end;

procedure TFMenu.BAltasClick(Sender: TObject);
begin
   FMenu.Hide;
   FAltas.Show;
end;

end.

