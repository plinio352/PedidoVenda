unit UfrmPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  UClienteController, UProdutoController, UPedidoProdutoController, UPedidoDadosGeraisController,
  UCliente, UProduto, UPedidoProduto, UPedidoDadosGerais, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ImgList, UFrmPesquisa, Vcl.Grids, Vcl.DBGrids,
  System.SysUtils, System.UITypes;

type
  TfrmPedidoVenda = class(TForm)
    dsCliente: TDataSource;
    dsProduto: TDataSource;
    dsPedidoGerais: TDataSource;
    dsPedidoProduto: TDataSource;
    cdsCliente: TClientDataSet;
    cdsProduto: TClientDataSet;
    cdsPedidoGerais: TClientDataSet;
    cdsPedidoProduto: TClientDataSet;
    cdsClientecodigo: TIntegerField;
    cdsClientenome: TStringField;
    cdsClientecidade: TStringField;
    cdsClienteuf: TStringField;
    cdsProdutocodigo: TIntegerField;
    cdsProdutodescricao: TStringField;
    cdsPedidoGeraisnumero_pedido: TIntegerField;
    cdsPedidoGeraisdata_emissao: TDateField;
    cdsPedidoGeraiscodigo_cliente: TIntegerField;
    cdsPedidoProdutoid: TIntegerField;
    cdsPedidoProdutonumero_pedido: TIntegerField;
    cdsPedidoProdutocodigo_produto: TIntegerField;
    cdsPedidoProdutoquantidade: TIntegerField;
    GroupBox7: TGroupBox;
    Splitter1: TSplitter;
    edtNomeCli: TEdit;
    edtCodigoCli: TButtonedEdit;
    ilPadrao16: TImageList;
    GroupBox1: TGroupBox;
    Splitter2: TSplitter;
    edtNomePro: TEdit;
    edtCodPro: TButtonedEdit;
    GroupBox2: TGroupBox;
    edtQtd: TEdit;
    GroupBox3: TGroupBox;
    edtVrUnit: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgItens: TDBGrid;
    GroupBox4: TGroupBox;
    edtTotalGeral: TEdit;
    Panel3: TPanel;
    btnAdd: TButton;
    btnGravaPedido: TButton;
    cdsPedidoProdutoproduto: TStringField;
    cdsProdutopreco_venda: TFloatField;
    cdsPedidoGeraisvalor_total: TFloatField;
    cdsPedidoProdutovalor_unitario: TFloatField;
    cdsPedidoProdutovalor_total: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoCliExit(Sender: TObject);
    procedure edtCodigoCliRightButtonClick(Sender: TObject);
    procedure edtCodProExit(Sender: TObject);
    procedure edtCodProRightButtonClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnGravaPedidoClick(Sender: TObject);
    procedure dbgItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    iPedGerCont: IPedidoDadosGeraisController;
    iPedProCont: IPedidoProdutoController;
    iProCont: IProdutoController;
    iCliCont: ITClienteController;

    cli: TCliente;
    pedGer: TPedidoDadosGerais;
    pedPro: TPedidoProduto;

    FCnt: Integer;
    FTotalGeral: Double;

    procedure New;
    procedure DataSet;
    procedure PesqCli(T: TObject);
    procedure PesqPro(T: TObject);
    procedure LimparCli;
    procedure LimparPro;
    procedure AddGrid;
    function GetTotal: Double;

  public
    { Public declarations }
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation


{$R *.dfm}

{ TfrmPedidoVenda }

procedure TfrmPedidoVenda.AddGrid;
begin
   cdsPedidoProduto.Append;
   Inc(FCnt);
   cdsPedidoProduto.FieldByName('id').Value              := FCnt;
   cdsPedidoProduto.FieldByName('codigo_produto').Value  := StrToInt(edtCodPro.Text);
   cdsPedidoProduto.FieldByName('quantidade').Value      := StrToInt(edtQtd.Text);
   cdsPedidoProduto.FieldByName('valor_unitario').Value  := StrToFloat(edtVrUnit.Text);
   cdsPedidoProduto.FieldByName('valor_total').Value     := GetTotal;
   cdsPedidoProduto.FieldByName('produto').Value         := edtNomePro.Text;
   cdsPedidoProduto.Post;
end;

procedure TfrmPedidoVenda.btnAddClick(Sender: TObject);
begin
   AddGrid;
   LimparPro;
end;

procedure TfrmPedidoVenda.btnGravaPedidoClick(Sender: TObject);
begin
   cli         := TCliente.Create;
   cli.codigo  := cdsClientecodigo.Value;
   cli.nome    := cdsClientenome.AsString;
   cli.uf      := cdsClienteuf.AsString;

   pedGer := TPedidoDadosGerais.Create;
   pedGer.numeroPedido := 0;
   pedGer.dataEmissao := Now;
   pedGer.cliente := cli;
   pedGer.valorTotal := StrToFloat(edtTotalGeral.Text);
   pedGer := iPedGerCont.incluir(pedGer);


   cdsPedidoProduto.First;
   while not(cdsPedidoProduto.Eof) do begin
      pedPro := TPedidoProduto.Create;
      pedPro.id := cdsPedidoProdutoid.Value;
      pedPro.numeroPedido := pedGer;
      pedPro.codigoProduto := iProCont.BuscaProduto(cdsPedidoProdutocodigo_produto.Value);
      pedPro.quantidade := cdsPedidoProdutoquantidade.Value;
      pedPro.valorUnitario := cdsPedidoProdutovalor_unitario.Value;
      pedPro.valorTotal := cdsPedidoProdutovalor_total.Value;

      iPedProCont.add := pedPro;

      cdsPedidoProduto.Next;
   end;

   if iPedProCont.incluir then begin
      ShowMessage('Sucesso!');
      cdsPedidoProduto.Close;
      DataSet;
      LimparPro;
      LimparCli;
   end;


end;

procedure TfrmPedidoVenda.DataSet;
begin
   cdsCliente.Data := iCliCont.lstCliente;
   cdsProduto.Data := iProCont.lstProduto;

//   cdsPedidoGerais.Data := iPedGerCont.lstPedidoDadosGerais;
//   cdsPedidoProduto.Data := iPedProCont.lstPedidoProduto;
   cdsPedidoProduto.CreateDataSet;
   cdsPedidoProduto.Open;

end;

procedure TfrmPedidoVenda.dbgItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_DELETE) and (cdsPedidoProduto.RecordCount > 0) then begin
      If MessageDlg('Confirmar exclus�o?', mtConfirmation, mbOkCancel, 0) = ID_OK then begin
         cdsPedidoProduto.Delete;
      end;
   end;


end;

procedure TfrmPedidoVenda.edtCodigoCliExit(Sender: TObject);
begin
   if edtCodigoCli.Text <> EmptyStr then begin
      if cdsCliente.Locate('codigo', edtCodigoCli.Text, [loCaseInsensitive]) then begin
         edtCodigoCli .Text := cdsCliente.Fields[0].AsString;
         edtNomeCli   .Text := cdsCliente.Fields[1].AsString;
      end
      else begin
         ShowMessage('C�dito n�o encontrado!');
         LimparCli;
      end;
   end;

end;

procedure TfrmPedidoVenda.edtCodigoCliRightButtonClick(Sender: TObject);
begin
   Pesquisa(cdsCliente.Data, PesqCli);

end;

procedure TfrmPedidoVenda.edtCodProExit(Sender: TObject);
begin
   if edtCodPro.Text <> EmptyStr then begin
      if cdsProduto.Locate('codigo', edtCodPro.Text, [loCaseInsensitive]) then begin
         edtCodPro   .Text := cdsProduto.Fields[0].AsString;
         edtNomePro  .Text := cdsProduto.Fields[1].AsString;
      end
      else begin
         ShowMessage('C�dito n�o encontrado!');
         LimparPro;
      end;
   end;

end;

procedure TfrmPedidoVenda.edtCodProRightButtonClick(Sender: TObject);
begin
   Pesquisa(cdsProduto.Data, PesqPro);

end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
   New;
end;

procedure TfrmPedidoVenda.FormShow(Sender: TObject);
begin
   DataSet;
   LimparPro;
   LimparCli;
end;

function TfrmPedidoVenda.GetTotal: Double;
begin

   Result := StrToInt(edtQtd.Text) * StrToFloat(edtVrUnit.Text);

   FTotalGeral := FTotalGeral + Result;
   edtTotalGeral.Text := FloatToStr(FTotalGeral);

end;

procedure TfrmPedidoVenda.LimparCli;
begin
   edtCodigoCli.Clear;
   edtNomeCli.Clear;
   edtTotalGeral.Clear;

   edtCodigoCli.SetFocus;

end;

procedure TfrmPedidoVenda.LimparPro;
begin
   edtCodPro.Clear;
   edtNomePro.Clear;
   edtQtd.Clear;
   edtVrUnit.Clear;

   edtCodPro.SetFocus;

end;

procedure TfrmPedidoVenda.New;
begin
   iPedGerCont := TPedidoDadosGeraisController.Create;
   iPedProCont := TPedidoProdutoController.Create;
   iCliCont := TClienteController.Create;
   iProCont := TProdutoController.Create;

end;

procedure TfrmPedidoVenda.PesqCli(T: TObject);
begin
   edtCodigoCli .Text   := TFrmPesquisa(T).cdsPesq.Fields[0].AsString;
   edtNomeCli   .Text   := TFrmPesquisa(T).cdsPesq.Fields[1].AsString;

end;

procedure TfrmPedidoVenda.PesqPro(T: TObject);
begin
   edtCodPro   .Text   := TFrmPesquisa(T).cdsPesq.Fields[0].AsString;
   edtNomePro  .Text   := TFrmPesquisa(T).cdsPesq.Fields[1].AsString;
   edtVrUnit   .Text   := TFrmPesquisa(T).cdsPesq.Fields[2].AsString;

end;

end.
