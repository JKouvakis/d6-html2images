unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls,Clipbrd ;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1NavigateComplete2(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
  public
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}
var
 CurDispatch: IDispatch; {save the interface globally }
 i:integer;

procedure TForm1.Button1Click(Sender: TObject);
var a,i:integer;
begin
a:=0;
for i:=1 to 306 do
 begin
 if (a=3) then
  begin
   a:=0;
   Memo1.Lines.Add('</tr><tr>')
  end;
  Memo1.Lines.Add('<td align="center"><a href="'+inttostr(i)+'\index.html" target="_blank"><img src="'+inttostr(i)+'.gif"></a></td>');
  a:=a+1;
 end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  FormImage: TBitmap;
begin
  keybd_event(VK_SNAPSHOT, 1, 0, 0); //Put into theclipboard
  FormImage := TBitmap.Create; //Creating the Bitmap of the SnapShot
  FormImage.LoadFromClipBoardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
  Form1.Image1.Picture.Assign(FormImage);
  FormImage.Free;
  Form1.Image1.Picture.SaveToFile(inttostr(i-1)+'.gif');
  Timer1.Enabled := False;
  if (i=306) then Form1.Close;
  form1.Caption:=inttostr(i);
  i:=i+1;
  webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'Homepage Templates ('+inttostr(i)+')\index.html');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 i:=1;
 webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'Homepage Templates ('+inttostr(i)+')\index.html');
end;

procedure TForm1.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if (pDisp = CurDispatch) then
  begin
    CurDispatch := nil; {clear the global variable }
    Timer1.Enabled:=true;
  end;
end;

procedure TForm1.WebBrowser1NavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if CurDispatch = nil then
    CurDispatch := pDisp; { save for comparison }
end;

end.
