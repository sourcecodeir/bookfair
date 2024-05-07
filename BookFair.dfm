object RegisterBookShelfForm: TRegisterBookShelfForm
  Left = 0
  Top = 0
  ActiveControl = shelfNumberEdit
  BiDiMode = bdRightToLeft
  Caption = #1579#1576#1578' '#1575#1591#1604#1575#1593#1575#1578' '#1705#1578#1575#1576' '#1607#1575' '#1583#1585' '#1602#1601#1587#1607' '#1607#1575
  ClientHeight = 596
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'B Titr'
  Font.Style = [fsBold]
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 29
  object Label1: TLabel
    Left = 846
    Top = 13
    Width = 63
    Height = 29
    Caption = #1588#1605#1575#1585#1607' '#1602#1601#1587#1607
  end
  object Label2: TLabel
    Left = 847
    Top = 55
    Width = 32
    Height = 29
    Caption = #1588#1575#1576#1705
  end
  object recordCountLabel: TLabel
    Left = 526
    Top = 569
    Width = 12
    Height = 29
    Caption = '-'
  end
  object EanEdit: TEdit
    Left = 653
    Top = 50
    Width = 185
    Height = 37
    MaxLength = 13
    TabOrder = 0
    OnKeyDown = EanEditKeyDown
    OnKeyUp = EanEditKeyUp
  end
  object RegisterShelfBookBitBtn: TBitBtn
    Left = 487
    Top = 50
    Width = 160
    Height = 40
    Cursor = crHandPoint
    Caption = #1579#1576#1578' '#1705#1578#1575#1576' '#1583#1585' '#1602#1601#1587#1607
    TabOrder = 1
    OnClick = RegisterShelfBookBitBtnClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 99
    Width = 905
    Height = 472
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = ARABIC_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'B Titr'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #1705#1583' '#1587#1740#1587#1578#1605
        Width = 146
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ShelfNumber'
        Title.Alignment = taCenter
        Title.Caption = #1588#1605#1575#1585#1607' '#1602#1601#1587#1607
        Width = 177
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ean'
        Title.Alignment = taCenter
        Title.Caption = #1588#1575#1576#1705' '#1705#1578#1575#1576
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GroupCode'
        Title.Caption = #1705#1583' '#1711#1585#1608#1607
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GroupName'
        Title.Caption = #1606#1575#1605' '#1711#1585#1608#1607
        Width = 211
        Visible = True
      end>
  end
  object deleteBitBtn: TBitBtn
    Left = 162
    Top = 50
    Width = 146
    Height = 40
    Cursor = crHandPoint
    Caption = #1581#1584#1601' '#1585#1583#1740#1601
    TabOrder = 3
    OnClick = deleteBitBtnClick
  end
  object ExcelReportBitBtn: TBitBtn
    Left = 314
    Top = 50
    Width = 160
    Height = 40
    Cursor = crHandPoint
    Caption = #1582#1585#1608#1580#1740' '#1575#1705#1587#1604' '#1602#1601#1587#1607' '#1580#1575#1585#1740' '
    TabOrder = 4
    OnClick = ExcelReportBitBtnClick
  end
  object closeBitBtn: TBitBtn
    Left = 8
    Top = 50
    Width = 148
    Height = 40
    Cursor = crHandPoint
    Cancel = True
    Caption = #1576#1587#1578#1606' '#1601#1585#1605
    TabOrder = 5
    OnClick = closeBitBtnClick
  end
  object recoverGroupBitBtn: TBitBtn
    Left = 16
    Top = 526
    Width = 226
    Height = 40
    Cursor = crHandPoint
    Caption = #1576#1575#1586#1740#1575#1576#1740' '#1711#1585#1608#1607' '#1705#1578#1575#1576' '#1607#1575#1740' '#1579#1576#1578' '#1588#1583#1607
    TabOrder = 6
    Visible = False
    OnClick = recoverGroupBitBtnClick
  end
  object RegisterShelfBitBtn: TBitBtn
    Left = 487
    Top = 6
    Width = 160
    Height = 40
    Cursor = crHandPoint
    Caption = #1579#1576#1578' '#1602#1601#1587#1607' '
    TabOrder = 7
    OnClick = RegisterShelfBitBtnClick
  end
  object shelfNumberEdit: TEdit
    Left = 653
    Top = 8
    Width = 183
    Height = 37
    MaxLength = 13
    TabOrder = 8
    OnKeyDown = shelfNumberEditKeyDown
  end
  object shelfListExcelBitBtn: TBitBtn
    Left = 8
    Top = 4
    Width = 226
    Height = 40
    Cursor = crHandPoint
    Caption = #1582#1585#1608#1580#1740' '#1575#1705#1587#1604' '#1602#1601#1587#1607' '#1607#1575#1740' '#1579#1576#1578' '#1588#1583#1607
    TabOrder = 9
    OnClick = shelfListExcelBitBtnClick
  end
  object saveShelfAndNewBitBtn: TBitBtn
    Left = 248
    Top = 4
    Width = 226
    Height = 40
    Cursor = crHandPoint
    Caption = #1584#1582#1740#1585#1607' '#1602#1601#1587#1607' '#1608' '#1575#1740#1580#1575#1583' '#1602#1601#1587#1607' '#1580#1583#1740#1583
    TabOrder = 10
    OnClick = saveShelfAndNewBitBtnClick
  end
  object listADOQuery: TADOQuery
    Connection = mainForm.ADOConnection
    Parameters = <>
    Left = 80
    Top = 152
  end
  object tempADOQuery: TADOQuery
    Connection = mainForm.ADOConnection
    Parameters = <>
    Left = 160
    Top = 152
  end
  object DataSource: TDataSource
    DataSet = listADOQuery
    Left = 240
    Top = 152
  end
  object scExcelExport1: TscExcelExport
    DataPipe = dpDataSet
    Dataset = shelfADOQuery
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = 1
    FontHeader.Name = 'Tahoma'
    FontHeader.Orientation = 0
    FontHeader.Style = []
    FontHeader.Alignment = haGeneral
    FontHeader.VerticalAlignment = vaCenter
    FontHeader.WrapText = False
    BorderHeader.BackAlternateColor = clBlack
    MergeHeaderCells = True
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'Tahoma'
    FontTitles.Orientation = 0
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.VerticalAlignment = vaCenter
    FontTitles.WrapText = False
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'Tahoma'
    FontData.Orientation = 0
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.VerticalAlignment = vaCenter
    FontData.WrapText = False
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'Tahoma'
    FontSummary.Orientation = 0
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.VerticalAlignment = vaCenter
    FontSummary.WrapText = False
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'Tahoma'
    FontFooter.Orientation = 0
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.VerticalAlignment = vaCenter
    FontFooter.WrapText = False
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'Tahoma'
    FontGroup.Orientation = 0
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.VerticalAlignment = vaCenter
    FontGroup.WrapText = False
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    Left = 312
    Top = 96
  end
  object shelfADOQuery: TADOQuery
    Connection = mainForm.ADOConnection
    Parameters = <>
    Left = 456
    Top = 56
  end
  object scExcelExportShelfList: TscExcelExport
    DataPipe = dpDataSet
    Dataset = shelfListADOQuery
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = 1
    FontHeader.Name = 'Tahoma'
    FontHeader.Orientation = 0
    FontHeader.Style = []
    FontHeader.Alignment = haGeneral
    FontHeader.VerticalAlignment = vaCenter
    FontHeader.WrapText = False
    BorderHeader.BackAlternateColor = clBlack
    MergeHeaderCells = True
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'Tahoma'
    FontTitles.Orientation = 0
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.VerticalAlignment = vaCenter
    FontTitles.WrapText = False
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'Tahoma'
    FontData.Orientation = 0
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.VerticalAlignment = vaCenter
    FontData.WrapText = False
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'Tahoma'
    FontSummary.Orientation = 0
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.VerticalAlignment = vaCenter
    FontSummary.WrapText = False
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'Tahoma'
    FontFooter.Orientation = 0
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.VerticalAlignment = vaCenter
    FontFooter.WrapText = False
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'Tahoma'
    FontGroup.Orientation = 0
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.VerticalAlignment = vaCenter
    FontGroup.WrapText = False
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    Left = 8
    Top = 40
  end
  object shelfListADOQuery: TADOQuery
    Connection = mainForm.ADOConnection
    Parameters = <>
    Left = 72
    Top = 40
  end
end
