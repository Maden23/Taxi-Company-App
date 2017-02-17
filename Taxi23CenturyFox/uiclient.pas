unit UIClient;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db,  sqlite3conn, IBConnection,
  mysql50conn, mysql55conn, mssqlconn, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, DbCtrls, DBGrids;

type

  { TMainCustomerForm }

  TMainCustomerForm = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery1baby_sit: TLongintField;
    SQLQuery1carcase: TStringField;
    SQLQuery1color: TStringField;
    SQLQuery1comfort_rate: TLongintField;
    SQLQuery1id: TLongintField;
    SQLQuery1model: TStringField;
    SQLQuery1passenger: TLongintField;
    SQLQuery1reg_number: TStringField;
    SQLQuery1wide_trunk: TLongintField;
    SQLQuery2: TSQLQuery;
    SQLQuery2age: TLongintField;
    SQLQuery2available: TLongintField;
    SQLQuery2car_id: TLongintField;
    SQLQuery2father_name: TStringField;
    SQLQuery2first_name: TStringField;
    SQLQuery2id: TLongintField;
    SQLQuery2last_name: TStringField;
    SQLQuery2location: TLongintField;
    SQLQuery2working_time: TLongintField;
    SQLQuery2xp: TLongintField;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MainCustomerForm: TMainCustomerForm;

implementation

{$R *.lfm}

{ TMainCustomerForm }

procedure TMainCustomerForm.Button1Click(Sender: TObject);
begin
     try
        SQLite3Connection1.Open;
        SQLTransaction1.Active := True;
        Label1.Caption := 'Connection!';
     except
       Label1.Caption := 'Connection failed!';
     end;
     SQLQuery1.Close;
     SQLQuery1.Open;
     SQLQuery2.Close;
     SQLQuery2.Open;


end;

end.