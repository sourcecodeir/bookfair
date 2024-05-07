unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Imaging.jpeg , System.Win.ComObj,
  Vcl.ComCtrls, scExcelExport;

type
  TmainForm = class(TForm)
    BitBtn: TBitBtn;
    showGroupBookBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    ADOConnection: TADOConnection;
    LoadGroupBookBitBtn: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    Image1: TImage;
    exitBitBtn: TBitBtn;
    OpenDialog1: TOpenDialog;
    tempADOQuery: TADOQuery;
    ProgressBar1: TProgressBar;
    scExcelExport1: TscExcelExport;
    AllBookADOQuery: TADOQuery;
    clearDataBitBtn: TBitBtn;
    messageLabel: TLabel;
    Label2: TLabel;
    procedure BitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure showGroupBookBitBtnClick(Sender: TObject);
    procedure exitBitBtnClick(Sender: TObject);
    procedure LoadGroupBookBitBtnClick(Sender: TObject);
    procedure excelLoad(SheetIndex: integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure clearDataBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

uses BookFair, GroupBookUnit;

procedure TmainForm.excelLoad(SheetIndex: integer);
Var
    Xlapp1, Sheet:Variant ;
    MaxRow, MaxCol,X, Y, PID :integer ;
    str , ErrorList : string;
    flag : Boolean;
    I: Integer;
    ean , title, producer, superGroup, groupName , groupCode, price : string;
begin
    if OpenDialog1.Execute() then
       Str:=trim(OpenDialog1.FileName)
    else
       exit;

    XLApp1 := createoleobject('excel.application');
    XLApp1.Workbooks.open(Str) ;

    Sheet := XLApp1.WorkSheets[SheetIndex] ;
    //mainForm.Caption := '!!! لطفا تا پایان عملیات انتقال اطلاعات صبر نمایید';
    messageLabel.Visible := True;
    LoadGroupBookBitBtn.Enabled := false;

    MaxRow := Sheet.Usedrange.EntireRow.count ;
    MaxCol := 1;
    ProgressBar1.Max := MaxRow;
    ErrorList := '';
    for y:=2 to maxRow do
        for x:=1 to maxCol do
         begin
             try
                 ProgressBar1.Position := y;
                 ean := sheet.cells.item[y,1].value;
                 title := sheet.cells.item[y,2].value;
                 superGroup := sheet.cells.item[y,3].value;
                 producer := sheet.cells.item[y,4].value;
                 groupName := sheet.cells.item[y,5].value;
                 groupCode := sheet.cells.item[y,6].value;
                 price := sheet.cells.item[y,7].value;

                 tempADOQuery.Close;
                 tempADOQuery.SQL.Text := 'select * from GroupBookTable where Ean = '+QuotedStr(ean) ;
                 tempADOQuery.Open;

                 if tempADOQuery.RecordCount = 0 then
                 begin
                      tempADOQuery.Close;
                      tempADOQuery.SQL.Text := 'insert into GroupBookTable (ean, Title, SuperGroupName, Producer, GroupName , GroupCode, price ) values ('+QuotedStr(ean)+ ','+QuotedStr(title)+ ','+QuotedStr(superGroup)+ ','+QuotedStr(producer)+ ','+QuotedStr(groupName)+ ','+QuotedStr(groupCode)+ ','+QuotedStr(price)+') ';
                      tempADOQuery.ExecSQL;
                 end
                 else
                 begin
                     tempADOQuery.Close;
                     tempADOQuery.SQL.Text := 'update  GroupBookTable set '
                               +' ean = '+ QuotedStr(ean)
                               +', Title = '+ QuotedStr(title)
                               +', SuperGroupName =  '+ QuotedStr(superGroup)
                               +', Producer = '+ QuotedStr(producer)
                               +', GroupName =  '+ QuotedStr(groupName)
                               +', GroupCode = '+ QuotedStr(groupCode)
                               +', price = '+ QuotedStr(price)
                               +' where ean = '+ QuotedStr(ean);
                     tempADOQuery.ExecSQL;
                 end ;
                // mainForm.Repaint;
             except
              begin
                if ErrorList = '' then
                    ErrorList :=  ean
                else
                    ErrorList := ErrorList +', '+ean;
              end;

             end;
         end;
         XLApp1.Workbooks.close;

        showmessage('!!! عملیات فراخوانی اطلاعات کتابها از فایل اکسل انجام گردید');
        if ErrorList <> '' then
            ShowMessage('در عملیات ثبت ، شابک های زیر موجود در فایل اکسل قابل ثبت نبوده است'+' ('+ErrorList+')');
       LoadGroupBookBitBtn.Enabled := True;
       ProgressBar1.Position := 0;
       messageLabel.Visible := false;
end;

procedure TmainForm.showGroupBookBitBtnClick(Sender: TObject);
begin
   showGroupBookForm.showmodal;
end;

procedure TmainForm.BitBtn1Click(Sender: TObject);
begin
   AllBookADOQuery.Close;
   AllBookADOQuery.SQL.Text := 'select ShelfNumber as ''شماره قفسه'' ,B.Ean as ''شابک'' , G.title as ''عنوان'',B.GroupCode as ''کدگروه''  , G.Producer as ''ناشر'',B.GroupName as ''نام گروه'' ,G.SuperGroupName as ''سرگروه''  ,G.price as ''قیمت'' '
         +' from BookPlaceCodeTable B left Join GroupBookTable G on B.Ean = G.Ean';
   AllBookADOQuery.Open;
   scExcelExport1.ExportDataset;
   scExcelExport1.Disconnect();
end;

procedure TmainForm.LoadGroupBookBitBtnClick(Sender: TObject);
begin
   inherited;
      excelLoad(1);

end;

procedure TmainForm.BitBtnClick(Sender: TObject);
begin
   registerBookShelfForm.showmodal;
end;

procedure TmainForm.clearDataBitBtnClick(Sender: TObject);
begin
    if MessageDlg('آیا از حذف اطلاعات کتابها در قفسه ها مطمئن هستید؟',   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       begin
           tempADOQuery.Close;
           tempADOQuery.SQL.Text := ' delete from BookPlaceCodeTable ';
           tempADOQuery.ExecSQL;
           showmessage('عمل حذف اطلاعات با موفقیت انجام گردید');
        end;
    end;
end;

procedure TmainForm.exitBitBtnClick(Sender: TObject);
begin
    close;
end;

procedure TmainForm.FormShow(Sender: TObject);
begin
   ADOConnection.Close;
   //showmessage(ExtractFilePath(Application.ExeName));
   //ADOConnection.ConnectionString :=  'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + ExtractFilePath(Application.ExeName) + 'db.accdb;Persist Security Info=False';

  // ADOConnection.ConnectionString :=  'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + ExtractFilePath(Application.ExeName) + 'db.mdb;Persist Security Info=False';
   ADOConnection.ConnectionString :=  'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+ ExtractFilePath(Application.ExeName) +'DB.mdb;Persist Security Info=True';
   ADOConnection.Open();
end;

end.
