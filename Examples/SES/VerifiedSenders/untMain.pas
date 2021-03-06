unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm10 = class(TForm)
    lbSenders: TListBox;
    btnGetVerifiedSenders: TButton;
    procedure btnGetVerifiedSendersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses ksAwsSes, ksAwsBase;

// replace the values inside "credentials.inc" with your AWS credentials which you can
// create in the AWS IAM Console.

{$INCLUDE credentials.inc}

const
  C_AWS_RGN = awsEuWest1;

{$R *.dfm}

procedure TForm10.btnGetVerifiedSendersClick(Sender: TObject);
var
  ASes: IksAwsSES;
begin
  if Pos('*', C_SES_ACCESS_KEY) > 0 then
  begin
    ShowMessage('Please replace the C_SES_PUBLIC and C_SES_SECRET_KEY const in the credentials.inc with your credentials.');
    Exit;
  end;
  ASes := CreateSes(C_SES_ACCESS_KEY, C_SES_SECRET_KEY, C_AWS_RGN);
  ASes.GetSenders(lbSenders.Items);
end;

end.
