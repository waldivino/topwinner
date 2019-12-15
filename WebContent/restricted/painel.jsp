<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div style="text-align: center;">${msgContaConcluida }
${msgJaEsxisteToneioEmAndamento } ${msgParametros }
${msgAtualizaParametros } ${msgClienteCupom } ${msgPainel } ${msgFechatLudo }
</div>


<h3>Acesso rápido</h3>
<c:if test="${u.administrador == 1}">
	<a href="/topwinner/chamarCadastroCupomECliente.winner" type="button"
		class="btn btn-primary btn-lg">CADASTRAR CUPOM DE CLIENTE</a>
	<br>
	<br>
	<a href="/topwinner/restricted/adicionarNovoUsuario.jsp" type="button"
		class="btn btn-primary btn-lg">NOVO OPERADOR</a>
	<br>
	<br>
	<a href="/topwinner/restricted/criarConta.jsp" type="button"
		class="btn btn-primary btn-lg">SOLICITAR CONTAS</a>
	<br>
	<br>
</c:if>

<c:if test="${u.administrador == 2}">
	<a href="/topwinner/chamarCadastroCupomECliente.winner" type="button"
		class="btn btn-primary btn-lg">CADASTRAR CUPOM DE CLIENTE</a>
	<br>
	<br>
	<a href="/topwinner/restricted/adicionarNovoUsuario.jsp" type="button"
		class="btn btn-primary btn-lg">NOVO OPERADOR</a>
	<br>
	<br>
	<br>
</c:if>

<c:if test="${u.administrador == 3}">
	<a href="/topwinner/chamarCadastroCupomECliente.winner" type="button"
		class="btn btn-primary btn-lg">CADASTRAR CUPOM DE CLIENTE</a>
	<br>
	<br>
	<br>
</c:if>
<jsp:include page="rodape.jsp"></jsp:include>