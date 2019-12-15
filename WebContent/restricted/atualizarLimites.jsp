<jsp:include page="topo.jsp"></jsp:include>
<div style="text-align: center;">${msgAtualizarLimites }</div>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<form class="form-horizontal"
	action="/topwinner/atualizarLimites.winner" method="post"
	name="formulario" onsubmit="envia_tranca();">
	<fieldset>

		<!-- Form Name -->
		<legend>ATUALIZAR LIMITES</legend>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="valorLimite">Valor
				Limite: </label>
			<div class="col-md-4">
				<input id="valorLimite" name="valorLimite" type="text"
					value="${limites.strvalorLimite }" class="form-control input-md"
					required>

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="valorBase">Valor
				Base Varejo: </label>
			<div class="col-md-4">
				<input id="valorBaseVarejo" name="valorBaseVarejo" type="text"
					value="${limites.strvalorBaseVarejo }" class="form-control input-md"
					required>

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="valorAtacado">Valor
				Base Atacado: </label>
			<div class="col-md-4">
				<input id="valorBaseAtacado" name="valorBaseAtacado" type="text"
					value="${limites.strvalorBaseAtacado }" class="form-control input-md"
					required>

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="atualizarLimites">Clique
				no botão para:</label>
			<div class="col-md-4">
				<button id="atualizarLimites" name="atualizarLimites"
					class="btn btn-primary">ATUALIZAR LIMITES</button>
			</div>
		</div>

	</fieldset>
</form>


<script type="text/javascript" src="jquery.maskMoney.js"></script>
<script type="text/javascript" src="jquery.mask.js"></script>

<script type="text/javascript">
	$(function() {
		$("#valorLimite").maskMoney({
			symbol : 'R$ ',
			showSymbol : true,
			thousands : '.',
			decimal : ',',
			symbolStay : true
		});

		$("#valorBaseVarejo").maskMoney({
			symbol : 'R$ ',
			showSymbol : true,
			thousands : '.',
			decimal : ',',
			symbolStay : true
		});

		$("#valorBaseAtacado").maskMoney({
			symbol : 'R$ ',
			showSymbol : true,
			thousands : '.',
			decimal : ',',
			symbolStay : true
		});
	})
	
	document.getElementById('valorLimite').focus();
</script>

<jsp:include page="rodape.jsp"></jsp:include>