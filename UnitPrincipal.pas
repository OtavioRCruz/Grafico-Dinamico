unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, DB, DBTables, ExtCtrls, TeeProcs, Chart,
  DbChart;

type
  TForm1 = class(TForm)
    DBChart1: TDBChart;
    Table1: TTable;
    Series1: TPieSeries;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses TeCanvas;

{$R *.dfm}

var DeltaZoom:Integer;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DeltaZoom:=5;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Series1.Rotate(355);
  with DBChart1.View3DOptions do
    begin
      Zoom:=Zoom -  DeltaZoom;
      if (Zoom < 60) or (Zoom > 110) then
        DeltaZoom:= DeltaZoom;
    end;
end;

end.
