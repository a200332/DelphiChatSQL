unit U_User;

interface

Uses Graphics, Forms, Classes;

type

  TConnectState = (CS_CONNECT=0, CS_DISCONNECT=1, CS_HIDDEN=2);
  TUser = class
    private
      FNick: String;
      FMail: String;
      FConnectState : TConnectState;
      FImage: TBitMap;
      FUserID: Integer;

      procedure SetNick (value: String);
      procedure SetMail (Value:String);
      procedure SetConnectState (Value: TConnectState);
      procedure SetImage (Value: TBitMap);
      procedure SetUserID (Value: Integer);
    Public
      Destructor Destroy;
      Constructor Create;
      procedure LoadAvatarFromFile (URL: String);
    published
      property Nick: string read FNick write SetNick;
      property Mail: String read FMail write SetMail;
      property ConnectState: TConnectState read FConnectState write SetConnectState;
      property Avatar: TBitmap read FImage write SetImage;
      property UserId: Integer read FUserID write SetUserID;
  end;

  TContactList = TList;
  TContact = class (TUser)
    private
      FIsActive: Boolean; ///----> no me acuerdo para que era
      FIndex: Integer;

      procedure SetIsActive (value: Boolean);
      procedure SetIndex (Value: Integer);
    public
      WDW_Conversation: TForm;
      Constructor Create (_idx: integer);
      destructor Destroy;

      function GetIndex: Integer;
    published
      property IsActive: Boolean read FIsActive write SetIsActive;
      property UserIndex: Integer read FIndex write SetIndex;
  end;

implementation

////////////////////////////////////////////////////////////////////////////////
/////////// TUSER IMPLEMENTATIONS
////////////////////////////////////////////////////////////////////////////////

//GETTERS & SETTERS
procedure TUser.SetNick (value: String);
begin
  self.FNick:=value;
end;

procedure TUser.SetMail (Value:String);
begin
  self.FMail:=value;
end;

procedure TUser.SetConnectState (Value: TConnectState);
begin
  self.FConnectState:=value;
end;

procedure TUser.SetImage (Value: TBitMap);
begin
  self.FImage:=value;
end;

procedure TUser.SetUserID (Value: Integer);
begin
  self.FUserID:=value;
end;

//PUBLIC IMPLEMENTATIONS
Destructor TUser.Destroy;
Begin
  Self.FImage.Free;
End;

Constructor TUser.Create;
Begin
  Self.FImage:= TBitMap.Create;
End;

procedure TUser.LoadAvatarFromFile (URL: String);
Begin
  ////----FALTA COMPROBAR SI EL ARCHIVO EXISTE
  if self.FImage<>nil then self.FImage.LoadFromFile(URL);
End;

////////////////////////////////////////////////////////////////////////////////
/////////// TCONTACT IMPLEMENTATIONS
////////////////////////////////////////////////////////////////////////////////

//GETTERS & SETTERS
procedure TContact.SetIsActive (value: Boolean);
begin
  self.FIsActive:=value;
end;

procedure TContact.SetIndex (Value: Integer);
begin
  FIndex:= value;
end;
//PUBLIC IMPLEMENTATIONS
constructor TContact.Create(_idx: integer);
begin
  self.FIndex:= _idx;
  //FWDW_Conversation:=TForm.Create(nil);
end;

function TContact.GetIndex: Integer;
begin
  result:= FIndex;
end;

destructor TContact.Destroy;
begin
  self.WDW_Conversation.Free;
end;

end. //End U_User
