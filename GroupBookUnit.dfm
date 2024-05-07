object showGroupBookForm: TshowGroupBookForm
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  Caption = #1606#1605#1575#1740#1588' '#1575#1591#1604#1575#1593#1575#1578' '#1705#1578#1575#1576' '#1607#1575
  ClientHeight = 358
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'B Titr'
  Font.Style = [fsBold]
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 29
  object Label2: TLabel
    Left = 479
    Top = 30
    Width = 32
    Height = 29
    Caption = #1588#1575#1576#1705
  end
  object GroupNameLabel: TLabel
    Left = 345
    Top = 235
    Width = 14
    Height = 33
    Caption = '-'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupCodeLabel: TLabel
    Left = 345
    Top = 185
    Width = 14
    Height = 33
    Caption = '-'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TitleLabel: TLabel
    Left = 345
    Top = 139
    Width = 14
    Height = 33
    Caption = '-'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 401
    Top = 139
    Width = 82
    Height = 33
    Alignment = taCenter
    Caption = #1593#1606#1608#1575#1606' '#1705#1578#1575#1576':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 401
    Top = 187
    Width = 118
    Height = 33
    Alignment = taCenter
    Caption = #1586#1740#1585' '#1711#1585#1608#1607' '#1605#1608#1590#1608#1593':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 401
    Top = 235
    Width = 78
    Height = 33
    Alignment = taCenter
    Caption = #1705#1583' '#1605#1608#1590#1608#1593':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 401
    Top = 91
    Width = 44
    Height = 33
    Alignment = taCenter
    Caption = #1588#1575#1576#1705':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EanLabel: TLabel
    Left = 345
    Top = 91
    Width = 14
    Height = 33
    Caption = '-'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 401
    Top = 274
    Width = 35
    Height = 33
    Alignment = taCenter
    Caption = #1606#1575#1588#1585':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object producerLabel: TLabel
    Left = 345
    Top = 274
    Width = 14
    Height = 33
    Caption = '-'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object priceLabel: TLabel
    Left = 345
    Top = 317
    Width = 14
    Height = 33
    Caption = '-'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 401
    Top = 317
    Width = 41
    Height = 33
    Alignment = taCenter
    Caption = #1602#1740#1605#1578':'
    Font.Charset = ARABIC_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'B Titr'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EanEdit: TEdit
    Left = 254
    Top = 27
    Width = 211
    Height = 37
    MaxLength = 13
    TabOrder = 0
    OnKeyDown = EanEditKeyDown
  end
  object RegisterShelfBookBitBtn: TBitBtn
    Left = 24
    Top = 27
    Width = 209
    Height = 40
    Caption = #1580#1587#1578#1580#1608' '#1608' '#1606#1605#1575#1740#1588' '#1575#1591#1604#1575#1593#1575#1578' '#1705#1578#1575#1576
    TabOrder = 1
    OnClick = RegisterShelfBookBitBtnClick
  end
  object tempADOQuery: TADOQuery
    Connection = mainForm.ADOConnection
    Parameters = <>
    Left = 88
    Top = 80
  end
end
