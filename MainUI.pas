unit MainUI;

{$SCOPEDENUMS ON}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cod.Windows, Cod.SysUtils, Cod.ArrayHelpers,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Cod.Files, Cod.Types,
  Types, IOUtils, UITypes, Zip, Math, Cod.ColorUtils,
  Cod.Visual.Chart, Cod.StringUtils, System.Generics.Collections, DateUtils,
  Cod.TimeUtils;

type
  TSender = (Unknown{System}, Me, Them);

  TPairType<T> = record
    Me: T;
    Them: T;

    procedure Clear(Value: T);
    procedure SetBySender(Sender: TSender; Value: T);
  end;

  TInt64Pair = record
    Me: int64;
    Them: int64;

    procedure AddBySender(Sender: TSender; Value: int64);
    procedure Clear;

    function Total: int64;
  end;

  TGrowthInterval = record
    PointsMe: int64;
    PointsThem: int64;

    StartDate,
    EndDate: TDateTime;

    function Total: int64;
  end;

  TMessage = record
    Text: string;
    Sender: TSender;
    SenderName: string;
    Date: TDateTime;
    Attachment: boolean;
    AttachmentName: string;

    // Utils
    function QuestionCounter: integer;

    // Points per message
    function CalculatePoints: int64;

    function ContainCount(Items: TArray<string>): integer;

    function AboutMe: integer;
    function AboutThem: integer;

    // Load
    function IsValidLine(Line: string): boolean;
    function LoadFromLine(Line: string): boolean;
  end;

  TConversation = record
    Messages: TArray<TMessage>;
    StartTime: TDateTime;
    EndTime: TDateTime;

    function FirstMessage: TMessage;
    function LastMessage: TMessage;

    function MessageCount: int64;
  end;

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Image1: TImage;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Template: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    Label20: TLabel;
    Panel5: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    PaintBox1: TPaintBox;
    CChart1: CChart;
    Panel6: TPanel;
    Label26: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Button2: TButton;
    PaintBox2: TPaintBox;
    Label38: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Panel9: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Panel10: TPanel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Panel11: TPanel;
    Label73: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label41: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Panel14: TPanel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Panel15: TPanel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label60: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Panel18: TPanel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Panel19: TPanel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Panel20: TPanel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Panel21: TPanel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Panel22: TPanel;
    Panel23: TPanel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Panel24: TPanel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Panel25: TPanel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Panel26: TPanel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Panel27: TPanel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Panel28: TPanel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Panel29: TPanel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label37: TLabel;
    Label72: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    // DB
    procedure ClearDatabase;
    procedure LoadFromDatabase;
    procedure LoadFromDatabaseEx;
    procedure AnalizeDatabase;

    // UI
    procedure LoadToUI;

    procedure UICompareSet(ComMe, ComThem: TLabel; Me, Them: string; Relation: TValueRelationship); overload;
    procedure UICompareSet(ComMe, ComThem: TLabel; Me, Them: int64); overload;
    procedure UICompareSet(ComMe, ComThem: TLabel; Me, Them: single); overload;
    procedure UICompareSet(ComMe, ComThem: TLabel; Pair: TInt64Pair); overload;
    procedure UICompareSet(ComMe, ComThem: TLabel; Pair: TPairType<single>); overload;
    procedure UICompareSetSeconds(ComMe, ComThem: TLabel; Me, Them: int64); overload;
    procedure UICompareSetSeconds(ComMe, ComThem: TLabel; Pair: TInt64Pair); overload;

    // Zip
    procedure OpenChat(ZipArchive: string);
  end;

const
  COLOR_ME: TColor = $00FE8309;
  COLOR_THEM: TColor = $00E2E762;

  INTERVAL_COUNT = 150;

  // For conversation grouping
  TIME_THRESHOLD = OneHour * 2; // hours

var
  Form1: TForm1;

  // System
  AppData,
  AppDataTemp,
  AppDataDB: string;

  // Database
  IsLoaded: boolean;
  Messages: TArray<TMessage>;

  // Conversations grouping
  Conversations: TArray<TConversation>;

  // Status
  ChatStart,
  ChatEnd: TDateTime;

  ChatActiveTimes: array[0..6] of array[0..4] of single;

  GrowthIntervals: TArray<TGrowthInterval>;

  TotalPoints: TInt64Pair;
  TotalMsg: TInt64Pair;
  TotalWords: TInt64Pair;
  TotalUniqueWords: TInt64Pair;
  TotalCharacters: TInt64Pair;

  Favourite3WordsMe,
  Favourite3WordsThem: TArray<string>;

  AboutMePercentage: single;

  // Response analisis
  ImmediateReplies: TPairType<single>; // 0-1, percentage
  FirstResponseTime: TInt64Pair; // seconds
  AverageResponseTime: TInt64Pair; // seconds

  // Generic counter
  CountLaugh,
  CountApology,
  CountQuestion,
  CountEncouragement,
  CountSmilies,
  CountURLs,
  CountAttachments: TInt64Pair;

  CountStarted,
  CountEnded,
  CountContributor,
  CountDlbMessage,
  CountIgnored: TInt64Pair;

  // Status
  ChatWith: string;

implementation

{$R *.dfm}

{ TMessage }

procedure ConvertStrToDateTime(const DateTimeStr: string; out DateTimeValue: TDateTime);
begin
  // Adjust format settings to match the input string
  FormatSettings.DateSeparator := '/';
  FormatSettings.TimeSeparator := ':';
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.LongTimeFormat := 'hh:nn';

  try
    DateTimeValue := StrToDateTime(DateTimeStr, FormatSettings);
  except
    DateTimeValue := 0;
  end;
end;

function TMessage.ContainCount(Items: TArray<string>): integer;
begin
  Result := 0;
  const S = Text.ToLower;

  for var I := 0 to High(Items) do
    Inc(Result, StrCount(Items[I], S));
end;

function TMessage.AboutMe: integer;
begin
  Result := 0;
  const S = Text.ToLower;

  // Add
  Inc(Result, StrCount('i', S)); // I
  Inc(Result, StrCount('myself', S));
  Inc(Result, StrCount('me', S));
  Inc(Result, StrCount('am', S)); // en, y not

  Inc(Result, StrCount('am', S)); // ro
  Inc(Result, StrCount('însămi', S));
    Inc(Result, StrCount('insami', S));
    Inc(Result, StrCount('insămi', S));
    Inc(Result, StrCount('însami', S));
  Inc(Result, StrCount('însumi', S));
    Inc(Result, StrCount('insumi', S));
  Inc(Result, StrCount('eu', S));
  Inc(Result, StrCount('sunt', S));
  Inc(Result, StrCount('îs', S));
    Inc(Result, StrCount('is', S));
  Inc(Result, StrCount('ma', S));
  Inc(Result, StrCount('mă', S));
  Inc(Result, StrCount('aș', S));
    Inc(Result, StrCount('as', S));
end;

function TMessage.AboutThem: integer;
begin
  Result := 0;
  const S = Text.ToLower;

  // Add
  Inc(Result, StrCount('you', S));
  Inc(Result, StrCount('yourself', S));
  Inc(Result, StrCount('are', S));

  Inc(Result, StrCount('tu', S));
  Inc(Result, StrCount('ai', S));
  Inc(Result, StrCount('ești', S));
    Inc(Result, StrCount('esti', S));
  Inc(Result, StrCount('însăși', S));
    Inc(Result, StrCount('insasi', S));
    Inc(Result, StrCount('insași', S));
    Inc(Result, StrCount('insăsi', S));
    Inc(Result, StrCount('însași', S));
    Inc(Result, StrCount('însăsi', S));
  Inc(Result, StrCount('însuși', S));
    Inc(Result, StrCount('insusi', S));
    Inc(Result, StrCount('insuși', S));
    Inc(Result, StrCount('însusi', S));
end;

function TMessage.CalculatePoints: int64;
begin
  Result := Length(Text);
  const TextLow = Text.ToLower;

  // Formatted
  if Text.Contains('.') then
    Inc(Result);
  if Text.Contains('!') then
    Inc(Result);
  if Text.Contains('?') then
    Inc(Result);

  // Proper

  // Common
  if TextLow.Contains('thx') or TextLow.Contains('ms') or TextLow.Contains('mersi') then
    Inc(Result, 25);

  if Text.Contains(':)') or Text.Contains(':\') or Text.Contains(':(')
    or Text.Contains(':|') or TextLow.Contains(':D') or Text.Contains('xd')
    or Text.Contains(':]') or Text.Contains(':[') then
  Inc(Result, 50);

  if Text.Contains('<3') or Text.Contains('^-^') or Text.Contains('^_^') or TextLow.Contains('ily')  then
    Inc(Result, 100);
end;

function TMessage.IsValidLine(Line: string): boolean;
begin
  const F = Line.IndexOf(' - ');
  const L = Line.IndexOf(': ');

  const FS = Line.IndexOf('/');
  const FL = Line.IndexOf('/', FS+1);

  Result := (F <> -1) and ((L = -1) or (F < L))
    and (FS < FL) and InRange(FS, 0, F) and InRange(FL, 0, F);
end;

function TMessage.LoadFromLine(Line: string): boolean;
var
  P: integer;
  S: string;
begin
  Result := false;

  // Date time
  P := Line.IndexOf(' - ');
  S := Line.Substring(0, P);
  if P = -1 then
    Exit;

  // Sub
  Line := Line.Substring(P+3);

  ConvertStrToDateTime(S, Date);

  // Sender
  P := Line.IndexOf(': ');
  S := Line.Substring(0, P);
  if P <> -1 then
    Line := Line.Substring(P+2);

  SenderName := S;

  // Sender
  if S = '' then
    Sender := TSender.Unknown
  else
    if S.ToLower = ChatWith.ToLower then
      Sender := TSender.Them
    else
      Sender := TSender.Me;

  // Message
  Text := Line;

  // Attachment
  Attachment := false;
  AttachmentName := '';
  if Text = '<Media omitted>' then begin
    Attachment := true;
    Text := '';
  end;

  // Attachment file (included)
  const FILE_ATTACH_STR = ' (file attached)';
  P := Text.IndexOf(FILE_ATTACH_STR);
  if P <> -1 then begin
    Attachment := true;
    AttachmentName := Text.Substring(0, P);

    Text := Text.Substring(P+FILE_ATTACH_STR.Length + 1 {remove the #13 I added}, Text.Length);
  end;

  // Success
  Result := true;
end;

function TMessage.QuestionCounter: integer;
begin
  Result := ContainCount(['question', 'intrebareț', 'întrebare', 'îți',
    'iti', 'ask you', 'pot sa', 'pot să', 'can i', 'vrei să', 'vrei sa',
    'ai vrea', 'ce crezi', 'would you', 'what do you', 'should i',
    'should we', 'should you', 'ar trebui', 'ti-ar ']);

  if Result = 0 then
    Result := ContainCount(['?']);
end;

function ExtractWords(const Input: string): TArray<string>;
var
  i: Integer;
  InWord: Boolean;
  CurrentWord: string;
  Words: TArray<string>;
begin
  SetLength(Words, 0);
  InWord := False;
  CurrentWord := '';

  for i := 1 to Length(Input) do
  begin
    if CharInSet(Input[i], ['A'..'Z', 'a'..'z', '0'..'9', '_']) or (Ord(Input[i]) > 127) then
    begin
      // Add character to the current word
      CurrentWord := CurrentWord + Input[i];
      InWord := True;
    end
    else
    begin
      if InWord then
      begin
        // Word ends, add to array
        SetLength(Words, Length(Words) + 1);
        Words[High(Words)] := CurrentWord.ToLower;
        CurrentWord := '';
      end;
      InWord := False;
    end;
  end;

  // Add the last word if the string ends with a word
  if InWord then
  begin
    SetLength(Words, Length(Words) + 1);
    Words[High(Words)] := CurrentWord;
  end;

  Result := Words;
end;

function GetTop3Indices(const Arr: TArray<Int64>): TArray<Int64>;
var
  i: Int64;
  Max1, Max2, Max3: Int64;
  Idx1, Idx2, Idx3: Int64;
begin
  // Initialize max values and indices
  Max1 := Low(Integer); Max2 := Low(Integer); Max3 := Low(Integer);
  Idx1 := -1; Idx2 := -1; Idx3 := -1;

  // Iterate through the array
  for i := 0 to High(Arr) do
  begin
    if Arr[i] > Max1 then
    begin
      // Shift Max1 to Max2, and Max2 to Max3
      Max3 := Max2; Idx3 := Idx2;
      Max2 := Max1; Idx2 := Idx1;
      Max1 := Arr[i]; Idx1 := i;
    end
    else if Arr[i] > Max2 then
    begin
      // Shift Max2 to Max3
      Max3 := Max2; Idx3 := Idx2;
      Max2 := Arr[i]; Idx2 := i;
    end
    else if Arr[i] > Max3 then
    begin
      // Update Max3
      Max3 := Arr[i];
      Idx3 := i;
    end;
  end;

  // Return indices of the top 3 values
  Result := [Idx1, Idx2, Idx3];
end;

procedure TForm1.AnalizeDatabase;
var
  AboutMe, AboutThem: int64;

  ChatIntervalOffset: double;

  WordsMe,
  WordsThem: TArray<string>;
  WordUsageMe,
  WordUsageThem: TArray<int64>;
procedure ProcessWord(Word: string; var Words: TArray<string>; var WordUsage: TArray<int64>);
begin
  Word := Word.ToLower;

  const Index = TArray.IndexOf<string>(Words, Word);
  if Index <> -1 then begin

    // If at least 4 lettters
    if Length(Word) >= 5 then
      Inc( WordUsage[Index] );
    Exit;
  end;

  // Add
  Words := Words + [Word];
  WordUsage := WordUsage + [1];
end;
begin
  // Intervals
  ChatStart := 0;
  ChatEnd := 0;

  // Message count
  TotalMsg.Clear;

  GrowthIntervals := [];

  // Active times
  for var D := 0 to High(ChatActiveTimes) do
    for var T := 0 to High(ChatActiveTimes[D]) do
      ChatActiveTimes[D, T] := 0;

  // Pts
  TotalPoints.Clear;

  // Stats
  TotalWords.Clear;
  TotalUniqueWords.Clear;

  // Most used words
  Favourite3WordsMe := [];
  Favourite3WordsThem := [];

  // Local
  WordsMe := [];
  WordsThem := [];
  WordUsageMe := [];
  WordUsageThem := [];

  TotalCharacters.Clear;

  AboutMe := 0;
  AboutThem := 0;

  // Content
  CountLaugh.Clear;
  CountApology.Clear;
  CountQuestion.Clear;
  CountEncouragement.Clear;
  CountSmilies.Clear;
  CountURLs.Clear;
  CountAttachments.Clear;

  // Chat analysis
  CountStarted.Clear;
  CountEnded.Clear;
  CountContributor.Clear;
  CountDlbMessage.Clear;
  CountIgnored.Clear;

  // Response analytics
  ImmediateReplies.Clear(0);
  FirstResponseTime.Clear;
  AverageResponseTime.Clear;

  // Chat range
  if Length(Messages) > 0 then begin
    ChatStart := Messages[0].Date;
    ChatEnd := Messages[High(Messages)].Date;

    ChatIntervalOffset := ChatEnd-ChatStart;
  end;

  // Intervals
  if Length(Messages) > 0 then
    SetLength(GrowthIntervals, INTERVAL_COUNT);

  for var I := 0 to High(GrowthIntervals) do begin
    with GrowthIntervals[I] do begin
      PointsMe := 0;
      PointsThem := 0;

      StartDate := ChatStart + (I / INTERVAL_COUNT) * ChatIntervalOffset;
      EndDate := ChatStart + ((I+1) / INTERVAL_COUNT) * ChatIntervalOffset;
    end;
  end;

  // Add messages to intervals (this will obviously not run if length(messages)=0)
  var IntIndex: integer; IntIndex := 0;
  for var I := 0 to High(Messages) do begin
    // Ensure index is up to date
    while (Messages[I].Date > GrowthIntervals[IntIndex].EndDate) and (IntIndex <= INTERVAL_COUNT-2) do
      Inc(IntIndex);

    // Add score
    const MsgPoints = Messages[I].CalculatePoints;
    case Messages[I].Sender of
      TSender.Me: Inc( GrowthIntervals[IntIndex].PointsMe, MsgPoints );
      TSender.Them: Inc( GrowthIntervals[IntIndex].PointsThem, MsgPoints );
    end;
  end;

  // Scan messages
  for var I := 0 to High(Messages) do begin
    // By sender
    case Messages[I].Sender of
      TSender.Me: begin
        Inc(TotalMsg.Me);

        Inc(TotalPoints.Me, Messages[I].CalculatePoints);

        const Words = ExtractWords(Messages[I].Text);

        // Scan unique
        for var J := 0 to High(Words) do
          ProcessWord(Words[J], WordsMe, WordUsageMe);

        Inc(TotalWords.Me, Length(Words));
        Inc(TotalCharacters.Me, Messages[I].Text.Length);

        Inc(AboutMe, Messages[I].AboutMe);
        Inc(AboutThem, Messages[I].AboutThem);
      end;
      TSender.Them: begin
        Inc(TotalMsg.Them);

        Inc(TotalPoints.Them, Messages[I].CalculatePoints);

        const Words = ExtractWords(Messages[I].Text);

        // Scan unique
        for var J := 0 to High(Words) do
          ProcessWord(Words[J], WordsThem, WordUsageThem);

        Inc(TotalWords.Them, Length(Words));
        Inc(TotalCharacters.Them, Messages[I].Text.Length);

        Inc(AboutMe, Messages[I].AboutThem);
        Inc(AboutThem, Messages[I].AboutMe);
      end;
    end;

    // Active time
    const Day = DayOfTheWeek(Messages[I].Date)-1;
    const Hour = HourOf(Messages[I].Date);

    var TimeActive: integer;
    case Hour of
      // Early morning
      4..7: TimeActive := 0;

      // Morning
      8..10: TimeActive := 1;

      // Afternoon
      11..16: TimeActive := 2;

      // Evening
      17..21: TimeActive := 3;

      // Late night
      1..3,
      22..23: TimeActive := 4;
      else TimeActive := -1;
    end;

    if TimeActive <> -1 then
      ChatActiveTimes[Day, TimeActive] := ChatActiveTimes[Day, TimeActive] + 1;

    // Content analysis
    with Messages[I] do begin
      CountLaugh.AddBySender(Sender, ContainCount(['xd', 'haha', 'lol', 'hah',
        '😂', '🤣', '😅', '😆', '😁', '😹']));

      CountApology.AddBySender(Sender, ContainCount(['sorry', 'apologize', 'sry',
        'sowwy', 'scuze', 'iertar'{e/i}, 'iertă', 'imi pare rau', 'îmi pare rău',
        'imi pare rău', 'îmi pare rau', '😔', '💔', '🙏', '😢']));

      CountQuestion.AddBySender(Sender, QuestionCounter);

      CountEncouragement.AddBySender(Sender, ContainCount(['!']));
      CountSmilies.AddBySender(Sender, ContainCount([':)', ':(', ':\', ':/',
        ':|', ':o', ':p', ':t', ':]', ':[', '^-^', '^_^', ':d'{or :D},
        ':*(', ':*)', ':'#39')', ':'#39'(']));

      CountURLs.AddBySender(Sender, ContainCount(['https://', 'http://', 'www.', 'ftp://']));

      if Attachment then
        CountAttachments.AddBySender(Sender, 1)
    end;
  end;

  // Fixup active
  for var D := 0 to High(ChatActiveTimes) do
    for var T := 0 to High(ChatActiveTimes[D]) do
      ChatActiveTimes[D, T] := Min(ChatActiveTimes[D, T] / 500, 1);

  TotalUniqueWords.Me := Length(WordsMe);
  TotalUniqueWords.Them := Length(WordsThem);

  // Favourite word
  var IndexXMe, IndexXThem: TArray<int64>;
  IndexXMe := GetTop3Indices( WordUsageMe );
  IndexXThem := GetTop3Indices( WordUsageThem );
  if Length(WordsMe) < 3 then
    SetLength(IndexXMe, Length(WordsMe));
  if Length(WordsThem) < 3 then
    SetLength(IndexXThem, Length(WordsThem));

  Favourite3WordsMe := TArrayUtils<string>.Build(Length(IndexXMe), function(Index: integer): string   begin
    Result := WordsMe[IndexXMe[Index]];
  end);
  Favourite3WordsThem := TArrayUtils<string>.Build(Length(IndexXThem), function(Index: integer): string   begin
    Result := WordsThem[IndexXThem[Index]];
  end);

  // Conversation analitics
  for var I := 0 to High(Conversations) do begin
    const FirstMsg = Conversations[I].FirstMessage;
    const LastMsg = Conversations[I].LastMessage;

    // Started
    CountStarted.AddBySender(FirstMsg.Sender, 1);

    // Ignored
    if Conversations[I].MessageCount = 1 then begin
      CountIgnored.AddBySender(FirstMsg.Sender, 1);
      continue;
    end;

    // Ended
    CountEnded.AddBySender(LastMsg.Sender, 1);

    // Double messages
    for var J := 0 to Conversations[I].MessageCount-2{skip high} do
      if (Conversations[I].Messages[J].Sender = Conversations[I].Messages[J+1].Sender)
        and (Conversations[I].Messages[J].QuestionCounter > 0)
        and (Conversations[I].Messages[J+1].QuestionCounter > 0) then
          CountDlbMessage.AddBySender(Conversations[I].Messages[J].Sender, 1);

    // Top contributor
    if Conversations[I].MessageCount >= 50 then begin
      var ContribMe, ContribThem: integer;
      ContribMe := 0; ContribThem := 0;
      for var J := 0 to Conversations[I].MessageCount-1  do
        case Conversations[I].Messages[J].Sender of
          TSender.Me: Inc( ContribMe );
          TSender.Them: Inc( ContribThem );
        end;

      const MeRatio = ContribMe / ContribThem;
      if MeRatio >= 2 then
        CountContributor.AddBySender(TSender.Me, 1)
      else if MeRatio <= 0.5 then
        CountContributor.AddBySender(TSender.Them, 1);
    end;

    // Last ignored
    if LastMsg.QuestionCounter > 0 then
      CountIgnored.AddBySender(LastMsg.Sender, 1);
  end;

  // Response analitics

  (* first response time *)
  var TimeToRespond, TimesFirst: TInt64Pair; TimeToRespond.Clear; TimesFirst.Clear;
  for var I := 0 to High(Conversations) do begin
    if Conversations[I].MessageCount <= 1 then
      continue;

    // Who shall reply
    const FirstMessage = Conversations[I].FirstMessage;
    const Initiator = FirstMessage.Sender;
    if Initiator = TSender.Unknown then
      continue;

    var RecieveIndex: integer; RecieveIndex := -1;
    for var J := 0 to Conversations[I].MessageCount-1 do
      if Conversations[I].Messages[J].Sender <> Initiator then begin
        RecieveIndex := J;
        break;
      end;

    // Not recieved (ignored)
    if RecieveIndex = -1 then
      continue;

    with Conversations[I].Messages[RecieveIndex] do begin
      const SecondPassed = SecondsBetween(FirstMessage.Date, Date);

      TimesFirst.AddBySender(Sender, 1);
      TimeToRespond.AddBySender(Sender, SecondPassed);
    end;
  end;
  if TimesFirst.Me > 0 then
    FirstResponseTime.Me := TimeToRespond.Me div TimesFirst.Me;
  if TimesFirst.Them > 0 then
    FirstResponseTime.Them := TimeToRespond.Them div TimesFirst.Them;

  (* averate response time *)
  TimeToRespond.Clear; TimesFirst.Clear;
  var TotalReplies, ImmediateReplyCount: TInt64Pair; TotalReplies.Clear; ImmediateReplyCount.Clear;
  for var I := 0 to High(Conversations) do begin
    var FoundFirst: boolean; FoundFirst := false;
    for var J := 0 to Conversations[I].MessageCount-2{skip high} do begin
      const FirstMsg = Conversations[I].Messages[J];
      const SecondMsg = Conversations[I].Messages[J+1];

      // Skip
      if (FirstMsg.Sender = SecondMsg.Sender) or (FirstMsg.Sender = TSender.Unknown)
        or (SecondMsg.Sender = TSender.Unknown) then
          Continue;

      // Ignore response time of first message
      if not FoundFirst then begin
        FoundFirst := true;
        continue;
      end;

      // Measure time
      const SecondPassed = SecondsBetween(FirstMsg.Date, SecondMsg.Date);

      // Add
      TimesFirst.AddBySender(SecondMsg.Sender, 1);
      TimeToRespond.AddBySender(SecondMsg.Sender, SecondPassed);

      // Reply
      TotalReplies.AddBySender(SecondMsg.Sender, 1);
      if SecondPassed < 90 {1.5 minutes} then
        ImmediateReplyCount.AddBySender(SecondMsg.Sender, 1);
    end;
  end;
  if TimesFirst.Me > 0 then
    AverageResponseTime.Me := TimeToRespond.Me div TimesFirst.Me;
  if TimesFirst.Them > 0 then
    AverageResponseTime.Them := TimeToRespond.Them div TimesFirst.Them;

  if TotalReplies.Me > 0 then
    ImmediateReplies.Me := ImmediateReplyCount.Me / TotalReplies.Me;
  if TotalReplies.Them > 0 then
    ImmediateReplies.Them := ImmediateReplyCount.Them / TotalReplies.Them;

  // About
  const TotalAbout = AboutMe+AboutThem;

  if TotalAbout = 0 then
    AboutMePercentage := 0.5
  else
    AboutMePercentage := AboutMe/TotalAbout;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then
    Exit;

  OpenChat( OpenDialog1.FileName );
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // Delete
  if TDirectory.Exists(AppDataDB) then
    TDirectory.Delete(AppDataDB, true);

  // Load
  LoadFromDatabaseEx;
end;

procedure TForm1.ClearDatabase;
begin
  Messages := [];
  ChatWith := '';

  // UI elements
  GrowthIntervals := [];

  // Active times
  for var D := 0 to High(ChatActiveTimes) do
    for var T := 0 to High(ChatActiveTimes[D]) do
      ChatActiveTimes[D, T] := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // App data
  AppData := GetPathInAppData('Whatsapp Statistics', TAppDataType.Local, true);
  AppDataTemp := AppData + 'Temp\';
  AppDataDB := AppData + 'Database\';

  // Load
  LoadFromDatabaseEx;

  // Dark mode
  DarkModeApplyToWindow(Handle, true);

  // UI
  Template.Free;
end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - WheelDelta div 5;
end;

procedure TForm1.LoadFromDatabase;
var
  Msg: TMessage;
  MsgString: string;

  Conv: TConversation;
  I: integer;
begin
  // Clear
  ClearDatabase;

  // Load
  IsLoaded := false;
  try
    // Not exists
    if not TDirectory.Exists(AppDataDB) then
      Exit;

    // Load Database
    ChatWith := TFile.ReadAllText(AppDataDB+'chatwith.dat', TEncoding.UTF8);
    const ChatLog = TFile.ReadAllLines(AppDataDB+'chatlog.txt',TEncoding.UTF8);

    Messages := [];

    // Scan each line
    MsgString := '';
    for I := 0 to High(ChatLog) do begin
      const Line = ChatLog[I];

      // Valid
      if Msg.IsValidLine(Line) and (MsgString <> '') then begin
        // Parse
        if Msg.LoadFromLine( MsgString ) then
          // Add, ONLY IF IT'S A PROPER SENDER
          if Msg.Sender <> TSender.Unknown then
            Messages := Messages + [Msg];

        // Reset
        MsgString := Line;
      end else begin
        if MsgString <> '' then
          MsgString := MsgString + #13;
        MsgString := MsgString + Line;
      end;
    end;

    // Add last
    if MsgString <> '' then
      if Msg.LoadFromLine( MsgString ) then
        // Add
        Messages := Messages + [Msg];

    // Group into conversations
    Conversations := [];
    Conv.Messages := [];
    for I := 0 to High(Messages) do begin
      // Valid
      if Messages[I].Sender = TSender.Unknown then
        continue;

      // Start new
      if (Length(Conv.Messages) = 0) or
       (Messages[I].Date - Conv.EndTime > TIME_THRESHOLD) then begin
        if Length(Conv.Messages) > 0 then
          Conversations := Conversations + [Conv];

        SetLength(Conv.Messages, 0);
        Conv.StartTime := Messages[I].Date;
      end;

      // Add message to current conversation
      Conv.Messages := Conv.Messages + [Messages[I]];
      Conv.EndTime := Messages[I].Date;
    end;

    // Add the last conversation
   if Length(Conv.Messages) > 0 then
    Conversations := Conversations + [Conv];

    // Analise database
    AnalizeDatabase;

    // Done
    IsLoaded := true;
  finally
    // UI
    LoadToUI;
  end;
end;

procedure TForm1.LoadFromDatabaseEx;
begin
  // Try to load
  try
    LoadFromDatabase;
  except
    // Failure, clear data
    ClearDatabase;
    LoadToUI;

    // Notify user
    MessageDLG('The chat database failed to load. Sorry!', mtWarning, [mbOk], 0);
  end;
end;

function ConvertDateToStr(const InputDate: TDateTime): string;
begin
  // Format the date as "7 Dec 2015"
  Result := FormatDateTime('d mmm yyyy', InputDate);
end;

procedure TForm1.LoadToUI;
begin
  // Buttons
  Button2.Enabled := IsLoaded;

  // No chats
  Label5.Caption := 'Select a chat';
  Label6.Caption := 'No time period specified';

  Label12.Caption := '0 pts';
  Label13.Caption := '0 pts';
  Shape2.Width := 175;

  CChart1.Position := 50;
  Label34.Caption := '0%';
  Label35.Caption := '0%';

  UICompareSet(Label49, Label48, 0, 0);
  UICompareSet(Label53, Label52, 0, 0);
  UICompareSet(Label57, Label56, 0, 0);
  UICompareSet(Label119, Label118, 0, 0);

  UICompareSet(Label100, Label99, 0, 0);
  UICompareSet(Label104, Label103, 0, 0);
  UICompareSet(Label108, Label107, 0, 0);
  UICompareSet(Label116, Label115, 0, 0);
  UICompareSet(Label128, Label127, 0, 0);
  UICompareSet(Label112, Label111, 0, 0);
  UICompareSet(Label124, Label123, 0, 0);

  UICompareSet(Label78, Label77, 0, 0);
  UICompareSet(Label82, Label81, 0, 0);
  UICompareSet(Label86, Label85, 0, 0);
  UICompareSet(Label94, Label93, 0, 0);
  UICompareSet(Label90, Label89, 0, 0);

  UICompareSet(Label63, Label62, single(0), single(0));
  UICompareSetSeconds(Label67, Label66, 0, 0);
  UICompareSetSeconds(Label71, Label70, 0, 0);

  Label131.Caption := 'NO DATA';
  Label132.Caption := 'NO DATA';

  // Redraw
  PaintBox1.Repaint;
  PaintBox2.Repaint;



  // Not loaded
  if not IsLoaded then
    Exit;

  // Load data
  Label5.Caption := 'Your chat with '+ChatWith;

  // Date period
  if Length(Messages) > 0 then
    Label6.Caption := Format('From %S - %S', [ConvertDateToStr(ChatStart), ConvertDateToStr(ChatEnd)]);

  // Message pts
  Label12.Caption := Format('%D pts', [TotalPoints.Me]);
  Label13.Caption := Format('%D pts', [TotalPoints.Them]);
  if TotalMsg.Total = 0 then
    Shape2.Width := 0
  else
    Shape2.Width := Round(TotalMsg.Me/TotalMsg.Total * Shape1.Width);

  // Chat focus
  CChart1.Position := round(AboutMePercentage * 100);
  Label34.Caption := Format('%D%%', [round(AboutMePercentage*100)]);
  Label35.Caption := Format('%D%%', [100-round(AboutMePercentage*100)]);

  // Message analitics
  UICompareSet(Label49, Label48, TotalMsg);
  UICompareSet(Label53, Label52, TotalWords);
  UICompareSet(Label57, Label56, TotalUniqueWords);
  UICompareSet(Label119, Label118, TotalCharacters);

  // Favorite words
  Label131.Caption := string.Join(#13, Favourite3WordsMe);
  Label132.Caption := string.Join(#13, Favourite3WordsThem);

  // Content
  UICompareSet(Label100, Label99, CountLaugh);
  UICompareSet(Label104, Label103, CountApology);
  UICompareSet(Label108, Label107, CountQuestion);
  UICompareSet(Label116, Label115, CountEncouragement);
  UICompareSet(Label128, Label127, CountSmilies);
  UICompareSet(Label112, Label111, CountURLs);
  UICompareSet(Label124, Label123, CountAttachments);

  // Conv analysis
  UICompareSet(Label78, Label77, CountStarted);
  UICompareSet(Label82, Label81, CountEnded);
  UICompareSet(Label86, Label85, CountContributor);
  UICompareSet(Label94, Label93, CountDlbMessage);
  UICompareSet(Label90, Label89, CountIgnored);

  // Response analitics
  UICompareSet(Label63, Label62, ImmediateReplies);
  UICompareSetSeconds(Label67, Label66, FirstResponseTime);
  UICompareSetSeconds(Label71, Label70, AverageResponseTime);
end;

procedure UnzipToDirectory(const ZipFileName, TargetDirectory: string);
var
  ZipFile: TZipFile;
  FileName: string;
begin
  if not TFile.Exists(ZipFileName) then
    raise Exception.Create('ZIP file does not exist.');

  // Create dir
  if not TDirectory.Exists(TargetDirectory) then
    TDirectory.CreateDirectory(TargetDirectory);

  ZipFile := TZipFile.Create;
  try
    ZipFile.Open(ZipFileName, zmRead);

    // All files
    for FileName in ZipFile.FileNames do
      // Extract
      ZipFile.Extract(FileName, TargetDirectory, True);
  finally
    ZipFile.Free;
  end;
end;

procedure TForm1.OpenChat(ZipArchive: string);
const
  DEFAULT_NAME_PREFIX = 'WhatsApp Chat with ';
var
  AChatWith: string;
  AChatFileName: string;
begin
  if not TFile.Exists(ZipArchive) then begin
    MessageDLG('The zip archive does not exist', mtWarning, [mbOk], 0);
    Exit;
  end;

  // Get name
  const FileName = ExtractFileName(ZipArchive);
  AChatWith := '';
  if FileName.StartsWith(DEFAULT_NAME_PREFIX) then
    AChatWith := ChangeFileExt(FileName.Substring(DEFAULT_NAME_PREFIX.Length), '');

  if AChatWith = '' then
    if not InputQuery('Chatting with',
      'Who is this chat with? Please type their WhatsappName as It appears in the chat',
      AChatWith) then
        Exit;

  // Delete previous temp
  if TDirectory.Exists(AppDataTemp) then
    TDirectory.Delete(AppDataTemp, true);
  TDirectory.CreateDirectory(AppDataTemp);

  // Extract
  UnzipToDirectory(ZipArchive, AppDataTemp);

  AChatFileName := AppDataTemp+ChangeFileExt(FileName, '.txt');
  if not TFile.Exists(AChatFileName) then
    AChatFileName := '';

  if AChatFileName = '' then begin
    const Files = TDirectory.GetFiles(AppDataTemp, '*.txt');
    if Length(Files) > 0 then
      AChatFileName := Files[0];
  end;

  if AChatFileName = '' then begin
    MessageDLG('The chat log could not be read. Sorry about that :/', mtWarning, [mbOk], 0);
    Exit;
  end;

  // Delete previous DB
  if TDirectory.Exists(AppDataDB) then
    TDirectory.Delete(AppDataDB, true);
  TDirectory.CreateDirectory(AppDataDB);

  // Write
  try
    TFile.Copy(AChatFileName, AppDataDB+'chatlog.txt');
    TFile.WriteAllText(AppDataDB+'chatwith.dat', AChatWith, TEncoding.UTF8);
  except
    if TDirectory.Exists(AppDataDB) then
      TDirectory.Delete(AppDataDB, true);
    MessageDLG('The chat could not be read. Sorry!', mtWarning, [mbOk], 0);

    // proceed to load db
  end;

  // Load
  LoadFromDatabaseEx;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
const
  ACTIVE_START: TColor = $0052586B;
  ACTIVE_END: TColor = $0009AFFF;
var
  X, Y: integer;
  R: TRect;
begin
  with TPaintBox(Sender).Canvas do
    for var Day := 0 to 6 do begin
      // Positions
      X := 1{first el.} + Day * (Label20.Width + Label20.Margins.Left + Label20.Margins.Right);

      for var Time := 0 to 4 do begin
        Y := 1{first el.} + Time * (Label21.Height + Label21.Margins.Top + Label21.Margins.Bottom);

        // Rect
        R := Rect(X, Y, X+Label20.Width, Y+Label21.Height);

        // Accent
        Brush.Color := ColorBlend(ACTIVE_START, ACTIVE_END, round(ChatActiveTimes[Day, Time]*255));

        // FIll
        FillRect(R);
      end;
    end;
end;

function FormatDateToMonthYear(const ADate: TDate): string;
begin
  Result := FormatDateTime('MMM YYYY', ADate);
end;

procedure TForm1.PaintBox2Paint(Sender: TObject);
var
  S: string;
  R: TRect;

  DivSize, DivSpace, DivHeight: integer;

  PtsMe, PtsThem: int64;
  X, Y: integer;

  MaxPoints: int64;
  MaximumReference: int64;
begin
  // Prepare relations
  MaxPoints := 0;
  for var I := 0 to High(GrowthIntervals) do
    if GrowthIntervals[I].Total > MaxPoints then
      MaxPoints := GrowthIntervals[I].Total;

  MaximumReference := 100;
  while MaxPoints > MaximumReference do
    MaximumReference := MaximumReference + 100;

  // Sizes
  const AWidth = TPaintBox(Sender).Width;
  const AHeight = TPaintBox(Sender).Height;
  DivSize := AWidth div INTERVAL_COUNT;
  DivSpace := DivSize div 2;
  DivHeight := AHeight - 20;

  // Draw
  with TPaintBox(Sender).Canvas do begin
    Pen.Style := psClear;

    // Fill
    Brush.Color := ChangeColorSat(Self.Color, 10);
    FillRect(TPaintBox(Sender).ClientRect);

    // No intervals
    R := TPaintBox(Sender).ClientRect;
    if Length(GrowthIntervals) = 0 then begin
      Font.Color := clWhite;

      S := 'There isn'#39't any data to display here. Please load a chat first';
      TextRect(R, S, [tfSingleLine, tfCenter, tfVerticalCenter]);
      Exit;
    end;

    // Draw intervals
    for var I := 0 to INTERVAL_COUNT-1 do begin
      X := I * (DivSize + DivSpace);

      // Data
      PtsMe := GrowthIntervals[I].PointsMe;
      PtsThem := GrowthIntervals[I].PointsThem;

      // Them
      R := TRect.Create(Point(X, 0), DivSize, round((PtsMe+PtsThem)/MaximumReference*DivHeight));
      R.Offset(0, DivHeight-R.Height);

      Brush.Color := COLOR_THEM;
      RoundRect(R, 3, 3);

      // Me
      R := TRect.Create(Point(X, 0), DivSize, round(PtsMe/MaximumReference*DivHeight));
      R.Offset(0, DivHeight-R.Height);

      Brush.Color := COLOR_ME;
      RoundRect(R, 3, 3);
    end;

    // Draw some time
    Font.Color := TColors.Lightgray;
    Font.Size := 8;

    Pen.Style := psDot;
    Pen.Color := TColors.Lightgray;
    Pen.Width := 1;
    Brush.Style := bsClear;

    Y := DivHeight - round(MaxPoints/MaximumReference*DivHeight);
    MoveTo(0, Y);
    LineTo(AWidth, Y);

    if Y > TextHeight('A') + 3 then
      Y := Y - TextHeight('A') - 3
    else
      Y := Y + 3;

    S := Format('Maximum of %D pts', [MaxPoints]);
    R := Rect(0, Y, AWidth, Y+10);
    TextRect(R, S, [tfSingleLine, tfVerticalCenter, tfRight]);

    // Dates
    Font.Size := 9;
    var TotalElements: integer; TotalElements := 15;
    if MonthsBetween(ChatStart, ChatEnd) < TotalElements then
      TotalElements := MonthsBetween(ChatStart, ChatEnd)+1;

    const DateDivizer = round(AWidth / TotalElements);
    for var I := 0 to TotalElements-1 do begin
      const AInt = GrowthIntervals[round(I/(TotalElements-1) * (INTERVAL_COUNT-1))];
      const ADate = AInt.StartDate + (AInt.EndDate-AInt.StartDate) / 2;

      X := DateDivizer * I;
      R := TRect.Create(Point(X, DivHeight), 100, 20);

      S := FormatDateToMonthYear(ADate);

      TextRect(R, S, [tfSingleLine, tfCenter, tfVerticalCenter]);
    end;
  end;
end;

procedure TForm1.UICompareSet(ComMe, ComThem: TLabel; Pair: TInt64Pair);
begin
  UICompareSet(ComMe, ComThem, Pair.Me, Pair.Them);
end;

procedure TForm1.UICompareSet(ComMe, ComThem: TLabel; Me, Them: single);
begin
  UICompareSet(ComMe, ComThem, round(Me*100).ToString + '%',
    round(Them*100).ToString + '%', CompareValue(Me, Them));
end;

procedure TForm1.UICompareSet(ComMe, ComThem: TLabel; Me, Them: string;
  Relation: TValueRelationship);
begin
  ComMe.Caption := Me;
  ComThem.Caption := Them;

  // Color
  ComMe.Font.Color := clRed;
  ComThem.Font.Color := clRed;

  // Larger
  if Relation.IsGreaterOrEqual then
    ComMe.Font.Color := clLime;
  if Relation.IsLessOrEqual then
    ComThem.Font.Color := clLime;
end;

function IntToFormattedStr(Value: Integer): string;
begin
  Result := Format('%.0n', [Value * 1.0]); // Use Format with the thousands separator
end;

procedure TForm1.UICompareSet(ComMe, ComThem: TLabel; Me, Them: int64);
begin
  UICompareSet(ComMe, ComThem, IntToFormattedStr(Me), IntToFormattedStr(Them), CompareValue(Me, Them));
end;

{ TGrowthInterval }

function TGrowthInterval.Total: int64;
begin
  Result := Self.PointsMe + Self.PointsThem; // <3
end;

{ TInt64Pair }

procedure TInt64Pair.AddBySender(Sender: TSender; Value: int64);
begin
  case Sender of
    TSender.Me: Inc(Me, Value);
    TSender.Them: Inc(Them, Value);
  end;
end;

procedure TInt64Pair.Clear;
begin
  Me := 0;
  Them := 0;
end;

function TInt64Pair.Total: int64;
begin
  Result := Me + Them; // <3
end;

{ TConversation }

function TConversation.FirstMessage: TMessage;
begin
  Result := Messages[0];
end;

function TConversation.LastMessage: TMessage;
begin
  Result := Messages[High(Messages)];
end;

function TConversation.MessageCount: int64;
begin
  Result := Length(Messages);
end;

{ TPairType<T> }

procedure TPairType<T>.Clear(Value: T);
begin
  Me := Value;
  Them := Value;
end;

procedure TPairType<T>.SetBySender(Sender: TSender; Value: T);
begin
  case Sender of
    TSender.Me: Me := Value;
    TSender.Them: Them := Value;
  end;
end;

procedure TForm1.UICompareSet(ComMe, ComThem: TLabel; Pair: TPairType<single>);
begin
  UICompareSet(ComMe, ComThem, Pair.Me, Pair.Them);
end;

procedure TForm1.UICompareSetSeconds(ComMe, ComThem: TLabel; Pair: TInt64Pair);
begin
  UICompareSetSeconds(ComMe, ComThem, Pair.Me, Pair.Them);
end;

procedure TForm1.UICompareSetSeconds(ComMe, ComThem: TLabel; Me, Them: int64);
begin
  UICompareSet(ComMe, ComThem, TimePassedToString(Me),
    TimePassedToString(Them), CompareValue(Me, Them) * -1 {less is better});
end;

end.
