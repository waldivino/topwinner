// função javascript pra inserir algo na base

function gravarFluxoDeTrabalho() {
	controle = 1;
	var fluxoDeTrabalho = [];	

		$('.clique').each(function(){

			var id = $(this).attr("name");
		
			$('tr.linha').each(function(){
				
					var idLinha = $(this).attr('id');
				
					if(id == idLinha) {
						
						$('tr#'+idLinha+' :checked').each(function() {
							fluxoPara = {};
							fluxoPara.idSituacaoDe = idLinha;
							fluxoPara.idSituacaoPara = this.value;
							fluxoDeTrabalho.push(fluxoPara);
						});
					
					}
			});	
		});
		var fluxo = JSON.stringify(fluxoDeTrabalho);
		
		$.ajax( {
			type : "POST",
			url : "/BRQ-ControleProposta/gravarFluxoDeTrabalho.do",
			data : {
				fluxoDeTrabalho : fluxo
			},
			success : function(data) {
				var mensagemSucesso = data.SUCCESS;
				
				$('body,html').animate({scrollTop:0},200);
				listarFluxoDeTrabalho();
				
				MensagemSuccessFluxo(mensagemSucesso);
				$("#modalMensagem").modal('toggle');
				removerMensagensFluxo();
				
			},
			error : function(data) {
				exibirMensagemError('Ocorreu um erro Interno!');
				removerMensagens();
			}
		});
}

// meotdo na action
public String gravarFluxoDeTrabalho() throws JSONException {

		// variavel fluxoDeTrabalho é uma string declarada na Action, com getter e setter
		// variavel json é um Map<String, Object> json = new HashMap<String, Object>(); tmb contem getter e setter

        List<SituacaoOportunidadeVO> listaSituacaoDe = new ArrayList<SituacaoOportunidadeVO>();
		List<SituacaoOportunidadeVO> listaSituacaoPara = new ArrayList<SituacaoOportunidadeVO>();
		 
        try{
            JSONArray jsonArraySituacaoDe = new JSONArray(fluxoDeTrabalho);
			JSONArray jsonArraySituacaoPara = new JSONArray(fluxoDeTrabalho);
            
			if(jsonArraySituacaoDe.length() == jsonArraySituacaoPara.length()){
			
				Integer tamanhoDaLista = jsonArraySituacaoDe.length();
				
				for (int i = 0; i < tamanhoDaLista; i++) {
					JSONObject jsonObjectSituacao = jsonArraySituacaoDe.getJSONObject(i);
					
					//objetos declarados em minhas classes
					SituacaoOportunidadeVO situacaoDe = new SituacaoOportunidadeVO();
					SituacaoOportunidadeVO situacaoPara = new SituacaoOportunidadeVO();
					
						situacaoDe.setCodigoSituacaoOportunidade(Long.parseLong(jsonObjectSituacao.get("idSituacaoDe").toString()));
						listaSituacaoDe.add(situacaoDe);    
					
						situacaoPara.setCodigoSituacaoOportunidade(Long.parseLong(jsonObjectSituacao.get("idSituacaoPara").toString()));
						listaSituacaoPara.add(situacaoPara);    
				}
				
           }

		   situacaoServiceFacade.inserirFluxoDeTrabalho(listaSituacaoDe, listaSituacaoPara);
		   json.put("SUCCESS", "Fluxo de Trabalho gravado com sucesso!");
		   return SUCCESS;
        }
		

	// bibliotecas 
	import org.json.JSONArray;
	import org.json.JSONException;
	import org.json.JSONObject;

	
	
	//maneira de preencher um objeto direto, ao inves de mandar um array na jsp
	

	//metodo na Action
	public String inserir() {
		try {
			situacaoServiceFacade.inserir(situacaoOportunidade);
			json.put("SUCCESS", "Situa��o da Oportunidade: " + situacaoOportunidade.getDescricaoSituacaoOportunidade() + ", cadastrada com sucesso.");
			
			return SUCCESS;
		} catch (IntegrationException ie) {
			LOGGER.error("[SituacaoAction] - inserir() - " + ie.getMessage());
			json.put("ERROR", ie.getMessage());
			
			return SUCCESS;
		}
		
		//metodo no javascript
		function inserirSituacao(){
	var descricao = $("#descricao").val().trim();
	var codigoUsuario =  $("#codigoUsuario").val();
	
	if(validarPreenchimento('situacaoInserir') == true){
		$.ajax( {
			type : "POST",
			url : "/BRQ-ControleProposta/inserirSituacao.do",
			data : {
				'situacaoOportunidade.descricaoSituacaoOportunidade' : descricao,                          //maneira de enviar o dado para a action
				'situacaoOportunidade.usuarioCriador.codigoUsuario' : codigoUsuario							//situacaoOportunidade se refere ao mesmo nome declarado na action e usado dentro do metodo de inserir
			},																								// apos o ponto, vem o atributo que eu quero inserir meu dado, quando chega na action, o objeto ja tem esses dois atributos preenchidos
			success : function(data) {
				var mensagemSucesso = data.SUCCESS;  //retorno feito no metodo da action, um string normal a ser usada como mensagem ao usuario, bem como as de baixo
				var mensagemAlert = data.ALERT;
				var mensagemERROR = data.ERROR;
				
				$("#modalInserir").modal('toggle');
				
				limparForm();
				
				listarSituacoes(1);
				setPagAtualSituacao(1);
					
				if(mensagemSucesso != undefined && mensagemSucesso.length > 0) exibirMensagemSucesso(mensagemSucesso);
				if(mensagemAlert != undefined && mensagemAlert.length > 0) exibirMensagemAlerta(mensagemAlert);
				if(mensagemERROR != undefined && mensagemERROR.length > 0) exibirMensagemError(mensagemERROR);
				
				//script para voltar o scrollbar ao top
				$('body,html').animate({scrollTop:0},200);
				removerMensagens();
			},
			error : function(data) {
				exibirMensagemError('Ocorreu um erro Interno!');
				removerMensagens();
			}
		});
	}
}



// OBS vc vai ter que verificar como faz isso com jstl, pois, estou a usar struts, entao no mapeamento do struts.xml, ja vem que o tipo de retorno de todas as actions
// sao do tipo json