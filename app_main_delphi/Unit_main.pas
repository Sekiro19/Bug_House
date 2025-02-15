{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit Unit_main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.StrUtils, System.IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, System.ImageList, FMX.ImgList,
  FMX.Media, FMX.Edit, FMX.Styles.Objects, FMX.TabControl, FMX.Effects,
  FMX.EditBox, FMX.ComboTrackBar, System.Actions, FMX.ActnList, FMX.Layouts,
  System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, FMX.ListBox, Data.DB,
  Data.Win.ADODB, PythonEngine, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.TMSFNCTypes,
  FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCScrollControl, FMX.TMSFNCRichEditorBase, FMX.TMSFNCRichEditor, FMX.TMSFNCCustomControl, FMX.TMSFNCToolBar,
  FMX.Colors, FMX.Ani, FMX.Grid.Style, FMX.Grid, Fmx.Bind.Grid, Data.Bind.Grid,
  FMX.TMSFNCCustomComponent, FMX.TMSFNCRichEditorIO, FMX.TMSFNCRichEditorToolBar, Windows, ShellAPI,
  FMX.ExtCtrls, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.frxClass, FMX.frxDBSet,
  FMX.TMSFNCPDFIO, FMX.TMSFNCRichEditorPDFIO, FMX.TMSFNCGraphicsPDFEngine,
  FMX.frxExportPDF, FMX.frxExportHTML, FMX.frxPreview, FMX.frxBarcode,
  FMX.frxBarcode2DView;

type
  TForm1 = class(TForm)
    centralwidget: TRectangle;
    bottomframe: TRectangle;
    Container: TRectangle;
    topframe: TRectangle;
    logoframe: TRectangle;
    searchframe: TRectangle;
    topRightFrame: TRectangle;
    logo: TGlyph;
    ImageList: TImageList;
    btn_profile: TCornerButton;
    label_reputation: TLabel;
    StyleBook: TStyleBook;
    btn_login: TCornerButton;
    edit_mainFilter: TEdit;
    Glyph1: TGlyph;
    midleft_frame: TRectangle;
    ShadowEffect1: TShadowEffect;
    stackedWidget: TTabControl;
    topmenu_frame: TRectangle;
    bottommenu_frame: TRectangle;
    Line: TLine;
    questions_page: TTabItem;
    profile_page: TTabItem;
    users_page: TTabItem;
    about_page: TTabItem;
    log_page: TTabItem;
    Label6: TLabel;
    Label8: TLabel;
    Layout1: TLayout;
    Glyph2: TGlyph;
    Label7: TLabel;
    Label9: TLabel;
    Glyph3: TGlyph;
    Label10: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    ShadowEffect2: TShadowEffect;
    Rectangle3: TRectangle;
    ShadowEffect3: TShadowEffect;
    Siz: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    loginpage_label_loginerror: TLabel;
    lineEdit_loginpage_login_displayname: TEdit;
    lineEdit_loginpage_login_password: TEdit;
    loginpage_btn_login: TCornerButton;
    Label11: TLabel;
    Label14: TLabel;
    lineEdit_loginpage_signin_displayname: TEdit;
    Label15: TLabel;
    lineEdit_loginpage_signin_password: TEdit;
    loginpage_btn_signin: TCornerButton;
    loginpage_label_signinerror: TLabel;
    lineEdit_loginpage_signin_reenterpassword: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    ADOConnection: TADOConnection;
    ADOQuery_PROC: TADOQuery;
    PythonDelphiVar: TPythonDelphiVar;
    PythonEngine: TPythonEngine;
    scrollArea_profile: TVertScrollBox;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    pfp: TImage;
    pfp_small: TImage;
    BindSourceDB1: TBindSourceDB;
    LinkControlToFieldProfileImage: TLinkControlToField;
    BindingsList1: TBindingsList;
    LinkControlToFieldProfileImage2: TLinkControlToField;
    label_profile_displayName: TLabel;
    label_profile_CreationDate: TLabel;
    Glyph4: TGlyph;
    btn_editprofile: TCornerButton;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    label_profile_totalAnswers: TLabel;
    label_profile_totalQuestions: TLabel;
    label_profile_viewsCount: TLabel;
    label_profile_totalDownvotes: TLabel;
    label_profile_totalUpvotes: TLabel;
    label_profile_Reputation: TLabel;
    plainTextEdit_profile_about: TMemo;
    listWidget_tags: TListBox;
    frame_profile_edit: TRectangle;
    Line1: TLine;
    Label28: TLabel;
    edit_profile_displayName: TEdit;
    Label29: TLabel;
    edit_profile_Cpassword: TEdit;
    Label30: TLabel;
    edit_profile_password: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    plainTextEdit_profile_edit_about: TMemo;
    btn_profile_edit_cancel: TCornerButton;
    btn_profile_edit_save: TCornerButton;
    Label34: TLabel;
    Line2: TLine;
    Glyph5: TGlyph;
    profile_QA_title: TEdit;
    label_profile_QA_title: TLabel;
    OpenDialog: TOpenDialog;
    Label36: TLabel;
    Label37: TLabel;
    Rect_RTE_profile: TRectangle;
    FlowLayout_RTE_profile: TFlowLayout;
    toolButton_undo: TCornerButton;
    toolButton_redo: TCornerButton;
    toolButton_bold: TCornerButton;
    toolButton_italic: TCornerButton;
    toolButton_underline: TCornerButton;
    cbox_fsize: TComboBox;
    toolButton_list: TCornerButton;
    toolButton_lalign: TCornerButton;
    toolButton_calign: TCornerButton;
    toolButton_ralign: TCornerButton;
    toolButton_image: TCornerButton;
    ColorAnimation1: TColorAnimation;
    ColorAnimation2: TColorAnimation;
    toolButton_colors: TCornerButton;
    btn_profile_edit_QA: TCornerButton;
    btn_profile_save_QA: TCornerButton;
    TabControl1: TTabControl;
    Posts_tab: TTabItem;
    label_profile_editerror: TLabel;
    Rectangle10: TRectangle;
    List_loginpage_tags: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    List_profile_edit_tags: TListBox;
    List_profile_QA_tags: TListBox;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ADOQuery_PF_Posts: TADOQuery;
    BindSourceDB_FP_Posts: TBindSourceDB;
    btn_profile_delete_QA: TCornerButton;
    RTE_profile_HTML: TTMSFNCRichEditorHTMLIO;
    label_profile_QA_errors: TLabel;
    RTE_profile: TTMSFNCRichEditor;
    RTE_profile_BUIC: TTMSFNCRichEditorFormatToolBar;
    Layout_profile_HideTitle: TLayout;
    ScrollArea_Questions: TVertScrollBox;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Line4: TLine;
    Q_Tags_ListBox: TListBox;
    Label16: TLabel;
    Q_AnswersCount_label: TLabel;
    Label3: TLabel;
    Q_Title_label: TLabel;
    Label21: TLabel;
    Q_VotesSum_label: TLabel;
    Label20: TLabel;
    Q_Views_label: TLabel;
    Q_PostCreationDate: TLabel;
    Q_UserImage: TImage;
    Q_UserName: TLabel;
    Q_Reputation: TLabel;
    Q_TopRect: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Label2: TLabel;
    Line3: TLine;
    Q_Filter: TCornerButton;
    Q_SumAllQuestions: TLabel;
    Questions_AskQ_btn: TCornerButton;
    Rectangle13: TRectangle;
    Q_ord_newest: TCornerButton;
    Line5: TLine;
    Rectangle14: TRectangle;
    Line10: TLine;
    Q_ApplyFilter: TCornerButton;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Q_Filter_Newest: TRadioButton;
    Q_Filter_Oldest: TRadioButton;
    Q_Filter_MostVotes: TRadioButton;
    Q_Filter_MostViewed: TRadioButton;
    Q_Filter_TagsList: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    Q_Filter_MyTags: TRadioButton;
    Q_Filter_TheseTags: TRadioButton;
    CornerButton8: TCornerButton;
    BindSourceDB4: TBindSourceDB;
    Q_ord_Oldest: TCornerButton;
    Line9: TLine;
    Q_ord_mostAnswered: TCornerButton;
    Line7: TLine;
    Q_ord_unanswered: TCornerButton;
    Line11: TLine;
    Q_ord_Views: TCornerButton;
    Line8: TLine;
    Q_ord_Votes: TCornerButton;
    ADOQuery_AllQuestions: TADOQuery;
    BindSourceDB_AllQuestions: TBindSourceDB;
    LinkPropertyToFieldReputation: TLinkPropertyToField;
    LinkPropertyToFieldDisplayName: TLinkPropertyToField;
    LinkPropertyToFieldProfileImage: TLinkPropertyToField;
    LinkPropertyToFieldAnswerCount: TLinkPropertyToField;
    LinkPropertyToFieldVotes: TLinkPropertyToField;
    LinkPropertyToFieldTitle: TLinkPropertyToField;
    LinkPropertyToFieldPostCreationDate: TLinkPropertyToField;
    LinkPropertyToFieldViewCount: TLinkPropertyToField;
    Q_Filter_NoAnswers: TRadioButton;
    Q_Filter_MostAnswers: TRadioButton;
    Q_Filter_NoTagslabel: TLabel;
    Q_ShowNext: TCornerButton;
    Line6: TLine;
    Q_ShowPrevious: TCornerButton;
    Q_Ctags_memo: TMemo;
    Q_TagsFilterError_label: TLabel;
    Grid_AllQuestions: TGrid;
    LinkGridToDataSourceBindSourceDB_AllQuestions: TLinkGridToDataSource;
    QAnswers_page: TTabItem;
    ScrollArea_QAswers: TVertScrollBox;
    RectangleMid: TRectangle;
    rectangleT: TRectangle;
    Line12: TLine;
    VQ_QTitle: TLabel;
    Line13: TLine;
    Line14: TLine;
    VQ_CreationDate: TLabel;
    VQ_ViewCount: TLabel;
    Rectangle15: TRectangle;
    RTE_Q: TTMSFNCRichEditor;
    VQ_upVote_Q: TCornerButton;
    VQ_DownVote_Q: TCornerButton;
    VQ_VoteCount_Q: TLabel;
    VQ_UserImage_Q: TImage;
    VQ_UserName_Q: TLabel;
    VQ_Reputation_Q: TLabel;
    VQ_CreationDate_Q: TLabel;
    LinkPropertyToFieldTitle2: TLinkPropertyToField;
    LinkPropertyToFieldPostCreationDate2: TLinkPropertyToField;
    LinkPropertyToFieldViewCount2: TLinkPropertyToField;
    LinkPropertyToFieldProfileImage2: TLinkPropertyToField;
    LinkPropertyToFieldPostCreationDate3: TLinkPropertyToField;
    LinkPropertyToFieldDisplayName2: TLinkPropertyToField;
    LinkPropertyToFieldReputation2: TLinkPropertyToField;
    Label24: TLabel;
    VQ_Tags: TListBox;
    RTE_Q_HTML: TTMSFNCRichEditorHTMLIO;
    VQ_AnswerCount: TLabel;
    LinkPropertyToFieldAnswerCount2: TLinkPropertyToField;
    Label35: TLabel;
    Rectangle16: TRectangle;
    VA_btn_Newest: TCornerButton;
    Line15: TLine;
    VA_btn_Oldest: TCornerButton;
    Line19: TLine;
    VA_btn_Votes: TCornerButton;
    VQ_UpVote_A: TCornerButton;
    VQ_DownVote_A: TCornerButton;
    A_VoteCount: TLabel;
    Rectangle17: TRectangle;
    RTE_A: TTMSFNCRichEditor;
    A_pfp: TImage;
    A_UserName: TLabel;
    A_Reputation: TLabel;
    A_CreatingDate: TLabel;
    RTE_A_HTML: TTMSFNCRichEditorHTMLIO;
    ADOQuery_QAnswers: TADOQuery;
    BindSourceDB2: TBindSourceDB;
    LinkPropertyToFieldVoteCount: TLinkPropertyToField;
    LinkPropertyToFieldVotes2: TLinkPropertyToField;
    LinkPropertyToFieldPostCreationDate4: TLinkPropertyToField;
    LinkPropertyToFieldDisplayName3: TLinkPropertyToField;
    LinkPropertyToFieldReputation3: TLinkPropertyToField;
    LinkPropertyToFieldProfileImage3: TLinkPropertyToField;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    CRecord: TLabel;
    VQ_AnswerPost_btn: TCornerButton;
    RectangleB: TRectangle;
    Label38: TLabel;
    rect_RTE_PostA: TRectangle;
    FlowLayout1: TFlowLayout;
    RTE_PostA_undo: TCornerButton;
    RTE_PostA_redo: TCornerButton;
    RTE_PostA_bold: TCornerButton;
    RTE_PostA_italic: TCornerButton;
    RTE_PostA_underline: TCornerButton;
    RTE_PostA_fsize: TComboBox;
    RTE_PostA_list: TCornerButton;
    RTE_PostA_lalign: TCornerButton;
    RTE_PostA_calign: TCornerButton;
    RTE_PostA_ralign: TCornerButton;
    RTE_PostA_image: TCornerButton;
    ColorAnimation3: TColorAnimation;
    ColorAnimation4: TColorAnimation;
    RTE_PostA_colors: TCornerButton;
    RTE_PostA: TTMSFNCRichEditor;
    RTE_PostA_BUIC: TTMSFNCRichEditorFormatToolBar;
    A_PostAnswer_btn: TCornerButton;
    VQ_PostAnswerError_label: TLabel;
    RTE_PostA_HTML: TTMSFNCRichEditorHTMLIO;
    LogOut_lbl: TLabel;
    rect_A: TRectangle;
    an_rect_A: TFloatAnimation;
    start_an: TRectangle;
    ani_direction_glyph: TGlyph;
    Grid_Answers: TGrid;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    AskQ_page: TTabItem;
    VertScrollBox_AskQ: TVertScrollBox;
    Rectangle19: TRectangle;
    Label41: TLabel;
    Rectangle18: TRectangle;
    AskQ_PostQ_btn: TCornerButton;
    AskQ_error_lbl: TLabel;
    AskQ_Tags: TListBox;
    ListBoxItem9: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    Rect_RTE_AskQ: TRectangle;
    FlowLayout2: TFlowLayout;
    RTE_AskQ_undo: TCornerButton;
    RTE_AskQ_redo: TCornerButton;
    RTE_AskQ_bold: TCornerButton;
    RTE_AskQ_italic: TCornerButton;
    RTE_AskQ_underline: TCornerButton;
    RTE_AskQ_fsize: TComboBox;
    RTE_AskQ_list: TCornerButton;
    RTE_AskQ_Lalign: TCornerButton;
    RTE_AskQ_Calign: TCornerButton;
    RTE_AskQ_Ralign: TCornerButton;
    RTE_AskQ_image: TCornerButton;
    RTE_AskQ_color: TCornerButton;
    RTE_AskQ: TTMSFNCRichEditor;
    RTE_AskQ_ToolBar: TTMSFNCRichEditorFormatToolBar;
    Label40: TLabel;
    AskQ_Title: TEdit;
    Label43: TLabel;
    ShadowEffect4: TShadowEffect;
    Label39: TLabel;
    Rectangle21: TRectangle;
    ShadowEffect5: TShadowEffect;
    Rectangle20: TRectangle;
    Label42: TLabel;
    AskQ_rect1: TRectangle;
    Label44: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Ask_Q_lbl1: TLabel;
    Label48: TLabel;
    AskQ_Glyph1: TGlyph;
    AskQ_rect2: TRectangle;
    Ask_Q_lbl2: TLabel;
    Label52: TLabel;
    AskQ_Glyph2: TGlyph;
    AskQ_rect3: TRectangle;
    Ask_Q_lbl3: TLabel;
    Label57: TLabel;
    AskQ_Glyph3: TGlyph;
    Text1: TText;
    Text2: TText;
    FloatAnimation2: TFloatAnimation;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    Label45: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    RTE_AskQ_HTML: TTMSFNCRichEditorHTMLIO;
    Image1: TImage;
    pf_visitPost: TCornerButton;
    btn_questions: TCornerButton;
    btn_users: TCornerButton;
    btn_about: TCornerButton;
    Rectangle22: TRectangle;
    pfp_edit_view: TImage;
    btn_changepfp: TCornerButton;
    LinkPropertyToFieldProfileImage4: TLinkPropertyToField;
    Image2: TImage;
    VertScrollBox_users: TVertScrollBox;
    User_AllUsers: TListView;
    PF_Posts: TListView;
    ADOQuery_PF_PostsTitle: TWideStringField;
    ADOQuery_PF_PostsVotes: TIntegerField;
    ADOQuery_PF_PostsTags: TWideMemoField;
    ADOQuery_PF_PostsPostId: TAutoIncField;
    ADOQuery_PF_PostsPostTypeId: TWordField;
    ADOQuery_PF_PostsParentId: TIntegerField;
    LinkListControlToField1: TLinkListControlToField;
    Rectangle23: TRectangle;
    Users_pfp: TImage;
    Users_displayName: TLabel;
    Glyph6: TGlyph;
    Users_CreationDate: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    User_Tags: TListBox;
    User_About: TMemo;
    Rectangle24: TRectangle;
    User_downVotes: TLabel;
    User_upVotes: TLabel;
    User_viewCount: TLabel;
    User_questions: TLabel;
    User_answers: TLabel;
    User_reputation: TLabel;
    Label51: TLabel;
    LV_User_Posts: TListView;
    Rectangle25: TRectangle;
    User_labelPosts: TLabel;
    Label55: TLabel;
    Line16: TLine;
    Line17: TLine;
    ADOQuery_Users: TADOQuery;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    ADOQuery_UserPosts: TADOQuery;
    BindSourceDB5: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    Users_VSP: TCornerButton;
    Users_Refresh: TCornerButton;
    Profile_Refresh: TCornerButton;
    AQ_Refresh: TCornerButton;
    Label1: TLabel;
    Label4: TLabel;
    Rect_FlagPost: TRectangle;
    flags_spam: TRadioButton;
    flags_rude_or_abusive: TRadioButton;
    flags_needs_improvement: TRadioButton;
    flags_duplicate: TRadioButton;
    Label56: TLabel;
    btn_CancelFlagPost: TCornerButton;
    btn_FlagPost: TCornerButton;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    flagPost_Q: TLabel;
    flagPost_A: TLabel;
    printPost_A: TLabel;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    RTE_A_PDF: TTMSFNCRichEditorPDFIO;
    prev_user_acc: TLabel;
    pf_Rank: TLabel;
    qr_obj: Tfrx2DBarCodeObject;
    VertScrollBox_about: TVertScrollBox;
    Rect_about: TRectangle;
    Label5: TLabel;
    Image3: TImage;
    Text3: TText;
    Line18: TLine;
    Text4: TText;
    Text5: TText;
    Image4: TImage;
    ShadowEffect6: TShadowEffect;
    Image5: TImage;
    Image6: TImage;
    Label62: TLabel;
    Label63: TLabel;
    Image7: TImage;
    Text6: TText;
    Text7: TText;
    Text8: TText;
    Image8: TImage;
    Line20: TLine;
    Image9: TImage;
    Image10: TImage;
    Text9: TText;
    Label65: TLabel;
    Text10: TText;
    Text11: TText;
    Label64: TLabel;
    Text12: TText;
    Text13: TText;
    Label66: TLabel;
    Label67: TLabel;
    Text14: TText;
    ShadowEffect7: TShadowEffect;
    ShadowEffect8: TShadowEffect;
    ShadowEffect9: TShadowEffect;
    ShadowEffect10: TShadowEffect;
    procedure btn_homeClick(Sender: TObject);
    procedure btn_questionsClick(Sender: TObject);
    procedure btn_usersClick(Sender: TObject);
    procedure btn_aboutClick(Sender: TObject);
    procedure btn_profileClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure loginpage_btn_loginClick(Sender: TObject);
    procedure loginpage_btn_signinClick(Sender: TObject);
    procedure btn_editprofileClick(Sender: TObject);
    procedure btn_changepfpClick(Sender: TObject);
    procedure toolButton_undoClick(Sender: TObject);
    procedure toolButton_redoClick(Sender: TObject);
    procedure toolButton_boldClick(Sender: TObject);
    procedure cbox_fsizeChange(Sender: TObject);
    procedure toolButton_italicClick(Sender: TObject);
    procedure toolButton_underlineClick(Sender: TObject);
    procedure toolButton_listClick(Sender: TObject);
    procedure toolButton_calignClick(Sender: TObject);
    procedure toolButton_lalignClick(Sender: TObject);
    procedure toolButton_ralignClick(Sender: TObject);
    procedure toolButton_imageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_profile_edit_cancelClick(Sender: TObject);
    procedure btn_profile_edit_saveClick(Sender: TObject);
    procedure btn_profile_edit_QAClick(Sender: TObject);
    procedure btn_profile_save_QAClick(Sender: TObject);
    procedure toolButton_colorsClick(Sender: TObject);
    procedure RTE_profileCaretChanged(Sender: TObject);
    procedure Q_FilterClick(Sender: TObject);
    procedure Q_ord_newestClick(Sender: TObject);
    procedure Q_ord_OldestClick(Sender: TObject);
    procedure Q_ord_mostAnsweredClick(Sender: TObject);
    procedure Q_ord_unansweredClick(Sender: TObject);
    procedure Q_ord_ViewsClick(Sender: TObject);
    procedure Q_ord_VotesClick(Sender: TObject);
    procedure Q_Filter_MyTagsChange(Sender: TObject);
    procedure Q_Filter_TheseTagsChange(Sender: TObject);
    procedure Q_Filter_NoTagslabelClick(Sender: TObject);
    procedure Q_ApplyFilterClick(Sender: TObject);
    procedure Q_ShowNextClick(Sender: TObject);
    procedure Q_ShowPreviousClick(Sender: TObject);
    procedure CornerButton8Click(Sender: TObject);
    procedure Q_Filter_TagsListChangeCheck(Sender: TObject);
    procedure Q_Ctags_orClick(Sender: TObject);
    procedure ADOQuery_AllQuestionsAfterScroll(DataSet: TDataSet);
    procedure edit_mainFilterKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure btn_profile_delete_QAClick(Sender: TObject);
    procedure VQ_upVote_QClick(Sender: TObject);
    procedure Q_Title_labelClick(Sender: TObject);
    procedure VA_btn_NewestClick(Sender: TObject);
    procedure VA_btn_OldestClick(Sender: TObject);
    procedure VA_btn_ViewsClick(Sender: TObject);
    procedure VA_btn_VotesClick(Sender: TObject);
    procedure VQ_DownVote_QClick(Sender: TObject);
    procedure VQ_UpVote_AClick(Sender: TObject);
    procedure VQ_DownVote_AClick(Sender: TObject);
    procedure ADOQuery_QAnswersAfterScroll(DataSet: TDataSet);
    procedure CornerButton2Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure VQ_AnswerPost_btnClick(Sender: TObject);
    procedure RTE_PostA_undoClick(Sender: TObject);
    procedure RTE_PostA_redoClick(Sender: TObject);
    procedure RTE_PostA_boldClick(Sender: TObject);
    procedure RTE_PostA_italicClick(Sender: TObject);
    procedure RTE_PostA_underlineClick(Sender: TObject);
    procedure RTE_PostA_fsizeChange(Sender: TObject);
    procedure RTE_PostACaretChanged(Sender: TObject);
    procedure RTE_PostA_listClick(Sender: TObject);
    procedure RTE_PostA_lalignClick(Sender: TObject);
    procedure RTE_PostA_calignClick(Sender: TObject);
    procedure RTE_PostA_ralignClick(Sender: TObject);
    procedure RTE_PostA_imageClick(Sender: TObject);
    procedure RTE_PostA_colorsClick(Sender: TObject);
    procedure A_PostAnswer_btnClick(Sender: TObject);
    procedure LogOut_lblClick(Sender: TObject);
    procedure start_anClick(Sender: TObject);
    procedure ADOQuery_PF_PostsAfterScroll(DataSet: TDataSet);
    procedure ADOQuery_GpqAfterScroll(DataSet: TDataSet);
    procedure RTE_AskQ_undoClick(Sender: TObject);
    procedure RTE_AskQ_redoClick(Sender: TObject);
    procedure RTE_AskQ_boldClick(Sender: TObject);
    procedure RTE_AskQ_italicClick(Sender: TObject);
    procedure RTE_AskQ_underlineClick(Sender: TObject);
    procedure RTE_AskQ_fsizeChange(Sender: TObject);
    procedure RTE_AskQCaretChanged(Sender: TObject);
    procedure RTE_AskQ_listClick(Sender: TObject);
    procedure RTE_AskQ_LalignClick(Sender: TObject);
    procedure RTE_AskQ_CalignClick(Sender: TObject);
    procedure RTE_AskQ_RalignClick(Sender: TObject);
    procedure RTE_AskQ_imageClick(Sender: TObject);
    procedure RTE_AskQ_colorClick(Sender: TObject);
    procedure Questions_AskQ_btnClick(Sender: TObject);
    procedure Ask_Q_lbl1Click(Sender: TObject);
    procedure Ask_Q_lbl2Click(Sender: TObject);
    procedure Ask_Q_lbl3Click(Sender: TObject);
    procedure AskQ_PostQ_btnClick(Sender: TObject);
    procedure pf_visitPostClick(Sender: TObject);
    procedure stackedWidgetChange(Sender: TObject);
    procedure PF_PostsUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure PF_PostsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ADOQuery_UsersAfterScroll(DataSet: TDataSet);
    procedure LV_User_PostsUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Users_VSPClick(Sender: TObject);
    procedure Users_RefreshClick(Sender: TObject);
    procedure Profile_RefreshClick(Sender: TObject);
    procedure AQ_RefreshClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure btn_CancelFlagPostClick(Sender: TObject);
    procedure flagPost_QClick(Sender: TObject);
    procedure flagPost_AClick(Sender: TObject);
    procedure btn_FlagPostClick(Sender: TObject);
    procedure Q_UserNameClick(Sender: TObject);
    procedure VQ_UserName_QClick(Sender: TObject);
    procedure A_UserNameClick(Sender: TObject);
    procedure printPost_AClick(Sender: TObject);
    procedure prev_user_accClick(Sender: TObject);

  private
    { Private declarations }
    procedure menuBtnsAction(Sender: TCornerButton=Nil);
    function getRandomImg: String;
    procedure load_data;
    procedure ExportPFP(BF: TBlobField);
    function getSelectedTags(ListObj: TListBox): String;
    procedure setTagsChecked(ListObj: TListBox; Tags: string);
    procedure setTags(ListObj: TListBox; Tags: string);
    procedure setReadOnlyState(Title: TEdit; Body: TTMSFNCRichEditor; BodyLayout: TFlowLayout; Tags: TListBox; State: Boolean);
    function getcwd: string;
    procedure loadGridQA;
    procedure fix_html;
    type
      Tmatrix_int = array of integer;
      TStringArray = array of string;
    procedure setColWidth(Grid_Array: array of TGrid; Cols_Width: array of Tmatrix_int);
    procedure RestartApp;
    procedure OrderByBtnsAction(Sender: TCornerButton);
    function OrderByAllQuestions(OrdCol: STRING; TagsFilter: STRING=''; strSearched: STRING=''): INTEGER;
    procedure resetForLogIn;
    function findall(pattern: string; str: string): TStringArray;
    function generateFilter(filter_string: string): string;
    procedure AnswerOrderByBtnsAction(Sender: TCornerButton);
    procedure OrderByAnswers(OrdCol: STRING = 'VoteCount DESC');
    function VisitUpdate(PostId, UpV, DownV: integer): integer;
    procedure setVotesColor_A;
    function GetVotes(PostId: integer): integer;
    procedure setUpPost_Page(PostId: integer);
    procedure flagPost(PostId: integer);
    procedure GoToUser(UserId: integer);
  public
    { Public declarations }
  end;
const
  sLineBreak = {$IFDEF LINUX} AnsiChar(#10) {$ENDIF}
               {$IFDEF MSWINDOWS} AnsiString(#13#10) {$ENDIF};

var
  Form1: TForm1;
  userId, PostId_pf, TotalQCount, QrowCount, PostId_A, ParentId_pf, PostId_flag: Integer;
  Q_Order: string='Posts.CreationDate ASC';
  Q_TagsFilter: STRING='';
  Q_lastSearched: STRING='';
  cwd: STRING='';
implementation

{$R *.fmx}

procedure TForm1.ADOQuery_AllQuestionsAfterScroll(DataSet: TDataSet);
begin
  if  ADOQuery_AllQuestions.FieldByName('Tags').IsNull then
    setTags(Q_Tags_ListBox, '')
  else
    setTags(Q_Tags_ListBox, ADOQuery_AllQuestions.FieldByName('Tags').Value);

end;

procedure TForm1.ADOQuery_PF_PostsAfterScroll(DataSet: TDataSet);
begin
RTE_profile.Font.SetSettings('Regular', 14, TFontStyleExt.Default);
end;

procedure TForm1.ADOQuery_GpqAfterScroll(DataSet: TDataSet);
begin
RTE_profile.Font.SetSettings('Regular', 14, TFontStyleExt.Default);
end;

procedure TForm1.ADOQuery_QAnswersAfterScroll(DataSet: TDataSet);
var BODY: TStream;
begin
  with ADOQuery_QAnswers do
    begin
      if FieldByName('BODY').IsNull then
        begin
          CRecord.Text := '0';
          RTE_A.Clear;
        end
      else
        begin
          BODY := CreateBlobStream(FieldByName('BODY'), bmRead);
          RTE_A_HTML.Load(BODY, TEncoding.UTF8);
          A_VoteCount.Text := GetVotes(FieldByName('PostId').Value).ToString;
          CRecord.Text := ADOQuery_QAnswers.RecNo.ToString;
        end;
    end;
  RTE_A.Font.SetSettings('Regular', 14, TFontStyleExt.Default);
  setVotesColor_A;
end;

procedure TForm1.ADOQuery_UsersAfterScroll(DataSet: TDataSet);
begin
  WITH ADOQuery_Users DO
    BEGIN
      User_labelPosts.Text := 'Posts by : '+FieldByName('DisplayName').AsString;
      Users_CreationDate.Text := 'Member since : '+formatdatetime('d-mmm-yyyy', FieldByName('CreationDate').Value);
      User_reputation.Text := 'Reputation : '+FieldByName('Reputation').AsString;
      User_answers.Text := 'Answers : '+FieldByName('Answers').AsString;
      User_questions.Text := 'Questions : '+FieldByName('Questions').AsString;
      User_viewCount.Text := 'Total views : '+FieldByName('ViewsCount').AsString;
      User_upVotes.Text := 'Total UpVotes : '+FieldByName('UpVotesCount').AsString;
      User_downVotes.Text := 'Total DownVotes : '+FieldByName('DownVotesCount').AsString;
      User_About.Text := FieldByName('AboutMe').AsString;
      setTags(User_Tags, FieldByName('Tags').AsString);
    END;
  WITH ADOQuery_UserPosts DO
    BEGIN
      Close;
      SQL.Clear;
      SQL.Add('EXEC GetUserPosts :@UserId');
      Parameters.ParamByName('@UserId').Value := ADOQuery_Users.FieldByName('UserId').Value;
      LV_User_Posts.BeginUpdate;
      Open;
      LV_User_Posts.EndUpdate;
    END;
end;

procedure TForm1.AnswerOrderByBtnsAction(Sender: TCornerButton);
begin
  VA_btn_Newest.IsPressed := False;
  VA_btn_Oldest.IsPressed := False;
  VA_btn_Votes.IsPressed := False;
  Sender.IsPressed := True;
end;

procedure TForm1.AQ_RefreshClick(Sender: TObject);
begin
  setUpPost_Page(ADOQuery_AllQuestions.FieldByName('PostId').Value);
end;

procedure TForm1.AskQ_PostQ_btnClick(Sender: TObject);
var result, BodyFileDir: String;
begin
  if OrderByAllQuestions('(SELECT NULL)', '', generateFilter(AskQ_Title.Text.Trim)) > 5 then
    begin
    // duplicate question
      ShowMessage('Your question was already asked by the community !'+sLineBreak+'Click OK to see the answers');
      stackedWidget.TabIndex := 0;
      menuBtnsAction(btn_questions);
      Exit
    end;
  if RTE_AskQ.Text.Trim.Length < 30 then
    BodyFileDir := ''
  else
    begin
      RTE_AskQ_HTML.Save(cwd + '\doc\out.html', TEncoding.UTF8);
      fix_html;
      BodyFileDir := cwd + '\doc\out.html';
    end;
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC InsertPostData :@UserId,'+
                                    '1,'+
                                    '-1,'+
                                    ':@Title,'+
                                    ':@BodyFileDir,'+
                                    ':@Tags');

      Parameters.ParamByName('@UserId').Value := userId;
      if AskQ_Title.Text.Trim.Length < 15 then
        Parameters.ParamByName('@Title').Value:= ''
      else
        Parameters.ParamByName('@Title').Value:=  AskQ_Title.Text;
      Parameters.ParamByName('@BodyFileDir').Value:= BodyFileDir;
      Parameters.ParamByName('@Tags').Value:= getSelectedTags(AskQ_Tags);
      Open;
      result := Fields[0].AsString;
    end;
  if result = '1' then
    begin
      AskQ_error_lbl.Text := '';
      AskQ_Title.StyleLookup := 'edit_style';
      Rect_RTE_AskQ.Stroke.Color := TAlphaColor($FF21252B);
      RTE_AskQ.Clear;
      Q_ord_newestClick(Q_ord_newest);
      setUpPost_Page(ADOQuery_AllQuestions.FieldByName('PostId').Value);
    end
  else
  if result = 'Must Fill Title' then
    begin
      AskQ_error_lbl.Text := 'Title must be at least 15 characters.';
      AskQ_Title.StyleLookup := 'editError_style';
      Rect_RTE_AskQ.Stroke.Color := TAlphaColor($FF21252B);
    end else
  if result = 'Must Fill Body' then
    begin
      AskQ_error_lbl.Text := 'Body must be at least 30 characters.';
      AskQ_Title.StyleLookup := 'edit_style';
      Rect_RTE_AskQ.Stroke.Color := TAlphaColor($FFFF0051);
    end else showmessage(result);
end;

procedure TForm1.Ask_Q_lbl1Click(Sender: TObject);
begin
  if AskQ_Glyph1.ImageIndex = 27 then
    begin
    AskQ_Glyph1.ImageIndex := 28;
    FloatAnimation4.StartValue := 30;
    FloatAnimation4.StopValue := 150;
    FloatAnimation4.Start;
    end
  else
    begin
      AskQ_Glyph1.ImageIndex := 27;
      FloatAnimation4.StartValue := 150;
      FloatAnimation4.StopValue := 30;
      FloatAnimation4.Start;
    end;
end;

procedure TForm1.Ask_Q_lbl2Click(Sender: TObject);
begin
  if AskQ_Glyph2.ImageIndex = 27 then
    begin
    AskQ_Glyph2.ImageIndex := 28;
    FloatAnimation3.StartValue := 30;
    FloatAnimation3.StopValue := 127;
    FloatAnimation3.Start;
    end
  else
    begin
      AskQ_Glyph2.ImageIndex := 27;
      FloatAnimation3.StartValue := 127;
      FloatAnimation3.StopValue := 30;
      FloatAnimation3.Start;
    end;
end;

procedure TForm1.Ask_Q_lbl3Click(Sender: TObject);
begin
  if AskQ_Glyph3.ImageIndex = 27 then
    begin
    AskQ_Glyph3.ImageIndex := 28;
    FloatAnimation2.StartValue := 30;
    FloatAnimation2.StopValue := 127;
    FloatAnimation2.Start;
    end
  else
    begin
      AskQ_Glyph3.ImageIndex := 27;
      FloatAnimation2.StartValue := 127;
      FloatAnimation2.StopValue := 30;
      FloatAnimation2.Start;
    end;
end;

procedure TForm1.A_PostAnswer_btnClick(Sender: TObject);
var result, BodyFileDir: String;
begin
if userId = 0 then
  stackedWidget.TabIndex := 4
else
  begin
    RTE_PostA_HTML.Save(cwd + '\doc\out.html', TEncoding.UTF8);
    fix_html;
    if RTE_PostA.Text.Trim.Length < 30 then
      BodyFileDir := ''
    else
      BodyFileDir := cwd + '\doc\out.html';
  //////
    with ADOQuery_PROC do
      begin
        CleanupInstance;
        close;
        SQL.Clear;
        SQL.Add('EXEC InsertPostData :@UserId,'+
                                      '2,'+
                                      ':@ParentId,'+
                                      ''''','+
                                      ':@BodyFileDir,'+
                                      '''''');

        Parameters.ParamByName('@UserId').Value := userId;
        Parameters.ParamByName('@ParentId').Value:= ADOQuery_AllQuestions.FieldByName('PostId').Value;
        Parameters.ParamByName('@BodyFileDir').Value:= BodyFileDir;
        Open;
        result := Fields[0].AsString;
      end;
    if result = '1' then
      begin
        VQ_PostAnswerError_label.Text := '';
        rect_RTE_PostA.Stroke.Color := TAlphaColor($FF21252B);
        ADOQuery_QAnswers.Requery;
        RTE_PostA.Clear;
        ADOQuery_AllQuestions.Refresh;
      end
    else
    if result = 'Must Fill Body' then
      begin
        VQ_PostAnswerError_label.Text := 'Body must be at least 30 characters.';
        rect_RTE_PostA.Stroke.Color := TAlphaColor($FFFF0051);
      end else showmessage(result);
  end;
end;

procedure TForm1.A_UserNameClick(Sender: TObject);
begin
if not ADOQuery_QAnswers.FieldByName('UserId').IsNull then
  GoToUser(ADOQuery_QAnswers.FieldByName('UserId').AsInteger);
end;

procedure TForm1.btn_aboutClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 2;
  menuBtnsAction(Sender as TCornerButton);
end;

procedure TForm1.btn_homeClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 0;
  menuBtnsAction(Sender as TCornerButton);
end;

procedure TForm1.btn_loginClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 4;
end;

procedure TForm1.btn_profileClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 3;
end;

procedure TForm1.btn_profile_delete_QAClick(Sender: TObject);
begin
  if PostId_pf = 0 then
  else
    if MessageDlg('Delete Current Post ?', TMsgDlgType.mtCOnfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
      with ADOQuery_PROC do
        begin
          Close;
          SQL.Clear;
          SQL.Add('EXEC DeletePost :@PostId');
          Parameters.ParamByName('@PostId').Value :=  PostId_pf;
          Open;
          if Fields[0].Value = 1 then
            begin
              PostId_pf := 0;
              profile_QA_title.Text := '';
              RTE_profile.Clear;
              setTagsChecked(List_profile_QA_tags, '');
              List_profile_QA_tags.Enabled := False;
              setReadOnlyState(profile_QA_title, RTE_profile, FlowLayout_RTE_profile, List_profile_QA_tags, False);
              loadGridQA;
              setReadOnlyState(profile_QA_title, RTE_profile, FlowLayout_RTE_profile, List_profile_QA_tags, True);
              btn_profile_save_QA.Enabled := False;
            end else ShowMessage(Fields[0].Value);
        end else
end;

procedure TForm1.btn_profile_edit_cancelClick(Sender: TObject);
begin
frame_profile_edit.Visible := False;
end;

procedure TForm1.btn_profile_edit_QAClick(Sender: TObject);
begin
  if PostId_pf = 0 then
  else
    begin
      setReadOnlyState(profile_QA_title, RTE_profile, FlowLayout_RTE_profile, List_profile_QA_tags, False);
      btn_profile_save_QA.Enabled := True;
    end;
end;

procedure TForm1.btn_profile_edit_saveClick(Sender: TObject);
var result: String;
begin
  if edit_profile_password.Text = edit_profile_Cpassword.Text then
    begin
      with ADOQuery_PROC do
        begin
          close;
          SQL.Clear;
          SQL.Add('EXEC UpdateUserData :@UserId,'+
                                        ' :@DisplayName,'+
                                        ' :@Password,'+
                                        ' :@AboutMe,'+
                                        ' :@Tags,'+
                                        ' :@ProfileImageUrl');

          Parameters.ParamByName('@UserId').Value := userId;
          Parameters.ParamByName('@DisplayName').Value := edit_profile_displayName.Text;
          Parameters.ParamByName('@Password').Value := edit_profile_password.Text;
          Parameters.ParamByName('@AboutMe').Value := plainTextEdit_profile_edit_about.Text;
          Parameters.ParamByName('@Tags').Value := getSelectedTags(List_profile_edit_tags);
          Parameters.ParamByName('@ProfileImageUrl').Value := cwd + '\img\pfp\profile_img.png';;
          Open;
          result := Fields[0].AsString;
        end;
        if result = '1' then
          begin
            label_profile_editerror.Text := '';
            edit_profile_displayName.StyleLookup := 'edit_style';
            edit_profile_password.StyleLookup := 'edit_style';
            edit_profile_Cpassword.StyleLookup := 'edit_style';
            frame_profile_edit.Visible := False;
            load_data;
          end
        else
        if result = 'Enter your displayName' then
          begin
            label_profile_editerror.Text := result;
            edit_profile_Cpassword.StyleLookup := 'edit_style';
            edit_profile_password.StyleLookup := 'edit_style';
            edit_profile_displayName.StyleLookup := 'editError_style';
          end
        else
        if ContainsText(result, 'Unique_DisplayName') then
          begin
            label_profile_editerror.Text := 'DisplayName already exist';
            edit_profile_Cpassword.StyleLookup := 'edit_style';
            edit_profile_password.StyleLookup := 'edit_style';
            edit_profile_displayName.StyleLookup := 'editError_style';
          end
        else
        if result = 'DisplayName does not match regex format' then
          begin
            label_profile_editerror.Text := 'displayName does not match the format'+sLineBreak+' try [a-zA-Z0-9]';
            edit_profile_password.StyleLookup := 'edit_style';
            edit_profile_Cpassword.StyleLookup := 'edit_style';
            edit_profile_displayName.StyleLookup := 'editError_style';
          end
        else
        if result = 'Password does not match regex format' then
          begin
            label_profile_editerror.Text := 'password does not match the format'+sLineBreak+' try [a-zA-Z0-9] > 8';
            edit_profile_password.StyleLookup := 'editError_style';
            edit_profile_Cpassword.StyleLookup := 'edit_style';
            edit_profile_displayName.StyleLookup := 'edit_style';
          end
        else showmessage(result);
    end
    else
      begin
        label_profile_editerror.Text := 'Password Mismatch';
        edit_profile_password.StyleLookup := 'editError_style';
        edit_profile_Cpassword.StyleLookup := 'editError_style';
        edit_profile_displayName.StyleLookup := 'edit_style';
      end;
end;

procedure TForm1.btn_profile_save_QAClick(Sender: TObject);
var result, BodyFileDir: String;
begin
  RTE_profile_HTML.Save(cwd + '\doc\out.html', TEncoding.UTF8);
// just a fix for wrrong encoding type utf-8 WITH BOM to utf-8 WITHOUT BOM
// and a bug when text colors get reversed for some reason
  fix_html;
  if RTE_profile.Text.Trim.Length < 30 then
    BodyFileDir := ''
  else
    BodyFileDir := cwd + '\doc\out.html';
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC UpdatePostData :@PostId,'+
                                    ' :@Title,'+
                                    ' :@BodyFileDir,'+
                                    ' :@Tags');

      Parameters.ParamByName('@PostId').Value := PostId_pf;
      if profile_QA_title.Text.Trim.Length < 15 then
        Parameters.ParamByName('@Title').Value:=  ''
      else
        Parameters.ParamByName('@Title').Value:=  profile_QA_title.Text;
      Parameters.ParamByName('@BodyFileDir').Value:= BodyFileDir;
      Parameters.ParamByName('@Tags').Value:= getSelectedTags(List_profile_QA_tags);
      Open;
      result := Fields[0].AsString;
    end;
  if result = '1' then
    begin
      label_profile_QA_errors.Text := '';
      profile_QA_title.StyleLookup := 'edit_style';
      Rect_RTE_profile.Stroke.Color := TAlphaColor($FF21252B);
      PF_Posts.BeginUpdate;
      ADOQuery_PF_Posts.Requery;
      PF_Posts.EndUpdate;
      PF_Posts.ItemIndex := -1;
      setReadOnlyState(profile_QA_title, RTE_profile, FlowLayout_RTE_profile, List_profile_QA_tags, True);
      btn_profile_save_QA.Enabled := False;
    end
  else
  if result = 'Must Fill Title' then
    begin
      label_profile_QA_errors.Text := 'Title must be at least 15 characters.';
      profile_QA_title.StyleLookup := 'editError_style';
      Rect_RTE_profile.Stroke.Color := TAlphaColor($FF21252B);
    end else
  if result = 'Must Fill Body' then
    begin
      label_profile_QA_errors.Text := 'Body must be at least 15 characters.';
      profile_QA_title.StyleLookup := 'edit_style';
      Rect_RTE_profile.Stroke.Color := TAlphaColor($FFFF0051);
    end else showmessage(result);
end;

procedure TForm1.btn_questionsClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 0;
  menuBtnsAction(Sender as TCornerButton);
  ADOQuery_AllQuestions.Requery;
end;

procedure TForm1.btn_usersClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 1;
  menuBtnsAction(Sender as TCornerButton);
end;

procedure TForm1.cbox_fsizeChange(Sender: TObject);
begin
RTE_profile.SetSelectionFontSize(cbox_fsize.Selected.Text.ToInteger);
end;

procedure TForm1.loginpage_btn_signinClick(Sender: TObject);
var result: String;
begin
  if lineEdit_loginpage_signin_password.Text = lineEdit_loginpage_signin_reenterpassword.Text then
    begin
      with ADOQuery_PROC do
        begin
          close;
          SQL.Clear;
          SQL.Add('EXEC InsertUserData :@DisplayName,'+
                                        ' :@Password,'+
                                        ' :@Tags,'+
                                        ' :@ProfileImageUrl');

          Parameters.ParamByName('@DisplayName').Value:=  lineEdit_loginpage_signin_displayname.Text.Trim;
          Parameters.ParamByName('@Password').Value:=  lineEdit_loginpage_signin_password.Text;
          Parameters.ParamByName('@Tags').Value:= getSelectedTags(List_loginpage_tags);
          Parameters.ParamByName('@ProfileImageUrl').Value:= getRandomImg;
          Open;
          result := Fields[0].AsString;

          if result = '1' then
            begin
              loginpage_label_signinerror.Text := '';
              lineEdit_loginpage_signin_password.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_reenterpassword.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_displayname.StyleLookup := 'edit_style';
              userId := Fields[1].AsInteger;
              load_data;
              loadGridQA;
            end
          else
          if result = 'Enter your displayName' then
            begin
              loginpage_label_signinerror.Text := result;
              lineEdit_loginpage_signin_password.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_reenterpassword.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_displayname.StyleLookup := 'editError_style';
            end
          else
          if ContainsText(result, 'Unique_DisplayName') then
            begin
              loginpage_label_signinerror.Text := 'DisplayName already exist';
              lineEdit_loginpage_signin_password.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_reenterpassword.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_displayname.StyleLookup := 'editError_style';
            end
          else
          if result = 'DisplayName does not match regex format' then
            begin
              loginpage_label_signinerror.Text := 'displayName does not match the format'+sLineBreak+' try [a-zA-Z0-9]';
              lineEdit_loginpage_signin_password.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_reenterpassword.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_displayname.StyleLookup := 'editError_style';
            end
          else
          if result = 'Password does not match regex format' then
            begin
              loginpage_label_signinerror.Text := 'password does not match the format'+sLineBreak+' try [a-zA-Z0-9] > 8';
              lineEdit_loginpage_signin_password.StyleLookup := 'editError_style';
              lineEdit_loginpage_signin_reenterpassword.StyleLookup := 'edit_style';
              lineEdit_loginpage_signin_displayname.StyleLookup := 'edit_style';
            end
          else showmessage(result);
        end;
    end
    else
      begin
        loginpage_label_signinerror.Text := 'Password Mismatch';
        lineEdit_loginpage_signin_password.StyleLookup := 'editError_style';
        lineEdit_loginpage_signin_reenterpassword.StyleLookup := 'editError_style';
        lineEdit_loginpage_signin_displayname.StyleLookup := 'edit_style';
      end;
end;

procedure TForm1.LogOut_lblClick(Sender: TObject);
begin
if MessageDlg('Are you sure you want to logout ?', TMsgDlgType.mtCOnfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  resetForLogIn;
end;

procedure TForm1.LV_User_PostsUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
  Size: TSizeF;
begin
  if ADOQuery_UserPosts.Active = True then
    begin
      Size := TSizeF.Create(22, 22);
      LV_User_Posts.BeginUpdate;
      if AItem.ImageIndex = 1 then
        AItem.Bitmap := ImageList.Bitmap(Size, 31);
      if AItem.ImageIndex = 2 then
        AItem.Bitmap := ImageList.Bitmap(Size, 32);
      LV_User_Posts.EndUpdate;
    end;
end;

procedure TForm1.btn_editprofileClick(Sender: TObject);
begin
  edit_profile_password.Text := '';
  edit_profile_Cpassword.Text := '';
  // load user data
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC GetUserInfo :@UserId');
      Parameters.ParamByName('@UserId').Value := userId;
      Open;
//    load objects
      edit_profile_displayName.Text := FieldByName('DisplayName').Value;
      plainTextEdit_profile_edit_about.Text := FieldByName('AboutMe').Value;
      if FieldByName('Tags').IsNull then
        setTagsChecked(List_profile_edit_tags, '')
      else
        setTagsChecked(List_profile_edit_tags, FieldByName('Tags').Value);
      ExportPFP(TBlobField(FieldByName('ProfileImage')));
      pfp_edit_view.Bitmap.LoadFromFile(cwd +'\img\pfp\profile_img.png');
    end;
    frame_profile_edit.Visible := True;
end;

procedure TForm1.btn_FlagPostClick(Sender: TObject);
begin
  flagPost(PostId_flag);
end;

procedure TForm1.CornerButton1Click(Sender: TObject);
begin
  ADOQuery_QAnswers.Next;
  RTE_A.Font.SetSettings('Regular', 14, TFontStyleExt.Default);
end;

procedure TForm1.CornerButton2Click(Sender: TObject);
begin
  ADOQuery_QAnswers.Prior;
  RTE_A.Font.SetSettings('Regular', 14, TFontStyleExt.Default);
end;

procedure TForm1.btn_CancelFlagPostClick(Sender: TObject);
begin
  Rect_FlagPost.Visible := False;
end;

procedure TForm1.Users_RefreshClick(Sender: TObject);
begin
  User_AllUsers.BeginUpdate;
  ADOQuery_Users.Requery;
  User_AllUsers.EndUpdate;
end;

procedure TForm1.btn_changepfpClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Image Files(*.PNG;*.JPG;)| *.PNG;*.JPG;';
  OpenDialog.Execute;
  if ContainsText(OpenDialog.FileName, '.png') or ContainsText(OpenDialog.FileName, '.jpg') then
    begin
      TFile.Copy(OpenDialog.FileName, cwd +'\img\pfp\profile_img.png', True);
      pfp_edit_view.Bitmap.LoadFromFile(cwd +'\img\pfp\profile_img.png');
    end;
end;

procedure TForm1.Questions_AskQ_btnClick(Sender: TObject);
begin
if userId = 0 then
  stackedWidget.TabIndex := 4
else
  begin
    stackedWidget.TabIndex := 6;
    RTE_AskQ.Clear;
    AskQ_Title.Text := '';
    AskQ_error_lbl.Text := '';
    setTagsChecked(AskQ_Tags, '');
    AskQ_Title.StyleLookup := 'edit_style';
    Rect_RTE_AskQ.Stroke.Color := TAlphaColor($FF21252B);
  end;
end;

procedure TForm1.Q_ApplyFilterClick(Sender: TObject);
var theOrder :STRING;
begin
  theOrder := '';
  if Q_Filter_NoAnswers.IsChecked then
    theOrder := theOrder+ 'Posts.AnswerCount ASC,'
  else if Q_Filter_MostAnswers.IsChecked then
    theOrder := theOrder+ 'Posts.AnswerCount DESC,';
  if Q_Filter_Newest.IsChecked then
    theOrder := theOrder+ 'Posts.CreationDate DESC,'
  else if Q_Filter_Oldest.IsChecked then
    theOrder := theOrder+ 'Posts.CreationDate ASC,'
  else if Q_Filter_MostVotes.IsChecked then
    theOrder := theOrder+ 'Votes DESC,'
  else if Q_Filter_MostViewed.IsChecked then
    theOrder := theOrder+ 'Posts.ViewCount DESC,';

  theOrder := theOrder.TrimRight([',']);
  if Q_Ctags_memo.Lines[0] = 'Choose your tags' then
    Q_TagsFilter := ''
  else
    Q_TagsFilter := Q_Ctags_memo.Lines.Text;
  Q_Order := theOrder;
  OrderByAllQuestions(Q_Order, Q_TagsFilter, Q_lastSearched);
end;

procedure TForm1.CornerButton8Click(Sender: TObject);
begin
  Q_Filter.IsPressed := False;
  FloatAnimation1.StartValue := 480;
  FloatAnimation1.StopValue := 120;
  FloatAnimation1.Start;
end;
procedure TForm1.edit_mainFilterKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var str: string;
begin
str := edit_mainFilter.Text.Trim;
  case Key of
    VK_RETURN:
      begin
        if str > '' then
          begin
            OrderByAllQuestions('(SELECT NULL)', '', generateFilter(str));
            stackedWidget.TabIndex := 0;
            menuBtnsAction(btn_questions);
          end;
        KeyChar := #0;
      end;
  end;
end;

procedure TForm1.ExportPFP(BF: TBlobField);
var pfpLoc: string;
begin
  pfpLoc := cwd + '\img\pfp\profile_img.png';
  try
    System.SysUtils.DeleteFile(pfpLoc); // delete old pic
    BF.SaveToFile(pfpLoc); // save new pic
  except
      raise;
  end;
end;

function TForm1.findall(pattern, str: string): TStringArray;
var i: integer; py_list: Variant;
begin
  with PythonEngine do
    begin
      ExecString('import re');
      ExecString('full_string = r"""'+str+'"""');
      ExecString('py_result.value = re.findall(pattern=r"'+pattern+'", string=full_string)');
    end;
    py_list := PythonDelphiVar.Value;
    for i := VarArrayLowBound(py_list,1) to VarArrayHighBound(py_list,1) do
      result := result + [VarToStr(py_list[i])];
end;

procedure TForm1.fix_html;
var body_file: string;
begin
  body_file := cwd + '\doc\out.html';
  with PythonEngine do
      begin
        ExecString('import re');
        ExecString('body_file = r'+ QuotedStr(body_file));
        ExecString('with open(body_file, encoding="utf-8-sig") as body: doc = body.read()');
        ExecString('doc = re.sub(pattern=r"#(\w{6})+", repl=lambda s: "#" + s.group(1)[::-1], string=doc)');
        ExecString('with open(body_file, encoding="utf-8", mode="w") as body:  body.write(doc)');
      end;
end;

procedure TForm1.flagPost(PostId: integer);
var flagType: string;
begin
  if flags_spam.IsChecked then flagType := 'spam'
  else if flags_rude_or_abusive.IsChecked then flagType := 'rude or abusive'
  else if flags_needs_improvement.IsChecked then flagType := 'needs improvement'
  else if flags_duplicate.IsChecked then flagType := 'duplicate';
  with ADOQuery_PROC do
    begin
      Close;
      SQL.Clear;
      sql.Add('EXEC FlagPost :@UserId, :@PostId, :@FlagType');
      Parameters.ParamByName('@UserId').Value := userId;
      Parameters.ParamByName('@PostId').Value := PostId;
      Parameters.ParamByName('@FlagType').Value := flagType;
      Open;
      Rect_FlagPost.Visible := False;
      if Fields[0].Value = '1' then
        begin
          ShowMessage('Thanks for the flag, we will take your report seriously.');
        end
      else
        ShowMessage('You have already flaged this post!');

    end;
end;

procedure TForm1.flagPost_AClick(Sender: TObject);
begin
  if userId = 0 then
    stackedWidget.TabIndex := 4
  else
  begin
    if ADOQuery_QAnswers.FieldByName('PostId').IsNull then
    else
    begin
      Rect_FlagPost.Visible := True;
      PostId_flag := ADOQuery_QAnswers.FieldByName('PostId').AsInteger;
    end;
  end;
end;

procedure TForm1.flagPost_QClick(Sender: TObject);
begin
  if userId = 0 then
    stackedWidget.TabIndex := 4
  else
  begin
    Rect_FlagPost.Visible := True;
    PostId_flag := ADOQuery_AllQuestions.FieldByName('PostId').AsInteger;
  end;
end;

procedure TForm1.toolButton_ralignClick(Sender: TObject);
begin
RTE_profile.SetSelectionAttribute(TAlignment.taRightJustify);
end;

procedure TForm1.toolButton_redoClick(Sender: TObject);
begin
  RTE_profile.Redo;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
/// ---> cwd
  cwd := getcwd;
//LOAD Questions
  with ADOQuery_AllQuestions do
    begin
      Close;
      SQL.Clear;
      SQL.Add('EXEC showAllQuestions');
      Prepared := True;
      Open;
      ADOQuery_AllQuestionsAfterScroll(self.ADOQuery_AllQuestions);
      setColWidth([Grid_AllQuestions], [Tmatrix_int.create(1115)]);
      stackedWidget.TabIndex := 0;
      menuBtnsAction(btn_questions);
      OrderByBtnsAction(Q_ord_newest);
    end;
   with ADOQuery_Users do
    begin
      Close;
      SQL.Clear;
      SQL.Add('EXEC GetUserInfo');
      Prepared := True;
      User_AllUsers.BeginUpdate;
      Open;
      User_AllUsers.EndUpdate;
    end;
// load tags
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC GetTags');
      Open;
      setTags(List_loginpage_tags, VarToStr(FieldByName('Tags').value));
      setTags(List_profile_edit_tags, VarToStr(FieldByName('Tags').value));
      setTags(List_profile_QA_tags, VarToStr(FieldByName('Tags').value));
      setTags(Q_Filter_TagsList, VarToStr(FieldByName('Tags').value));
      setTags(AskQ_Tags, VarToStr(FieldByName('Tags').value));
    end;
    with ADOQuery_PROC do
      begin
        close;
        SQL.Clear;
        SQL.Add('EXEC QCount');
        Open;
        TotalQCount := FieldByName('QCount').Value;
        Q_SumAllQuestions.Text := vartostr(FieldByName('QCount').Value) + ' Questions';
      end;
// fix scrollbar style in RTE
  RTE_profile.VerticalScrollBar.StyleLookup := 'VScrollBarstyle';
  RTE_profile.HorizontalScrollBar.StyleLookup := 'HScrollBarstyle';

  RTE_Q.VerticalScrollBar.StyleLookup := 'VScrollBarstyle';
  RTE_Q.HorizontalScrollBar.StyleLookup := 'HScrollBarstyle';

  RTE_A.VerticalScrollBar.StyleLookup := 'VScrollBarstyle';
  RTE_A.HorizontalScrollBar.StyleLookup := 'HScrollBarstyle';

  RTE_PostA.VerticalScrollBar.StyleLookup := 'VScrollBarstyle';
  RTE_PostA.HorizontalScrollBar.StyleLookup := 'HScrollBarstyle';

  RTE_AskQ.VerticalScrollBar.StyleLookup := 'VScrollBarstyle';
  RTE_AskQ.HorizontalScrollBar.StyleLookup := 'HScrollBarstyle';
end;

function TForm1.getRandomImg: String;
begin
  with PythonEngine do
      begin
        ExecString('import os, random');
        ExecString('path = r"'+cwd+'"');
        ExecString('py_result.Value = path + ''\img\dp_img\\'' + random.choice(os.listdir(path + ''/img/dp_img''))');
      end;
  Result := PythonDelphiVar.ValueAsString
end;


function TForm1.getSelectedTags(ListObj: TListBox): String;
var I :Integer; SelectedTags: String;
begin
  SelectedTags := '';
  for I := 0 to ListObj.Count -1 do
    if ListObj.ListItems[I].IsChecked then
      SelectedTags := SelectedTags + ListObj.Items.Strings[I] + ',';
  SelectedTags := SelectedTags.TrimRight([',']);
  Result := SelectedTags
end;

function TForm1.GetVotes(PostId: integer): integer;
begin
  with ADOQuery_PROC do
    begin
      Close;
      SQL.Clear;
      SQL.Add('GetVotes :@PostId');
      Parameters.ParamByName('@PostId').Value := PostId;
      Open;
      Result := Fields[0].Value;
    end;
end;

procedure TForm1.GoToUser(UserId: integer);
begin
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC GetUserInfo :@UserId');
      Parameters.ParamByName('@UserId').Value := userId;
      Open;
      Users_pfp.Bitmap.LoadFromStream(CreateBlobStream(FieldByName('ProfileImage'), bmRead));
      Users_displayName.Text := FieldByName('DisplayName').AsString;
      User_labelPosts.Text := 'Posts by : '+FieldByName('DisplayName').AsString;
      Users_CreationDate.Text := 'Member since : '+formatdatetime('d-mmm-yyyy', FieldByName('CreationDate').Value);
      User_reputation.Text := 'Reputation : '+FieldByName('Reputation').AsString;
      User_answers.Text := 'Answers : '+FieldByName('Answers').AsString;
      User_questions.Text := 'Questions : '+FieldByName('Questions').AsString;
      User_viewCount.Text := 'Total views : '+FieldByName('ViewsCount').AsString;
      User_upVotes.Text := 'Total UpVotes : '+FieldByName('UpVotesCount').AsString;
      User_downVotes.Text := 'Total DownVotes : '+FieldByName('DownVotesCount').AsString;
      User_About.Text := FieldByName('AboutMe').AsString;
      setTags(User_Tags, FieldByName('Tags').AsString);
    end;
  WITH ADOQuery_UserPosts DO
    BEGIN
      Close;
      SQL.Clear;
      SQL.Add('EXEC GetUserPosts :@UserId');
      Parameters.ParamByName('@UserId').Value := UserId;
      LV_User_Posts.BeginUpdate;
      Open;
      LV_User_Posts.EndUpdate;
    END;
  stackedWidget.TabIndex := 1;
  menuBtnsAction(btn_users);
  VertScrollBox_users.ScrollBy(0, -1100);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
if MessageDlg('Are you sure you want to delete you account ?', TMsgDlgType.mtCOnfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC DeleteUser :@UserId');
      Parameters.ParamByName('@UserId').Value := userId;
      ExecSQL;
      resetForLogIn;
    end;
end;

function TForm1.generateFilter(filter_string: string): string;
begin
  with PythonEngine do
    begin
      ExecString('import re');
      ExecString('filter_string = r"""'+filter_string+'"""');
      ExecString('filter_list = re.findall(pattern=r"(\w+)", string=filter_string)');
      ExecString('filter_string = '',''.join(filter_list)');
      ExecString('if len(filter_list) == 1: py_result.Value = re.sub(pattern=r"(\w+)", repl=r''"\1*"'', string=filter_string)'+sLineBreak+
      'else: py_result.Value = "NEAR((" + re.sub(pattern=r"(\w+)", repl=r''"\1*"'', string=filter_string) + f"), {len(filter_list)}, True)"');
    end;
    result := PythonDelphiVar.Value;
end;

function TForm1.getcwd: string;
begin
  with PythonEngine do
    begin
      ExecString('import os');
      ExecString('py_result.Value = os.getcwd()');
    end;
  Result := PythonDelphiVar.ValueAsString;
end;

procedure TForm1.loadGridQA;
begin
  try
    BEGIN
      with ADOQuery_PF_Posts do
        begin
          SQL.Clear;
          SQL.Add('EXEC GetUserPosts :@UserId');
          Parameters.ParamByName('@UserId').Value :=  userId;
          Prepared := True;
          PF_Posts.BeginUpdate;
          Open;
          PF_Posts.EndUpdate;
          PF_Posts.ItemIndex := -1;
        end;
    END;
  Except
    on E: Exception do
      begin
        ShowMessage('error in def: loadGridQA --> '+ E.Message);
        RestartApp;
      end;
  end;
end;


procedure TForm1.load_data;
var pfp_img: TStream;
begin
// load user data
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC GetUserInfo :@UserId');
      Parameters.ParamByName('@UserId').Value:=  userId;
      Open;
      // load objects
      label_profile_displayName.Text := FieldByName('DisplayName').AsString;
      label_profile_CreationDate.Text := 'Member since : '+formatdatetime('d-mmm-yyyy', FieldByName('CreationDate').Value);
      plainTextEdit_profile_about.Text := FieldByName('AboutMe').AsString;
      label_profile_viewsCount.Text := 'Views Count : '+FieldByName('ViewsCount').AsString;
      label_profile_totalUpvotes.Text := 'Total UpVotes : '+FieldByName('UpVotesCount').AsString;
      label_profile_totalDownvotes.Text := 'Total DownVotes : '+FieldByName('DownVotesCount').AsString;
      label_profile_Reputation.Text := 'Reputation : '+FieldByName('Reputation').AsString;
      label_reputation.Text := FieldByName('Reputation').Value;
      label_profile_totalAnswers.Text := 'Answers : '+FieldByName('Answers').AsString;
      label_profile_totalQuestions.Text := 'Questions : '+FieldByName('Questions').AsString;
      pf_Rank.Text := 'Rank : '+ FieldByName('Rank').AsString;
      if FieldByName('Tags').IsNull then
        listWidget_tags.Clear
      else
        setTags(listWidget_tags, FieldByName('Tags').Value);
      pfp_img := CreateBlobStream(FieldByName('ProfileImage'), bmRead);
      ExportPFP(TBlobField(FieldByName('ProfileImage')));
      pfp.Bitmap.LoadFromStream(pfp_img);
      pfp_small.Bitmap.LoadFromStream(pfp_img);
      pfp_edit_view.Bitmap.LoadFromStream(pfp_img);
      if FieldByName('Rank').AsInteger <= 10 then
        prev_user_acc.Visible := True
      else
        prev_user_acc.Visible := False;
    end;
  btn_profile.Visible:= True;
  label_reputation.Visible:= True;
  LogOut_lbl.Visible:= True;
  btn_login.Visible:= False;
  Q_Filter_TheseTags.IsChecked := True;
  stackedWidget.TabIndex := 3;
end;

procedure TForm1.loginpage_btn_loginClick(Sender: TObject);
var result: String;
begin
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC def_checkUser :@DisplayName, :@Password');
      Parameters.ParamByName('@DisplayName').Value:=  lineEdit_loginpage_login_displayname.Text;
      Parameters.ParamByName('@Password').Value:=  lineEdit_loginpage_login_password.Text;
      Open;
      result := Fields[0].AsString;
      if result = '1' then
        begin
          loginpage_label_loginerror.Text := '';
          lineEdit_loginpage_login_displayname.StyleLookup := 'edit_style';
          lineEdit_loginpage_login_password.StyleLookup := 'edit_style';
          userId := Fields[1].AsInteger;
          load_data;
          loadGridQA;
        end
      else
      if result = 'DisplayName Incorrect' then
        begin
          loginpage_label_loginerror.Text := result;
          lineEdit_loginpage_login_displayname.StyleLookup := 'editError_style';
          lineEdit_loginpage_login_password.StyleLookup := 'edit_style';
        end
      else
      if result = 'Password Incorrect' then
        begin
          loginpage_label_loginerror.Text := result;
          lineEdit_loginpage_login_displayname.StyleLookup := 'edit_style';
          lineEdit_loginpage_login_password.StyleLookup := 'editError_style';
        end
      else
        showmessage(result);
    end;
end;

procedure TForm1.menuBtnsAction(Sender: TCornerButton=Nil);
begin
btn_questions.IsPressed := False;
btn_users.IsPressed := False;
btn_about.IsPressed := False;
if not (Sender = Nil) then
  Sender.IsPressed := True;
end;

function TForm1.OrderByAllQuestions(OrdCol: STRING; TagsFilter: STRING=''; strSearched: STRING=''): INTEGER;
var matches: TStringArray;
begin
  try
    with ADOQuery_AllQuestions do
      begin
        Grid_AllQuestions.EndUpdate;
        Active := False;
        SQL.Clear;
        SQL.Add('EXEC showAllQuestions :@OrderBy, :@TagsFilter, 0, :@Filter');
        Parameters.ParamByName('@OrderBy').Value := OrdCol;
        Parameters.ParamByName('@TagsFilter').Value := TagsFilter;
        Parameters.ParamByName('@Filter').Value := strSearched;
        Prepared := True;
        Grid_AllQuestions.BeginUpdate;
        Open;
        Grid_AllQuestions.EndUpdate;
        setColWidth([Grid_AllQuestions], [Tmatrix_int.create(1115)]);
        if ContainsText(VarToStr(Fields[0].Value), 'Syntax error') then
          begin
            matches := findall('''([^'']*)''', Fields[0].Value);
            Q_Ctags_memo.StyleLookup := 'MemoStyle_error';
            Q_TagsFilterError_label.Text := 'Incorrect Tags Condition near "'+matches[0]+'"'+sLineBreak+'try this format --> "Tag" [AND/OR] "Tag"';
          end
        else
          BEGIN
            ADOQuery_AllQuestionsAfterScroll(self.ADOQuery_AllQuestions);
            Q_lastSearched := strSearched;
            Q_Order := OrdCol;
            QrowCount := 0;
            Q_Ctags_memo.StyleLookup := 'MemoStyle_grey';
            Q_TagsFilterError_label.Text := '';
            result := RecordCount;
          END;
      end;
  Except
    on E: EArgumentOutOfRangeException do
      begin
        ShowMessage('error in def: OrderByAllQuestions --> '+E.Message+sLineBreak+'App will Restart !!!');
        RestartApp;
      end;
  end;
end;

procedure TForm1.OrderByAnswers(OrdCol: STRING = 'VoteCount DESC');
begin
  with ADOQuery_QAnswers do
    begin
      CloseQuery;
      close;
      SQL.Clear;
      SQL.Add('EXEC GetPost_Answers :@PostId, :@OrderBy');
      Parameters.ParamByName('@PostId').Value := ADOQuery_AllQuestions.FieldByName('PostId').Value;
      Parameters.ParamByName('@OrderBy').Value := OrdCol;
      Open;
    end;
end;

procedure TForm1.OrderByBtnsAction(Sender: TCornerButton);
begin
  Q_ord_newest.IsPressed := False;
  Q_ord_Oldest.IsPressed := False;
  Q_ord_unanswered.IsPressed := False;
  Q_ord_mostAnswered.IsPressed := False;
  Q_ord_Votes.IsPressed := False;
  Q_ord_Views.IsPressed := False;
  Sender.IsPressed := True;
end;

procedure TForm1.PF_PostsItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var BODY: TStream;
begin
  if ADOQuery_PF_Posts.Active = True then
    begin
      label_profile_QA_errors.Text := '';
      profile_QA_title.StyleLookup := 'edit_style';
      Rect_RTE_profile.Stroke.Color := TAlphaColor($FF21252B);
      if ADOQuery_PF_Posts.FieldByName('PostTypeId').Value = 1 then
          Layout_profile_HideTitle.Visible := True
      else
          Layout_profile_HideTitle.Visible := False;
      with ADOQuery_PROC do
        begin
          close;
          SQL.Clear;
          SQL.Add('EXEC showQA :@PostId');
          Parameters.ParamByName('@PostId').Value := ADOQuery_PF_Posts.FieldByName('PostId').Value;
          Open;
          profile_QA_title.Text := FieldByName('Title').Value;
          if FieldByName('TagName').IsNull then
            setTagsChecked(List_profile_QA_tags, '')
          else
            setTagsChecked(List_profile_QA_tags, FieldByName('TagName').Value);
          BODY := CreateBlobStream(FieldByName('BODY'), bmRead);
          RTE_profile_HTML.Load(BODY);
          RTE_profile.Font.SetSettings('Regular', 14, TFontStyleExt.Default);
        end;
      PostId_pf := ADOQuery_PF_Posts.FieldByName('PostId').Value;
      ParentId_pf := ADOQuery_PF_Posts.FieldByName('ParentId').Value;
      setReadOnlyState(profile_QA_title, RTE_profile, FlowLayout_RTE_profile, List_profile_QA_tags, True);
      btn_profile_save_QA.Enabled := False;
    end;
end;

procedure TForm1.PF_PostsUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
  Size: TSizeF;
begin
if ADOQuery_PF_Posts.Active = True then
  begin
    Size := TSizeF.Create(22, 22);
    PF_Posts.BeginUpdate;
    if AItem.ImageIndex = 1 then
      AItem.Bitmap := ImageList.Bitmap(Size, 31);
    if AItem.ImageIndex = 2 then
      AItem.Bitmap := ImageList.Bitmap(Size, 32);
    PF_Posts.EndUpdate;
  end;
end;

procedure TForm1.pf_visitPostClick(Sender: TObject);
begin
  if PostId_pf = 0 then
  else
    begin
      with ADOQuery_AllQuestions do
        begin
          Close;
          SQL.Clear;
          SQL.Add('EXEC showAllQuestions :@OrderBy,'+
                                          ':@TagsFilter,'+
                                          ':@FetchFrom,'+
                                          ':@Filter,'+
                                          ':@GoToPost');
          Parameters.ParamByName('@OrderBy').Value := 'Posts.CreationDate DESC';
          Parameters.ParamByName('@TagsFilter').Value := '';
          Parameters.ParamByName('@FetchFrom').Value := 0;
          Parameters.ParamByName('@Filter').Value := '';
          if Layout_profile_HideTitle.IsVisible then
            Parameters.ParamByName('@GoToPost').Value := PostId_pf
          else
            Parameters.ParamByName('@GoToPost').Value := ParentId_pf;
          Prepared := True;
          Open;
          ADOQuery_AllQuestionsAfterScroll(self.ADOQuery_AllQuestions);
          setColWidth([Grid_AllQuestions], [Tmatrix_int.create(1100)]);
        end;
      setUpPost_Page(ADOQuery_AllQuestions.FieldByName('PostId').Value);
    end;
end;

procedure TForm1.prev_user_accClick(Sender: TObject);
begin
  with ADOQuery_PROC do
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC GetUserInfo :@UserId');
      Parameters.ParamByName('@UserId').Value:=  userId;
      Open;
      frxReport.ShowReport;
    end;
end;

procedure TForm1.printPost_AClick(Sender: TObject);
begin
if ADOQuery_QAnswers.FieldByName('PostId').IsNull then
    else
    begin
      OpenDialog.Filter := 'PDF Files (*.pdf)|*.pdf';
        OpenDialog.Execute;
        if OpenDialog.FileName = '' then
        else
          begin
            RTE_A_PDF.Options.Header := 'Question: '+ VQ_QTitle.Text;
            RTE_A_PDF.Save(OpenDialog.FileName + '.pdf');
            ShellExecute( 0, PChar('open'),  PChar(OpenDialog.FileName + '.pdf'), nil, nil, SW_SHOWDEFAULT );
          end;
    end;
end;

procedure TForm1.Profile_RefreshClick(Sender: TObject);
begin
  PF_Posts.BeginUpdate;
  ADOQuery_PF_Posts.Requery;
  PF_Posts.EndUpdate;
  PF_Posts.ItemIndex := -1;
end;

procedure TForm1.Q_Ctags_orClick(Sender: TObject);
begin
  Q_Ctags_memo.Lines.Append(' OR')
end;

procedure TForm1.Q_FilterClick(Sender: TObject);
begin
  if Q_Filter.IsPressed then
    begin
    FloatAnimation1.StartValue := Q_TopRect.Height;
    FloatAnimation1.StopValue := 400;
    FloatAnimation1.Start;
    end
  else
    begin
      FloatAnimation1.StartValue := Q_TopRect.Height;
      FloatAnimation1.StopValue := 120;
      FloatAnimation1.Start;
    end;
end;

procedure TForm1.Q_Filter_MyTagsChange(Sender: TObject);
begin
  Q_Filter_TagsList.Visible := False;
  if userId = 0 then
    BEGIN
      Q_Filter_NoTagslabel.Visible := True;
      setTagsChecked(Q_Filter_TagsList, '');
    END
  else
    with ADOQuery_PROC do
      begin
        Q_Filter_NoTagslabel.Visible := False;
        close;
        SQL.Clear;
        SQL.Add('EXEC GetUserInfo :@UserId');
        Parameters.ParamByName('@UserId').Value:=  userId;
        Open;
        // load objects
        if FieldByName('Tags').IsNull then
          setTagsChecked(Q_Filter_TagsList, '')
        else
          begin
            setTagsChecked(Q_Filter_TagsList, FieldByName('Tags').Value);
            Q_Filter_TagsListChangeCheck(self.Q_Filter_TagsList);
          end;

      end;
end;

procedure TForm1.Q_Filter_NoTagslabelClick(Sender: TObject);
begin
  stackedWidget.TabIndex := 4;
end;

procedure TForm1.Q_Filter_TagsListChangeCheck(Sender: TObject);
var SelectedTags: String;
begin
  SelectedTags := getSelectedTags(Q_Filter_TagsList).Replace(',', ' AND '+sLineBreak);
  if SelectedTags = '' then
    begin
      Q_Ctags_memo.Lines.Clear;
      Q_Ctags_memo.Lines.add('Choose your tags');
      Q_Ctags_memo.Lines.add('conditionally ex:');
      Q_Ctags_memo.Lines.add('"sql-server and');
      Q_Ctags_memo.Lines.add(' delphi or c"');
    end
  else
    begin
      Q_Ctags_memo.Lines.Clear;
      Q_Ctags_memo.Lines.add(SelectedTags);
    end;
end;

procedure TForm1.Q_Filter_TheseTagsChange(Sender: TObject);
begin
  Q_Filter_NoTagslabel.Visible := False;
  Q_Filter_TagsList.Visible := True;
  Q_Ctags_memo.Visible := True;
end;

procedure TForm1.Q_ord_mostAnsweredClick(Sender: TObject);
begin
  OrderByBtnsAction(Sender as TCornerButton);
  OrderByAllQuestions('Posts.AnswerCount DESC', '', '');
  Q_TagsFilter := '';
end;

procedure TForm1.Q_ord_newestClick(Sender: TObject);
begin
  OrderByAllQuestions('Posts.CreationDate DESC', '', '');
  Q_TagsFilter := '';
  OrderByBtnsAction(Sender as TCornerButton);
end;

procedure TForm1.Q_ord_OldestClick(Sender: TObject);
begin
  OrderByBtnsAction(Sender as TCornerButton);
  OrderByAllQuestions('Posts.CreationDate ASC', '', '');
  Q_TagsFilter := '';
end;

procedure TForm1.Q_ord_unansweredClick(Sender: TObject);
begin
  OrderByBtnsAction(Sender as TCornerButton);
  OrderByAllQuestions('Posts.AnswerCount ASC', '', '');
  Q_TagsFilter := '';
end;

procedure TForm1.Q_ord_ViewsClick(Sender: TObject);
begin
  OrderByBtnsAction(Sender as TCornerButton);
  OrderByAllQuestions('Posts.ViewCount DESC', '', '');
  Q_TagsFilter := '';
end;

procedure TForm1.Q_ord_VotesClick(Sender: TObject);
begin
  OrderByBtnsAction(Sender as TCornerButton);
  OrderByAllQuestions('Votes DESC', '', '');
  Q_TagsFilter := '';
end;

procedure TForm1.Q_ShowNextClick(Sender: TObject);
begin
  if QrowCount > TotalQCount - 100 then
  else
    begin
      with ADOQuery_AllQuestions do
        begin
          Close;
          SQL.Clear;
          SQL.Add('EXEC showAllQuestions :@OrderBy, :@TagsFilter, :@FetchFrom, :@Filter');
          Parameters.ParamByName('@OrderBy').Value := Q_Order;
          Parameters.ParamByName('@TagsFilter').Value := Q_TagsFilter;
          Parameters.ParamByName('@FetchFrom').Value := QrowCount + 100;
          Parameters.ParamByName('@Filter').Value := Q_lastSearched;
          Open;
          ADOQuery_AllQuestionsAfterScroll(self.ADOQuery_AllQuestions);
          setColWidth([Grid_AllQuestions], [Tmatrix_int.create(1100)]);
        end;
      QrowCount := QrowCount + 100;
    end;
end;

procedure TForm1.Q_ShowPreviousClick(Sender: TObject);
begin
  if QrowCount = 0 then
  else
    begin
      with ADOQuery_AllQuestions do
        begin
          Close;
          SQL.Clear;
          SQL.Add('EXEC showAllQuestions :@OrderBy, :@TagsFilter, :@FetchFrom, :@Filter');
          Parameters.ParamByName('@OrderBy').Value := Q_Order;
          Parameters.ParamByName('@TagsFilter').Value := Q_TagsFilter;
          Parameters.ParamByName('@FetchFrom').Value := QrowCount - 100;
          Parameters.ParamByName('@Filter').Value := Q_lastSearched;
          Open;
          ADOQuery_AllQuestionsAfterScroll(self.ADOQuery_AllQuestions);
          setColWidth([Grid_AllQuestions], [Tmatrix_int.create(1100)]);
        end;
      QrowCount := QrowCount - 100;
    end;
end;

procedure TForm1.Q_Title_labelClick(Sender: TObject);
begin
if Q_Title_label.Text = '' then
else
  begin
    setUpPost_Page(ADOQuery_AllQuestions.FieldByName('PostId').Value);
  end;
end;

procedure TForm1.Q_UserNameClick(Sender: TObject);
begin
  if not ADOQuery_AllQuestions.FieldByName('UserId').IsNull then
    GoToUser(ADOQuery_AllQuestions.FieldByName('UserId').AsInteger);
end;

procedure TForm1.resetForLogIn;
begin
  stackedWidget.TabIndex := 4;
/// ADO Query
  ADOQuery_PROC.Active := False;
  ADOQuery_PF_Posts.Active := False;
/// Track variables
  userId := 0;
  PostId_pf := 0;
  ParentId_pf := 0;
/// All Questions Page
  Q_Filter_TheseTags.IsChecked := True;
  Q_Filter_NoTagslabel.Visible := False;
/// Profile Page
  frame_profile_edit.Visible := False;
  profile_QA_title.Text := '';
  RTE_profile.Clear;
  setTagsChecked(List_profile_QA_tags, '');
/// Log Page
  lineEdit_loginpage_login_password .Text := '';
  lineEdit_loginpage_login_displayname.Text := '';
  lineEdit_loginpage_signin_displayname.Text := '';
  lineEdit_loginpage_signin_password.Text := '';
  lineEdit_loginpage_signin_reenterpassword.Text := '';
  setTagsChecked(List_loginpage_tags, '');
/// Top right bar
  btn_profile.Visible:= False;
  label_reputation.Visible:= False;
  LogOut_lbl.Visible:= False;
  btn_login.Visible:= True;
end;


procedure TForm1.RestartApp;
begin
  ShellExecute(0, nil, PChar(ParamStr(0)), nil, nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TForm1.RTE_AskQCaretChanged(Sender: TObject);
begin
    if RTE_AskQ_fsize.Items.IndexOf(RTE_AskQ.GetSelectionFontSize.ToString) > -1 then
      RTE_AskQ_fsize.ItemIndex := RTE_AskQ_fsize.Items.IndexOf(RTE_AskQ.GetSelectionFontSize.ToString);
end;

procedure TForm1.RTE_AskQ_boldClick(Sender: TObject);
begin
  RTE_AskQ_ToolBar.BoldButton.OnClick(self.RTE_AskQ_ToolBar.BoldButton);
end;

procedure TForm1.RTE_AskQ_CalignClick(Sender: TObject);
begin
  RTE_AskQ.SetSelectionAttribute(TAlignment.taCenter);
end;

procedure TForm1.RTE_AskQ_colorClick(Sender: TObject);
begin
  RTE_AskQ_ToolBar.TextColorPicker.DropDown;
end;

procedure TForm1.RTE_AskQ_fsizeChange(Sender: TObject);
begin
  RTE_AskQ.SetSelectionFontSize(RTE_AskQ_fsize.Selected.Text.ToInteger);
end;

procedure TForm1.RTE_AskQ_imageClick(Sender: TObject);
begin
  OpenDialog.Filter := 'image files (*.png)|*.PNG|image files (*.jpg)|*.JPG';
  if OpenDialog.Execute then
    if OpenDialog.FileName = '' then
    else
      RTE_AskQ.AddImage(OpenDialog.FileName);
end;

procedure TForm1.RTE_AskQ_italicClick(Sender: TObject);
begin
  RTE_AskQ_ToolBar.ItalicButton.OnClick(self.RTE_AskQ_ToolBar.ItalicButton);
end;

procedure TForm1.RTE_AskQ_LalignClick(Sender: TObject);
begin
  RTE_AskQ.SetSelectionAttribute(TAlignment.taLeftJustify);
end;

procedure TForm1.RTE_AskQ_listClick(Sender: TObject);
begin
  RTE_AskQ.AddText('1� List item');
  RTE_AskQ.AddLineBreak;
  RTE_AskQ.AddText('2� List item');
  RTE_AskQ.AddLineBreak;
  RTE_AskQ.AddText('3� List item');
  RTE_AskQ.AddLineBreak;
end;

procedure TForm1.RTE_AskQ_RalignClick(Sender: TObject);
begin
  RTE_AskQ.SetSelectionAttribute(TAlignment.taRightJustify);
end;

procedure TForm1.RTE_AskQ_redoClick(Sender: TObject);
begin
  RTE_AskQ.Redo;
end;

procedure TForm1.RTE_AskQ_underlineClick(Sender: TObject);
begin
  RTE_AskQ_ToolBar.UnderlineButton.OnClick(self.RTE_AskQ_ToolBar.UnderlineButton);
end;

procedure TForm1.RTE_AskQ_undoClick(Sender: TObject);
begin
    RTE_AskQ.Undo;
end;

procedure TForm1.RTE_PostACaretChanged(Sender: TObject);
begin
  if RTE_PostA_fsize.Items.IndexOf(RTE_PostA.GetSelectionFontSize.ToString) > -1 then
    RTE_PostA_fsize.ItemIndex := RTE_PostA_fsize.Items.IndexOf(RTE_PostA.GetSelectionFontSize.ToString);
end;

procedure TForm1.RTE_PostA_boldClick(Sender: TObject);
begin
RTE_PostA_BUIC.BoldButton.OnClick(self.RTE_PostA_BUIC.BoldButton);
end;

procedure TForm1.RTE_PostA_calignClick(Sender: TObject);
begin
RTE_PostA.SetSelectionAttribute(TAlignment.taCenter);
end;

procedure TForm1.RTE_PostA_colorsClick(Sender: TObject);
begin
  RTE_PostA_BUIC.TextColorPicker.DropDown;
end;

procedure TForm1.RTE_PostA_fsizeChange(Sender: TObject);
begin
  RTE_PostA.SetSelectionFontSize(RTE_PostA_fsize.Selected.Text.ToInteger);
end;

procedure TForm1.RTE_PostA_imageClick(Sender: TObject);
begin
  OpenDialog.Filter := 'image files (*.png)|*.PNG|image files (*.jpg)|*.JPG';
  if OpenDialog.Execute then
    if OpenDialog.FileName = '' then
    else
      RTE_PostA.AddImage(OpenDialog.FileName);
end;

procedure TForm1.RTE_PostA_italicClick(Sender: TObject);
begin
  RTE_PostA_BUIC.ItalicButton.OnClick(self.RTE_PostA_BUIC.ItalicButton);
end;

procedure TForm1.RTE_PostA_lalignClick(Sender: TObject);
begin
RTE_PostA.SetSelectionAttribute(TAlignment.taLeftJustify);
end;

procedure TForm1.RTE_PostA_listClick(Sender: TObject);
begin
RTE_PostA.AddText('1� List item');
RTE_PostA.AddLineBreak;
RTE_PostA.AddText('2� List item');
RTE_PostA.AddLineBreak;
RTE_PostA.AddText('3� List item');
RTE_PostA.AddLineBreak;
end;

procedure TForm1.RTE_PostA_ralignClick(Sender: TObject);
begin
RTE_PostA.SetSelectionAttribute(TAlignment.taRightJustify);
end;

procedure TForm1.RTE_PostA_redoClick(Sender: TObject);
begin
  RTE_PostA.Redo;
end;

procedure TForm1.RTE_PostA_underlineClick(Sender: TObject);
begin
  RTE_PostA_BUIC.UnderlineButton.OnClick(self.RTE_PostA_BUIC.UnderlineButton);
end;

procedure TForm1.RTE_PostA_undoClick(Sender: TObject);
begin
  RTE_PostA.Undo;
end;

procedure TForm1.RTE_profileCaretChanged(Sender: TObject);
begin
  if cbox_fsize.Items.IndexOf(RTE_profile.GetSelectionFontSize.ToString) > -1 then
    cbox_fsize.ItemIndex := cbox_fsize.Items.IndexOf(RTE_profile.GetSelectionFontSize.ToString);
end;
procedure TForm1.setColWidth(Grid_Array: array of TGrid; Cols_Width: array of Tmatrix_int);
var I, J: Integer;
begin
  for I := Low(Grid_Array) to High(Grid_Array) do
    for J := Low(Cols_Width[I]) to High(Cols_Width[I]) do
      BEGIN
        Grid_Array[I].ColumnByIndex(J).Width := Cols_Width[I][J];
      END;
end;

procedure TForm1.setReadOnlyState(Title: TEdit; Body: TTMSFNCRichEditor; BodyLayout: TFlowLayout; Tags: TListBox;
  State: Boolean);
begin
  if State then
    begin
      Title.ReadOnly := True;
      Body.ReadOnly := True;
      BodyLayout.Enabled := False;
      Tags.Enabled := False;
    end else
    begin
      Title.ReadOnly := False;
      Body.ReadOnly := False;
      BodyLayout.Enabled := True;
      Tags.Enabled := True;
    end;

end;

procedure TForm1.setTags(ListObj: TListBox; Tags: string);
var strList: TStringDynArray; I: integer;
begin
  ListObj.Clear;
  strList := SplitString(Tags, ',');
  for I := Low(strList) to High(strList) do
      ListObj.Items.Add(strList[I]);
end;

procedure TForm1.setTagsChecked(ListObj: TListBox; Tags: string);
var strList: TStringDynArray; I: integer;
begin
  strList := SplitString(Tags, ',');
  for I := 0 to ListObj.items.Count - 1 do
    begin
      if MatchStr(ListObj.ListItems[I].Text, strList) then
        begin
          ListObj.ListItems[ListObj.Items.IndexOf(ListObj.ListItems[I].Text)].IsChecked := True;
        end else
          ListObj.ListItems[ListObj.Items.IndexOf(ListObj.ListItems[I].Text)].IsChecked := False;
    end;
end;

procedure TForm1.setUpPost_Page(PostId: integer);
var BODY: TStream;
begin
  VisitUpdate(ADOQuery_AllQuestions.FieldByName('PostId').Value, -1, -1); // update visits table
  with ADOQuery_PROC do  // get currrent question: Title/BODY/TagName
    begin
      close;
      SQL.Clear;
      SQL.Add('EXEC showQA :@PostId');
      Parameters.ParamByName('@PostId').Value := PostId;
      Open;
      BODY := CreateBlobStream(FieldByName('BODY'), bmRead);
      RTE_Q_HTML.Load(BODY);
      if  FieldByName('TagName').IsNull then
        setTags(VQ_Tags, '')
      else
        setTags(VQ_Tags, FieldByName('TagName').Value);
      VA_btn_VotesClick(self.VA_btn_Votes); // set up answers
      RTE_Q.Font.SetSettings('Regular', 14, TFontStyleExt.Default);

      stackedWidget.TabIndex := 5;
    end;
  if userId = 0 then
  else
    with ADOQuery_PROC do
      begin
        close;
        SQL.Clear;
        SQL.Add('EXEC CheckUserVisit :@UserId, :@PostId');
        Parameters.ParamByName('@UserId').Value := userId;
        Parameters.ParamByName('@PostId').Value := PostId;
        Open;
        VQ_upVote_Q.ImageIndex := 24;
        VQ_DownVote_Q.ImageIndex := 23;
        if ((FieldByName('UpVote').Value = 1) AND (FieldByName('DownVote').Value = 0)) then
          begin
            VQ_upVote_Q.ImageIndex := 22;
            VQ_DownVote_Q.ImageIndex := 23;
          end;
        if ((FieldByName('UpVote').Value = 0) AND (FieldByName('DownVote').Value = -1)) then
          begin
            VQ_upVote_Q.ImageIndex := 24;
            VQ_DownVote_Q.ImageIndex := 21;
          end;
      end;
end;


procedure TForm1.setVotesColor_A;
begin
  if userId = 0 then
  else
    with ADOQuery_PROC do
      begin
        close;
        SQL.Clear;
        SQL.Add('EXEC CheckUserVisit :@UserId, :@PostId');
        Parameters.ParamByName('@UserId').Value := userId;
        Parameters.ParamByName('@PostId').Value := ADOQuery_QAnswers.FieldByName('PostId').Value;
        Open;
        VQ_upVote_A.ImageIndex := 24;
        VQ_DownVote_A.ImageIndex := 23;
        if ((FieldByName('UpVote').Value = 1) AND (FieldByName('DownVote').Value = 0)) then
          begin
            VQ_upVote_A.ImageIndex := 22;
          end;
        if ((FieldByName('UpVote').Value = 0) AND (FieldByName('DownVote').Value = -1)) then
          begin
            VQ_DownVote_A.ImageIndex := 21;
          end;
      end;
end;

procedure TForm1.stackedWidgetChange(Sender: TObject);
begin
if NOT (stackedWidget.TabIndex in [0, 1, 2]) then
  menuBtnsAction(nil);
end;

procedure TForm1.start_anClick(Sender: TObject);
begin
if ani_direction_glyph.ImageIndex = 25 then
  begin
    ani_direction_glyph.ImageIndex := 26;
    an_rect_A.StartValue := rect_A.Position.X;
    an_rect_A.StopValue := rect_A.Position.X - 300;
    an_rect_A.Start;
  end
else
  begin
    ani_direction_glyph.ImageIndex := 25;
    an_rect_A.StartValue := rect_A.Position.X;
    an_rect_A.StopValue := rect_A.Position.X + 300;
    an_rect_A.Start;
  end;
end;

procedure TForm1.toolButton_boldClick(Sender: TObject);
begin
  RTE_profile_BUIC.BoldButton.OnClick(self.RTE_profile_BUIC.BoldButton);
end;

procedure TForm1.toolButton_calignClick(Sender: TObject);
begin
RTE_profile.SetSelectionAttribute(TAlignment.taCenter);
end;

procedure TForm1.toolButton_colorsClick(Sender: TObject);
begin
  RTE_profile_BUIC.TextColorPicker.DropDown;
end;

procedure TForm1.toolButton_imageClick(Sender: TObject);
begin
  OpenDialog.Filter := 'image files (*.png)|*.PNG|image files (*.jpg)|*.JPG';
  if OpenDialog.Execute then
    if OpenDialog.FileName = '' then
    else
      RTE_profile.AddImage(OpenDialog.FileName);
end;

procedure TForm1.toolButton_italicClick(Sender: TObject);
begin
  RTE_profile_BUIC.ItalicButton.OnClick(self.RTE_profile_BUIC.ItalicButton);
end;

procedure TForm1.toolButton_lalignClick(Sender: TObject);
begin
RTE_profile.SetSelectionAttribute(TAlignment.taLeftJustify);
end;

procedure TForm1.toolButton_listClick(Sender: TObject);
begin
RTE_profile.AddText('1� List item');
RTE_profile.AddLineBreak;
RTE_profile.AddText('2� List item');
RTE_profile.AddLineBreak;
RTE_profile.AddText('3� List item');
RTE_profile.AddLineBreak;
end;

procedure TForm1.toolButton_underlineClick(Sender: TObject);
begin
  RTE_profile_BUIC.UnderlineButton.OnClick(self.RTE_profile_BUIC.UnderlineButton);
end;

procedure TForm1.toolButton_undoClick(Sender: TObject);
begin
  RTE_profile.Undo;
end;

procedure TForm1.Users_VSPClick(Sender: TObject);
begin
  if LV_User_Posts.ItemIndex = -1 then
  else
    begin
      with ADOQuery_AllQuestions do
        begin
          Close;
          SQL.Clear;
          SQL.Add('EXEC showAllQuestions :@OrderBy,'+
                                          ':@TagsFilter,'+
                                          ':@FetchFrom,'+
                                          ':@Filter,'+
                                          ':@GoToPost');
          Parameters.ParamByName('@OrderBy').Value := 'Posts.CreationDate DESC';
          Parameters.ParamByName('@TagsFilter').Value := '';
          Parameters.ParamByName('@FetchFrom').Value := 0;
          Parameters.ParamByName('@Filter').Value := '';
          if ADOQuery_UserPosts.FieldByName('PostTypeId').Value = 1 then
            Parameters.ParamByName('@GoToPost').Value := ADOQuery_UserPosts.FieldByName('PostId').Value
          else
            Parameters.ParamByName('@GoToPost').Value := ADOQuery_UserPosts.FieldByName('ParentId').Value;
          Prepared := True;
          Open;
          ADOQuery_AllQuestionsAfterScroll(self.ADOQuery_AllQuestions);
          setColWidth([Grid_AllQuestions], [Tmatrix_int.create(1100)]);
        end;
      setUpPost_Page(ADOQuery_AllQuestions.FieldByName('PostId').Value);
    end;
end;

procedure TForm1.VA_btn_NewestClick(Sender: TObject);
begin
AnswerOrderByBtnsAction(Sender as TCornerButton);
OrderByAnswers('Posts.CreationDate DESC');
end;

procedure TForm1.VA_btn_OldestClick(Sender: TObject);
begin
OrderByAnswers('Posts.CreationDate ASC');
AnswerOrderByBtnsAction(Sender as TCornerButton);
end;

procedure TForm1.VA_btn_ViewsClick(Sender: TObject);
begin
AnswerOrderByBtnsAction(Sender as TCornerButton);
end;

procedure TForm1.VA_btn_VotesClick(Sender: TObject);
begin
OrderByAnswers('VoteCount DESC');
AnswerOrderByBtnsAction(Sender as TCornerButton);
end;

function TForm1.VisitUpdate(PostId, UpV, DownV: integer): integer;
begin
  if userId = 0 then
  else
    with ADOQuery_PROC do
      begin
        close;
        SQL.Clear;
        SQL.Add('EXEC NewVisit :@UserId, :@PostId, :@UpV, :@DownV');
        Parameters.ParamByName('@UserId').Value := userId;
        Parameters.ParamByName('@PostId').Value := PostId;
        Parameters.ParamByName('@UpV').Value := UpV;
        Parameters.ParamByName('@DownV').Value := DownV;
        Open;
        if Fields[0].Value = True then
          ShowMessage('You can''t vote your own post !');
        Result := Fields[0].Value;
      end;
end;

procedure TForm1.VQ_AnswerPost_btnClick(Sender: TObject);
begin
  ScrollArea_QAswers.ScrollBy(0, -1100);
end;

procedure TForm1.VQ_DownVote_AClick(Sender: TObject);
var CPid: integer;
begin
if userId = 0 then
  stackedWidget.TabIndex := 4
else
  begin
    VQ_upVote_A.ImageIndex := 24;
    if ADOQuery_QAnswers.FieldByName('PostId').IsNull then
    else
    begin
      CPid := ADOQuery_QAnswers.FieldByName('PostId').Value;
      if VQ_DownVote_A.ImageIndex = 21 then
        begin
          if VisitUpdate(ADOQuery_QAnswers.FieldByName('PostId').Value, 0, 0) = 0 then
            VQ_DownVote_A.ImageIndex := 23;
          A_VoteCount.Text := GetVotes(CPid).ToString;
        end
      else
        begin
          if VisitUpdate(ADOQuery_QAnswers.FieldByName('PostId').Value, 0, -1) = 0 then
            VQ_DownVote_A.ImageIndex := 21;
          A_VoteCount.Text := GetVotes(CPid).ToString;
        end;
    end;
  end;
end;

procedure TForm1.VQ_DownVote_QClick(Sender: TObject);
var CPid: integer;
begin
if userId = 0 then
  stackedWidget.TabIndex := 4
else
  begin
    VQ_upVote_Q.ImageIndex := 24;
    CPid := ADOQuery_AllQuestions.FieldByName('PostId').Value;
    if VQ_DownVote_Q.ImageIndex = 21 then
      begin
        if VisitUpdate(ADOQuery_AllQuestions.FieldByName('PostId').Value, 0, 0) = 0 then
          VQ_DownVote_Q.ImageIndex := 23;
        VQ_VoteCount_Q.Text := GetVotes(CPid).ToString;
      end
    else
      begin
        if VisitUpdate(ADOQuery_AllQuestions.FieldByName('PostId').Value, 0, -1) = 0 then
          VQ_DownVote_Q.ImageIndex := 21;
        VQ_VoteCount_Q.Text := GetVotes(CPid).ToString;
      end;
  end;
end;

procedure TForm1.VQ_UpVote_AClick(Sender: TObject);
var CPid: integer;
begin
if userId = 0 then
  stackedWidget.TabIndex := 4
else
  begin
    VQ_DownVote_A.ImageIndex := 23;
    if ADOQuery_QAnswers.FieldByName('PostId').IsNull then
    else
    begin
      CPid := ADOQuery_QAnswers.FieldByName('PostId').Value;
      if VQ_upVote_A.ImageIndex = 22 then
        begin
          if VisitUpdate(ADOQuery_QAnswers.FieldByName('PostId').Value, 0, 0) = 0 then
            VQ_upVote_A.ImageIndex := 24;
          A_VoteCount.Text := GetVotes(CPid).ToString;
        end
      else
        begin
          if VisitUpdate(ADOQuery_QAnswers.FieldByName('PostId').Value, 1, 0) = 0 then
            VQ_upVote_A.ImageIndex := 22;
          A_VoteCount.Text := GetVotes(CPid).ToString;
        end;
    end;
  end;
end;

procedure TForm1.VQ_upVote_QClick(Sender: TObject);
var CPid: integer;
begin
if userId = 0 then
  stackedWidget.TabIndex := 4
else
  begin
    VQ_DownVote_Q.ImageIndex := 23;
    CPid := ADOQuery_AllQuestions.FieldByName('PostId').Value;
    if VQ_upVote_Q.ImageIndex = 22 then
      begin
        if VisitUpdate(CPid, 0, 0) = 0 then
          VQ_upVote_Q.ImageIndex := 24;
        VQ_VoteCount_Q.Text := GetVotes(CPid).ToString;
      end
    else
      begin
        if VisitUpdate(CPid, 1, 0) = 0 then
          VQ_upVote_Q.ImageIndex := 22;
        VQ_VoteCount_Q.Text := GetVotes(CPid).ToString;
      end;
  end;
end;

procedure TForm1.VQ_UserName_QClick(Sender: TObject);
begin
if not ADOQuery_AllQuestions.FieldByName('UserId').IsNull then
  GoToUser(ADOQuery_AllQuestions.FieldByName('UserId').AsInteger);
end;

end.
