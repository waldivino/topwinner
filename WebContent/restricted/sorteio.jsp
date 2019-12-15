<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

${msgSorteio }

<div id="sua_div">

	<div style="text-align: center; font-size: 40px;">PAINEL DE
		SORTEIOS</div>

	<c:if test="${sorteio.numeroLances == 0 }">
		<p class="bg-info">Seu saldo de resíduo é R$
			${sorteio.residuoValorCompra } e não é suficiente para realizar pelo
			menos 1 sorteio.</p>
	</c:if>

	<c:if test="${sorteio.numeroLances > 0 }">
		<c:if test="${fn:length(cupons) == 0}">
			<div class="box box-solid box-warning" style="padding-left: 10px;">
				<div class="info-box-text">

					<div style="font-size: 16px;" style="padding-left: 10px;">
						<b>DIGITE UM NÚMERO DE ${sorteio.digitos } DIGITOS:</b>
					</div>

					<c:if test="${sorteio.digitos == 4 }">
						<form action="/topwinner/sortiar.winner" method="post"
							name="formSorteio" onsubmit="envia_tranca();" id="formSorteio">
							<div class="input-group input-group-lg"
								style="padding-left: 2px; width: 280px;">
								<input type="text" name="numeroDaSorte" class="form-control"
									maxlength="7" placeholder="0-0-0-0" id="numeroDaSorte"
									style="font-family: Tahoma; font-size: 30px" requiblue /> <input
									type="hidden" name="digitos" value="${ sorteio.digitos}" />

								<div class="input-group-btn">
									<input class="btn btn-info btn-flat" type="submit" name="botao"
										value="SORTEAR">
								</div>
							</div>
						</form>
					</c:if>

					<c:if test="${sorteio.digitos == 5 }">
						<form action="/topwinner/sortiar.winner" method="post"
							name="formSorteio" onsubmit="envia_tranca();" id="formSorteio">
							<div class="input-group input-group-lg"
								style="padding-left: 2px; width: 300px;">
								<input type="text" name="numeroDaSorte" class="form-control"
									maxlength="9" placeholder="0-0-0-0-0" id="numeroDaSorte"
									style="font-family: Tahoma; font-size: 30px" requiblue /> <input
									type="hidden" name="digitos" value="${ sorteio.digitos}" />

								<div class="input-group-btn">
									<input class="btn btn-info btn-flat" type="submit" name="botao"
										value="SORTEAR">
								</div>
							</div>
						</form>
					</c:if>

				</div>

			</div>

			<b style="font-size: 22px">
				<div class="box-body">Digite o número da sorte acima, depois
					clique em sortear e aguarde até sair o resultado.</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">CPF</h2>
							<div class="box-tools pull-right"
								style="font-size: 18px; font: bold;">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">${sorteio.cpf }</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">TELEFONE</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">${sorteio.telefone }</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">COO/DOC</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">${sorteio.coo }</div>
					</div>
				</div>


				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">RESÍDUO ANTERIOR</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">
							<fmt:setLocale value="pt-BR" />
							<fmt:formatNumber value="${sorteio.residuoAnterior }"
								minFractionDigits="2" type="currency" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">VALOR DA COMPRA</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">
							<fmt:setLocale value="pt-BR" />
							<fmt:formatNumber value="${sorteio.valorCompra }"
								minFractionDigits="2" type="currency" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">VALOR A SORTEAR</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">
							<fmt:setLocale value="pt-BR" />
							<fmt:formatNumber value="${sorteio.valorTotal }"
								minFractionDigits="2" type="currency" />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">VALOR BASE</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">
							<fmt:setLocale value="pt-BR" />
							<fmt:formatNumber value="${sorteio.valorBase }"
								minFractionDigits="2" type="currency" />

						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">SORTEIO(S)</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">${sorteio.numeroLances }</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">NOVO RESÍDUO</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">
							<fmt:setLocale value="pt-BR" />
							<fmt:formatNumber value="${sorteio.residuoValorCompra }"
								minFractionDigits="2" type="currency" />
						</div>
					</div>
				</div>








				<div class="col-md-3">
					<div class="box box-warning box-solid">
						<div class="box-header with-border" style="text-align: center;">
							<h2 class="box-title">DATA</h2>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<!-- /.box-tools -->
						</div>
						<!-- /.box-header -->
						<div class="box-body" style="text-align: center;">${sorteio.data }</div>
					</div>
				</div>
</div>
</b>






<c:if test="${fn:length(listaSorteios) > 0}">


	<!-- Aqui será a lista de sorteios  -->
	<div class="row">
		<div class="col-md-6">
			<div class="box box-solid">
				<div class="box-header with-border">
					<i class="fa fa-text-width"></i> <b><h2 class="box-title">LUDO
							LANCE 1</h2></b>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<blockquote>
						<p></p>
						<small>TOP WINNER <cite title="Source Title">FIDELIZAÇÃO</cite></small>
					</blockquote>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- ./col -->
		<div class="col-md-6">
			<div class="box box-solid">
				<div class="box-header with-border">
					<i class="fa fa-text-width"></i>
					<h2 class="box-title">PREMIAÇÃO DO SORTEIO LANCE 1</h2>
				</div>
				<!-- /.box-header -->
				<div class="box-body clearfix">
					<blockquote class="pull-right">
						<p></p>

						<small>TOP WINNER <cite title="Source Title">FIDELIZAÇÃO</cite></small>
					</blockquote>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- ./col -->
	</div>
	<!-- fim lista de sorteios  -->


</c:if>

<br>
<br>
<div class="box-header with-border" style="margin-top: 400px;">
	<h2 class="box-title">TOP WINNER FIDELIZAÇÃO</h2>
	<div class="box-tools pull-right"></div>
</div>
</c:if>


<c:if test="${fn:length(cupons) > 0}">
	<a href="/topwinner/cupomImpressao" type="button" target="_blank"
		class="btn btn-default btn-lg">CUPON(S) EM PDF</a>
</c:if>

<c:if test="${fn:length(cupons) > 0}">
	<input type="button" onclick="cont();" class="btn btn-primary btn-lg"
		value="Imprimir" id="btnImpressao">
</c:if>
<!-- Aqui lista as notas e premios -->

<c:forEach items="${cupons }" var="cupom">

	<table class="table table-hover"
		style="font-size: 20px; padding-left: 20px;">
		<tr style="padding-left: 20;">
			<td>
				<div class="box box-default" style="padding-left: 10px;">
					<div class="box-header with-border">
						<h1 class='alert alert-info' style="font-size: 22px">SORTEIO
							${cupom.sequencia }</h1>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<h2>SISTEMA TOP WINNER FIDELIZAÇÃO</h2>
							<h5>COMPROVANTE DE OPERAÇÃO</h5>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer no-padding-left">

						<table class="table table-striped"
							style="width: 70%; text-align: left;">
							<tr>
								<td>EMPRESA:</td>
								<td style="color: blue; padding-left: 2x;">${cupom.razaoSocial }</td>
							</tr>
							<tr>
								<td>LOGRADOURO:</td>
								<td style="color: blue; padding-left: 2px">${cupom.logradouro }</td>
							</tr>
							<tr>
								<td>CNPJ:</td>
								<td style="color: blue; padding-left: 2px">${cupom.cnpj }</td>
							</tr>
							<tr>
								<td>DATA:</td>
								<td style="color: blue; padding-left: 2px">${cupom.dataHora }</td>
							</tr>
							<tr>
								<td>CPF:</td>
								<td style="color: blue; padding-left: 2px">${cupom.cpf }</td>
							</tr>
							<tr>
								<td>COO:</td>
								<td style="color: blue; padding-left: 2px">${cupom.coo }</td>
							</tr>
							<tr>
								<td>CUPOM:</td>
								<td style="color: blue; padding-left: 2px">${cupom.cupom }</td>
							</tr>



							<tr>
								<td>RESÍDUO ANTERIOR:</td>
								<td style="color: blue; padding-left: 2px"><fmt:formatNumber
										value="${cupom.residuoAnterior }" minFractionDigits="2"
										type="currency" /></td>
							</tr>

							<tr>
								<td>COMPRAS:</td>
								<td style="color: blue; padding-left: 2px"><fmt:formatNumber
										value="${cupom.compras }" minFractionDigits="2"
										type="currency" /></td>
							</tr>

							<tr>
								<td>VALOR BASE (VB):</td>
								<td style="color: blue; padding-left: 2px"><fmt:formatNumber
										value="${cupom.valorBase }" minFractionDigits="2"
										type="currency" /></td>
							</tr>

							<tr>
								<td>Nº DE SORTEIOS:</td>
								<td style="color: blue; padding-left: 2px">${cupom.totLances }</td>
							</tr>

							<tr>
								<td>SORTEIO:</td>
								<td style="color: blue; padding-left: 2px">${cupom.sequencia }º
									/ ${cupom.totLances }</td>
							</tr>

							<tr>
								<td>NOVO RESÍDUO:</td>
								<td style="color: blue; padding-left: 2px"><fmt:formatNumber
										value="${cupom.residuo }" minFractionDigits="2"
										type="currency" /></td>
							</tr>

							<tr>
								<td>NÚMERO DA SORTE:</td>
								<td style="color: blue; padding-left: 2px">${cupom.nrSorte }</td>
							</tr>
							<tr>
								<td>Nº SORTEADO:</td>
								<td style="color: blue; padding-left: 2px">${cupom.nrsorteado }</td>
							</tr>
							<tr>
								<td>DIG. ACERTADOS:</td>
								<td style="color: blue; padding-left: 2px">${cupom.nrAcertado }</td>
							</tr>
							<tr>
								<td>PONTOS FEITOS:</td>
								<td style="color: blue; padding-left: 2px">${cupom.pontos }</td>
							</tr>
							<c:if test="${empresa == 1 }">
								<tr>
									<td>PONTOS ACUMULADOS:</td>
									<td style="color: blue; padding-left: 2px">${cupom.pontosAcumulados }</td>
								</tr>

							</c:if>
						</table>
					</div>
					<!-- /.footer -->
				</div> <!-- /.box -->
			</td>
		<tr>
			<c:if test="${cupom.premio.torneio > 0}">
				<td><b>
						<div style="padding-left: 5px; background-color: #00c0ef">
							<div
								style="background-color: #FFFFFF; padding: 10px; width: 80%; margin: auto;">
								<h1 style="text-align: center; margin-top: 5px">$$$
									PARABÉNS $$$</H1>
							</div>
							<!-- /.box-header -->
							<div class="box-body" style="background-color: #00c0ef;">
								<div class="row" style="text-align: center;">
									<h3>VEJA O PRÊMIO QUE VOCÊ ACABOU DE GANHAR</h3>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div style="text-align: left; background-color: #00c0ef;">

								<table style="text-align: left; background-color: #00c0ef;">

									<tr>
										<td>SORTEIO:</td>
										<td style="padding: 10px;">${cupom.premio.sequencia}º/
											${cupom.totLances }</td>
									</tr>

									<tr>
										<td>ESPÉCIE DO PRÊMIO:</td>
										<td style="padding: 10px;">${cupom.premio.especie}</td>
									</tr>

									<tr>
										<td>DATA:</td>
										<td style="padding: 10px;">${cupom.premio.dataInc}</td>
									</tr>

								</table>
							</div>
							<!-- /.footer -->
						</div> <!-- /.box -->
				</b></td>
			</c:if>
		</tr>

		<tr>
			<c:if test="${cupom.premioMaximo.torneio > 0}">
				<td>

					<div class='alert alert-info' style="padding-left: 5px;">
						<div class="box-header with-border">
							<h1 class='alert alert-danger' style="text-align: center;">GRANDE
								PRÊMIO!</H1>
							<h1 class='alert alert-success' style="text-align: center;">$$$
								PARABÉNS $$$</H1>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row" style="text-align: center;">
								<h1>Você é sortudo, acabou de fechar o grande prêmio!</h1>
								<h5>VEJA O PRÊMIO QUE VOCÊ ACABOU DE GANHAR</h5>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer no-padding-left alert alert-info"
							style="text-align: left;">

							<table class="table alert alert-info" style="text-align: left;">
								<tr>
									<td>SORTEIO:</td>
									<td>${cupom.premioMaximo.sequencia}</td>
								</tr>

								<tr>
									<td>ESPÉCIE DO PRÊMIO:</td>
									<td>${cupom.premioMaximo.especie}</td>
								</tr>

								<tr>
									<td>DATA:</td>
									<td>${cupom.premioMaximo.dataInc}</td>
								</tr>

							</table>
						</div>
						<!-- /.footer -->
					</div> <!-- /.box -->

				</td>
			</c:if>
	</table>
</c:forEach>

<c:if test="${fn:length(cupons) > 0}">
	<a href="/topwinner/cupomImpressao" type="button" target="_blank"
		class="btn btn-default btn-lg">CUPON(S) EM PDF</a>
</c:if>

<c:if test="${fn:length(cupons) > 0}">
	<input type="button" onclick="cont();" class="btn btn-default btn-lg"
		value="Imprimir" id="btnImpressao">
</c:if>

</c:if>


<style type="text/css">
#print {
	display: none;
	text-align: left;
	padding: 2px;
	font-size: 6px !important;
	page-break-after: always;
	font-family: serif;
	font-style: normal;
}

.descricaoCupom {
	text-align: left;
	font-size: 6px !important;
	page-break-after: always;
	font-family: serif;
	font-style: normal;
}

@media print {
	#algo {
		display: block
	}
}

.descricaoCupom h6 {
	font-family: Times New Roman !important;
	letter-spacing: -1px !important;
	font-weight: 250 !important;
	font-size: 10px !important;
}
</style>

<script>
	$(document).ready(
			function() {
				if ((window.screen.availHeight < 1234)
						&& (window.screen.availWidth < 1234))
					document.getElementById("print").src = "small";
			})

	function cont() {
		var conteudo = document.getElementById('print').innerHTML;
		tela_impressao = window.open('about:blank');
		tela_impressao.document.write(conteudo);
		tela_impressao.window.print();
		tela_impressao.window.close();
		location.href = "/topwinner/chamarCadastroCupomECliente.winner";
	}

	document.getElementById('btnImpressao').focus();
</script>


<div id="print">
	<h6>SISTEMA TOP WINNER</h6>

	<h6>PROMOÇÃO e FIDELIZAÇÃO</h6>

	<h6>COMPROVANTE DE OPERAÇÃO</h6>
	<br>
	<div class="descricaoCupom">
		<h6 style="font-family: Times New Roman; font-size: 12px;">
			EMPRESA : ${cabecalho.razaoSocial }<br> LOGRADOURO :
			${cabecalho.logradouro }<br> CNPJ : ${cabecalho.cnpj }<br>
			DATA : ${cabecalho.dataHora }<br> CPF : ${cabecalho.cpf }<br>
			COO : ${cabecalho.coo }<br> VALOR DA COMPRA :
			<fmt:formatNumber value="${cabecalho.compras }" minFractionDigits="2"
				type="currency" />
			<br> RESÍDUO ANTERIOR :
			<fmt:formatNumber value="${cabecalho.residuoAnterior }"
				minFractionDigits="2" type="currency" />
			<br> VALOR A SORTEAR :
			<fmt:formatNumber value="${cabecalho.valorSortear }"
				minFractionDigits="2" type="currency" />
			<br> NOVO RESÍDUO :
			<fmt:formatNumber value="${cabecalho.residuo }" minFractionDigits="2"
				type="currency" />
			<br> VALOR BASE :
			<fmt:formatNumber value="${cabecalho.valorBase }"
				minFractionDigits="2" type="currency" />
			<br> Nº DE SORTEIOS : ${cabecalho.totLances }<br> Nº DA
			SORTE : ${cabecalho.nrSorte }<br> <br> <br>
			<c:forEach items="${cupons }" var="cupom">
				<!-- Informações do loop -->
		
		Nº DO CUPOM : ${cupom.cupom }<br> 
		SORTEIO : ${cupom.sequencia }º / ${cupom.totLances }<br> 
		Nº SORTEADO : ${cupom.nrsorteado }<br> 
		DÍGITOS ACERTADOS : ${cupom.nrAcertado }<br> 
		PONTOS FEITOS : ${cupom.pontos }<br>
		PONTOS ANTERIORES : ${cupom.pontosAnteriores }<br>
				<c:if test="${empresa == 1 }">
		PONTOS ACUMULADOS : ${cupom.pontosAcumulados }<br>
				</c:if>
		PRÊMIO GANHO : ${cupom.nomePremio } <br>
				<br>
				<br>

			</c:forEach>
		</h6>
	</div>
</div>


<script type="text/javascript" src="jquery.maskMoney.js"></script>
<script type="text/javascript" src="jquery.mask.js"></script>
<script src="../dist/js/mascaraValidacao.js"></script>
<link rel="stylesheet" href="../css/sorteio.css">

<c:if test="${sorteio.digitos == 4 }">
	<script type="text/javascript">
		$('#numeroDaSorte').mask('0-0-0-0');
	</script>
</c:if>

<c:if test="${sorteio.digitos == 5 }">
	<script type="text/javascript">
		$('#numeroDaSorte').mask('0-0-0-0-0');
	</script>
</c:if>

<script>
	function envia_tranca() {
		document.forms['formSorteio'].submit();
		document.forms['formSorteio'].elements['botao'].disabled = true;
	}

	document.getElementById('numeroDaSorte').focus();
</script>

<script>
	document.getElementById('btn').onclick = function() {
		var conteudo = document.getElementById('sua_div').innerHTML, tela_impressao = window
				.open('about:blank');

		tela_impressao.document.write(conteudo);
		tela_impressao.window.print();
		tela_impressao.window.close();
	};
</script>


<jsp:include page="rodape.jsp"></jsp:include>