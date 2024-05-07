unit GroupBookUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TshowGroupBookForm = class(TForm)
    Label2: TLabel;
    EanEdit: TEdit;
    RegisterShelfBookBitBtn: TBitBtn;
    GroupNameLabel: TLabel;
    tempADOQuery: TADOQuery;
    GroupCodeLabel: TLabel;
    TitleLabel: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    EanLabel: TLabel;
    Label6: TLabel;
    producerLabel: TLabel;
    priceLabel: TLabel;
    Label8: TLabel;
    procedure RegisterShelfBookBitBtnClick(Sender: TObject);
    procedure EanEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  showGroupBookForm: TshowGroupBookForm;

implementation

{$R *.dfm}

uses mainUnit;

procedure TshowGroupBookForm.EanEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then
      RegisterShelfBookBitBtnClick(sender);
end;

procedure TshowGroupBookForm.RegisterShelfBookBitBtnClick(Sender: TObject);
begin
    if trim(EanEdit.Text)='' then
     begin
        Application.MessageBox('لطفاً شابک کتاب را وارد نمایید','خطا',MB_ICONERROR) ;
        exit;
     end;

     if length(trim(EanEdit.Text))<> 13 then
     begin
        Application.MessageBox('لطفاً شابک کتاب را درست وارد نمایید','خطا',MB_ICONERROR) ;
        exit;
     end;

     tempADOQuery.Close;
     tempADOQuery.SQL.Text := ' select * from GroupBookTable where Ean = '+QuotedStr(Trim(EanEdit.Text))+' and Ean ='+QuotedStr(Trim(EanEdit.Text));
     tempADOQuery.Open;

     if tempADOQuery.RecordCount > 0 then
     begin
         GroupCodeLabel.Caption := tempADOQuery.FieldByName('GroupCode').AsString;
         GroupNameLabel.Caption := tempADOQuery.FieldByName('GroupName').AsString;
         TitleLabel.Caption := tempADOQuery.FieldByName('Title').AsString;
         EanLabel.Caption := tempADOQuery.FieldByName('Ean').AsString;
         ProducerLabel.Caption := tempADOQuery.FieldByName('Producer').AsString;
         priceLabel.Caption := tempADOQuery.FieldByName('price').AsString;
         EanEdit.Clear;
         EanEdit.SetFocus;
     end
     else
     begin
         GroupCodeLabel.Caption := '';
         GroupNameLabel.Caption := '';
         ProducerLabel.Caption := '';
         priceLabel.Caption := '';
         EanLabel.Caption := EanEdit.Text;
         TitleLabel.Caption := 'موردی پیدا نشد';
         EanEdit.Clear;
         EanEdit.SetFocus;
     end

end;

end.
