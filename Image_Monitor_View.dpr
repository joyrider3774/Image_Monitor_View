program Image_Monitor_View;

uses
  Vcl.Forms,
  System.SysUtils,
  Winapi.Windows,
  MainForm in 'MainForm.pas' {FrmMain};

{$R *.res}

var
  i : Integer;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  FrmMain.PicFilename := ParamStr(2);
  ShowWindow(FrmMain.Handle, SWP_NOACTIVATE);
  FrmMain.Visible := true;
  if TryStrToInt(ParamStr(1), i) and (i >= 0) and (i < Screen.MonitorCount) then
    FrmMain.BoundsRect := Screen.Monitors[i].BoundsRect
  else
    FrmMain.BoundsRect := Screen.Monitors[0].BoundsRect;
  Application.Run;
end.
