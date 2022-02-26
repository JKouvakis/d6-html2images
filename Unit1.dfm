object Form1: TForm1
  Left = 64
  Top = 31
  Width = 1182
  Height = 922
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 304
    Top = 24
    Width = 105
    Height = 105
    Visible = False
  end
  object Memo1: TMemo
    Left = 28
    Top = 96
    Width = 559
    Height = 309
    TabOrder = 0
  end
  object Button1: TButton
    Left = 242
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 1174
    Height = 888
    Align = alClient
    TabOrder = 2
    OnNavigateComplete2 = WebBrowser1NavigateComplete2
    OnDocumentComplete = WebBrowser1DocumentComplete
    ControlData = {
      4C00000056790000C75B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126209000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 470
    Top = 304
  end
end
