unit BookFair;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Data.Win.ADODB, Vcl.Mask, scExcelExport ;

type
  TRegisterBookShelfForm = class(TForm)
    Label1: TLabel;
    EanEdit: TEdit;
    shelfNumberEdit: TEdit;
    Label2: TLabel;
    RegisterShelfBookBitBtn: TBitBtn;
    DBGrid1: TDBGrid;
    listADOQuery: TADOQuery;
    tempADOQuery: TADOQuery;
    DataSource: TDataSource;
    deleteBitBtn: TBitBtn;
    ExcelReportBitBtn: TBitBtn;
    recordCountLabel: TLabel;
    closeBitBtn: TBitBtn;
    recoverGroupBitBtn: TBitBtn;
    RegisterShelfBitBtn: TBitBtn;
    scExcelExport1: TscExcelExport;
    shelfADOQuery: TADOQuery;
    shelfListExcelBitBtn: TBitBtn;
    scExcelExportShelfList: TscExcelExport;
    shelfListADOQuery: TADOQuery;
    saveShelfAndNewBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure RegisterShelfBookBitBtnClick(Sender: TObject);
    procedure shelfeNumberEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EanEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EanEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure deleteBitBtnClick(Sender: TObject);
    procedure ExcelReportBitBtnClick(Sender: TObject);
    procedure closeBitBtnClick(Sender: TObject);
    procedure recoverGroupBitBtnClick(Sender: TObject);
    procedure RegisterShelfBitBtnClick(Sender: TObject);
    procedure shelfNumberEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure shelfListExcelBitBtnClick(Sender: TObject);
    procedure saveShelfAndNewBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterBookShelfForm: TRegisterBookShelfForm;

implementation

uses mainUnit;

{$R *.dfm}

procedure TRegisterBookShelfForm.RegisterShelfBitBtnClick(Sender: TObject);
begin
   if Trim(shelfNumberEdit.Text)='' then
     begin
        Application.MessageBox('لطفاً شماره قفسه را وارد نمایید','خطا',MB_ICONERROR) ;
        exit;
     end;

   listADOQuery.Close;
   listADOQuery.SQl.Text := 'select * from BookPlaceCodeTable where shelfNumber = '+QuotedStr(Trim(shelfNumberEdit.Text))+' order by ID Desc';
   listADOQuery.Open;
   recordCountLabel.Caption :=  ' تعداد کل کتابهای ثبت شده در قفسه  ' + inttostr(listADOQuery.RecordCount);
   shelfNumberEdit.Enabled := false;
   RegisterShelfBitBtn.Enabled := false;
   EanEdit.SetFocus;
   RegisterShelfBookBitBtn.Enabled := True;
   ExcelReportBitBtn.Enabled := True;
   recoverGroupBitBtn.Enabled := True;
   deleteBitBtn.Enabled := True;
end;

procedure TRegisterBookShelfForm.RegisterShelfBookBitBtnClick(Sender: TObject);
var
   groupcode , groupName : string;
begin
     if trim(shelfNumberEdit.Text)='' then
     begin
        Application.MessageBox('لطفاً شماره قفسه را وارد نمایید','خطا',MB_ICONERROR) ;
        exit;
     end;

     if trim(EanEdit.Text)='' then
     begin
        Application.MessageBox('لطفاً شابک کتاب را وارد نمایید','خطا',MB_ICONERROR) ;
        exit;
     end;

     tempADOQuery.Close;
     tempADOQuery.SQL.Text := ' select * from GroupBookTable where  Ean ='+QuotedStr(Trim(EanEdit.Text));
     tempADOQuery.Open;

     if tempADOQuery.RecordCount = 0 then
     begin
        Application.MessageBox('این شابک کتاب در اطلاعات گروه کتاب ها پیدا نشد','خطا',MB_ICONERROR) ;
        EanEdit.Clear;
        EanEdit.SetFocus;
        exit;
     end
     else
     begin
         groupCode := tempADOQuery.FieldByName('groupCode').AsString;
         groupName := tempADOQuery.FieldByName('GroupName').AsString;
     end;



     tempADOQuery.Close;
     tempADOQuery.SQL.Text := ' select * from BookPlaceCodeTable where ShelfNumber = '+QuotedStr(Trim(shelfNumberEdit.Text))+' and Ean ='+QuotedStr(Trim(EanEdit.Text));
     tempADOQuery.Open;

     if tempADOQuery.RecordCount > 0 then
     begin
        Application.MessageBox('این شابک کتاب قبلا در این قفسه ثبت شده است','خطا',MB_ICONERROR) ;
        EanEdit.Clear;
        EanEdit.SetFocus;
        exit;
     end;


     tempADOQuery.Close;
     tempADOQuery.SQL.Text := ' insert into BookPlaceCodeTable (ShelfNumber, Ean, groupCode , groupName) values ('+QuotedStr(Trim(shelfNumberEdit.Text))+','+QuotedStr(Trim(EanEdit.Text))+','+QuotedStr(groupCode)+','+QuotedStr(GroupName)+')';
     tempADOQuery.ExecSQL;
     //showmessage('عمل ثبت اطلاعات با موفقیت انجام گردید');
     EanEdit.Clear;
     EanEdit.SetFocus;
     listADOQuery.Close;
     listADOQuery.Open;
     recordCountLabel.Caption :=  ' تعداد کل کتابهای ثبت شده در قفسه  ' + inttostr(listADOQuery.RecordCount);

end;

procedure TRegisterBookShelfForm.saveShelfAndNewBitBtnClick(Sender: TObject);
begin
   EanEdit.Clear;
   shelfNumberEdit.Clear;
   shelfNumberEdit.Enabled := True;
   RegisterShelfBookBitBtn.Enabled := false;
   ExcelReportBitBtn.Enabled := False;
   recoverGroupBitBtn.Enabled := False;
   deleteBitBtn.Enabled := False;
   shelfNumberEdit.SetFocus;
   recordCountLabel.Caption := '-';
   RegisterShelfBitBtn.Enabled := True;
   listADOQuery.Close;

end;

procedure TRegisterBookShelfForm.shelfeNumberEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then EanEdit.SetFocus;

end;

procedure TRegisterBookShelfForm.shelfListExcelBitBtnClick(Sender: TObject);
begin

   shelfListADOQuery.Close;
   shelfListADOQuery.SQL.Text := 'select Distinct ShelfNumber as  شماره_قفسه ,count(*) as تعدادکتاب   from BookPlaceCodeTable group by ShelfNumber order by ShelfNumber ';
   shelfListADOQuery.Open;
   scExcelExportShelfList.ExportDataset;
   scExcelExportShelfList.Disconnect();

end;

procedure TRegisterBookShelfForm.shelfNumberEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = 13 then
       RegisterShelfBitBtn.SetFocus;
end;

procedure TRegisterBookShelfForm.recoverGroupBitBtnClick(Sender: TObject);
begin
  //recover group
   tempADOQuery.Close;
   tempADOQuery.SQL.Text := 'UPDATE BookPlaceCodeTable INNER JOIN GroupBookTable ON BookPlaceCodeTable.Ean = GroupBookTable.Ean SET BookPlaceCodeTable.GroupCode = [GroupBookTable].[GroupCode], BookPlaceCodeTable.GroupName = [GroupBookTable].[GroupName] '
      +' where BookPlaceCodeTable.shelfNumber = '+ QuotedStr(Trim(shelfNumberEdit.Text));
   tempADOQuery.ExecSQL;
   showmessage('عمل درج موضوعات کتابها با موفقیت انجام گردید');
   listADOQuery.Close;
   listADOQuery.Open;
end;

procedure TRegisterBookShelfForm.closeBitBtnClick(Sender: TObject);
begin
   close;
end;

procedure TRegisterBookShelfForm.deleteBitBtnClick(Sender: TObject);
begin
     if listADOQuery.Active then
         if listADOQuery.RecordCount > 0 then
          if MessageDlg('آیا از حذف ردیف فعلی مطمئن هستید؟',   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
             begin
                 tempADOQuery.Close;
                 tempADOQuery.SQL.Text := ' delete from BookPlaceCodeTable where ID = '+listADOQuery.FieldByName('ID').AsString;
                 tempADOQuery.ExecSQL;
                 showmessage('عمل حذف اطلاعات با موفقیت انجام گردید');
                 EanEdit.Clear;
                 EanEdit.SetFocus;
                 listADOQuery.Close;
                 listADOQuery.Open;
                 recordCountLabel.Caption :=  ' تعداد کل کتابهای ثبت شده در قفسه  ' + inttostr(listADOQuery.RecordCount);
             end;
          end;
end;

procedure TRegisterBookShelfForm.EanEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = 13 then
    begin
        if length(EanEdit.Text) = 13 then
         begin
             try
                  StrToInt64(EanEdit.Text);
             except
                Application.MessageBox('لطفا شابک کتاب را به درستی وارد نمایید','خطا',MB_ICONERROR) ;
                EanEdit.Clear;
                EanEdit.SetFocus;
                exit;
             end;
             RegisterShelfBookBitBtnClick(sender);
         end
         else
         begin
             Application.MessageBox('لطفا شابک کتاب را به درستی وارد نمایید','خطا',MB_ICONERROR) ;
             EanEdit.SetFocus;
         end;

    end;
end;

procedure TRegisterBookShelfForm.EanEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 {  if length(EanEdit.Text) = 13 then
   begin
       try
            StrToInt64(EanEdit.Text);
       except
          Application.MessageBox('لطفا شابک کتاب را به درستی وارد نمایید','خطا',MB_ICONERROR) ;
          EanEdit.Clear;
          EanEdit.SetFocus;
          exit;
       end;
       //if key = 13 then
       RegisterShelfBookBitBtnClick(sender);
   end;
   }
end;

procedure TRegisterBookShelfForm.ExcelReportBitBtnClick(Sender: TObject);
begin
  // excel
   if listADOQuery.Active then
   begin
       shelfADOQuery.Close;
       shelfADOQuery.SQL.Text := 'select ShelfNumber as ''شماره قفسه'' ,B.Ean as ''شابک'' , G.title as ''عنوان'',B.GroupCode as ''کدگروه''  , G.Producer as ''ناشر'',B.GroupName as ''نام گروه'' ,G.SuperGroupName as ''سرگروه''  ,G.price as ''قیمت'' '
          +'  from BookPlaceCodeTable B left Join GroupBookTable G on B.Ean = G.Ean where B.shelfNumber =' +QuotedStr(shelfNumberEdit.Text);
       shelfADOQuery.Open;
       scExcelExport1.ExportDataset;
       scExcelExport1.Disconnect();
   end;
end;

procedure TRegisterBookShelfForm.FormShow(Sender: TObject);
begin
   //ADOConnection.Close;
   //showmessage(ExtractFilePath(Application.ExeName));
   //ADOConnection.ConnectionString :=  'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + ExtractFilePath(Application.ExeName) + 'db.accdb;Persist Security Info=False';

  // ADOConnection.ConnectionString :=  'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + ExtractFilePath(Application.ExeName) + 'db.mdb;Persist Security Info=False';

  { ADOConnection.ConnectionString :=  'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+ ExtractFilePath(Application.ExeName) +'DB.mdb;Persist Security Info=True';
   ADOConnection.Open();

   listADOQuery.Close;
   listADOQuery.SQl.Text := 'select * from BookPlaceCodeTable order by ID Desc';
   listADOQuery.Open;
   recordCountLabel.Caption :=  ' تعداد کل کتابهای ثبت شده در قفسه ها ' + inttostr(listADOQuery.RecordCount);
   }

   shelfNumberEdit.Enabled := True;
   RegisterShelfBookBitBtn.Enabled := false;
   ExcelReportBitBtn.Enabled := False;
   recoverGroupBitBtn.Enabled := False;
   deleteBitBtn.Enabled := False;
   EanEdit.Clear;
   shelfNumberEdit.Clear;
   RegisterShelfBitBtn.Enabled := True;
end;

end.
