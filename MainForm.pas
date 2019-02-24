unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,
  Vcl.Imaging.GIFImg;

type
  TFrmMain = class(TForm)
    imgView: TImage;
  private
    { Private declarations }
    FPicFilename: string;
    procedure SetPicFilename(const aValue: String);
  public
    procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
    property PicFilename: String read FPicFilename write SetPicFilename;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

//Do not allow the form to be activated with mouse clicks
//to prevent other programs running always on top started
//after this tool from being displayed behind this form
procedure TFrmMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := (Params.Style and (not WS_CHILD)) or WS_POPUP;
  Params.WndParent := 0;
  Params.ExStyle := Params.ExStyle or WS_EX_NOACTIVATE;
end;

procedure TFrmMain.SetPicFilename(const aValue: String);
begin
  if FileExists(aValue) then
  try
    imgView.Picture.LoadFromFile(aValue);
    FpicFilename := aValue;
  except
  end;
end;

end.
