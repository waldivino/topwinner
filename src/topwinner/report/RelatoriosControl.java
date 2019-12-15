package topwinner.report;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import topwinner.model.Clientes;
import topwinner.model.Empresas;
import topwinner.model.Notas;
import topwinner.model.Pontos;
import topwinner.model.Usuarios;
import topwinner.model.Dao.ClientesDao;
import topwinner.model.Dao.RelatoriosDao;

@WebServlet({ "/RelatoriosControl", "/totalSorteiosMesAno", "/retornarTotalPontosMesAno", "/totalSorteiosMesAnoADM",
		"/retornarTotalPontosMesAnoADM", "/cupomImpressao", "/evolutivo" })
public class RelatoriosControl extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public RelatoriosControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Usuarios user = (Usuarios) session.getAttribute("u");
		List<Notas> listaCupons = new ArrayList<Notas>();
		Clientes cliente = new Clientes();
		ClientesDao dao = new ClientesDao();

		listaCupons = (List<Notas>) session.getAttribute("cupons");

		String url = request.getServletPath();
		
		if (url.equalsIgnoreCase("/evolutivo")) {
			try {
				RelatorioUtil relatorioUtil = new RelatorioUtil();
				Map<String, Object> parametros = new HashMap<String, Object>();

				String cnpj = request.getParameter("cnpj");

				RelatoriosDao daoRel = new RelatoriosDao();

				Integer perc = daoRel.perc();
				
				parametros.put("cnpj", "");
				parametros.put("perc", "");

				parametros.put("cnpj", cnpj);
				parametros.put("perc", perc);

				String arquivoJasper = getServletContext().getRealPath("/relatorios/" + "evolutivo" + ".jasper");
				
				

				byte[] bytes = relatorioUtil.criarRelatorio(arquivoJasper, parametros);

				if (bytes != null && bytes.length > 0) {
					response.setContentType("application/pdf");

					response.setContentType("application/pdf");  
			        response.setHeader("Content-Disposition","attachment; filename=\"evolutivo.pdf\"");
					response.setContentLength(bytes.length);
					ServletOutputStream ouputStream = response.getOutputStream();
					ouputStream.write(bytes, 0, bytes.length);
					ouputStream.flush();
					ouputStream.close();
				}

			} catch (Exception e) {
				session.setAttribute("msgRelatorio", "<div class='alert alert-danger'>" + e.getMessage() + ".</div>");
				response.sendRedirect("/topwinner/restricted/relatorios.jsp");
			}
		}

		if (url.equalsIgnoreCase("/cupomImpressao")) {
			try {
				Map<String, Object> parametros = new HashMap<String, Object>();

				String arquivoJasper = getServletContext().getRealPath("/relatorios/" + "cupons" + ".jasper");
				
				System.out.println(arquivoJasper);
				
				JasperReport relatorioJasper = (JasperReport) JRLoader.loadObjectFromFile(arquivoJasper);

				ServletOutputStream responseStream = response.getOutputStream();

				byte[] bytes = JasperRunManager.runReportToPdf(relatorioJasper, null,
						new JRBeanCollectionDataSource(listaCupons));
				
//				//Vizualiza 
//				JasperViewer.viewReport("/relatorios/" + "cupons" +".jasper",false,false);
//				
//				JasperPrintManager.printReport("/relatorios/" + "cupons" + ".jasper",true); 

				response.setContentType("application/pdf");  
		        response.setHeader("Content-Disposition","attachment; filename=\""+listaCupons.get(0).getCoo()+".pdf\"");
				response.setContentLength(bytes.length);
				ServletOutputStream ouputStream = response.getOutputStream();
				ouputStream.write(bytes, 0, bytes.length);
				ouputStream.flush();
				ouputStream.close();
				
			} catch (Exception e) {
				session.setAttribute("msgSorteio", "<div class='alert alert-danger'>" + e.getMessage() + ".</div>");
				response.sendRedirect("/topwinner/restricted/sorteios.jsp");
			}

		}

		if (url.equalsIgnoreCase("/totalSorteiosMesAno")) {
			try {
				RelatorioUtil relatorioUtil = new RelatorioUtil();
				Map<String, Object> parametros = new HashMap<String, Object>();

				Integer mes = new Integer(request.getParameter("mes"));
				Integer ano = new Integer(request.getParameter("ano"));
				String cnpj = user.getCnpj();

				RelatoriosDao daoRel = new RelatoriosDao();
				Pontos p = new Pontos();

				p = daoRel.SorteiosMesAno(cnpj, mes, ano);
				
//				 cliente = dao.buscarClienteJaCadastrado(cpf, user.getIduser());

				parametros.put("logradouro", "");
				parametros.put("bairro", "");
				parametros.put("uf", "");
				parametros.put("mes", mes);
				parametros.put("ano", ano);
				parametros.put("cnpj", cnpj);
				parametros.put("p0", p.getPonto0());
				parametros.put("p1", p.getPonto1());
				parametros.put("p2", p.getPonto2());
				parametros.put("p3", p.getPonto3());
				parametros.put("p4", p.getPonto4());
				parametros.put("p5", p.getPonto5());
				parametros.put("p6", p.getPonto6());
				parametros.put("p7", p.getPonto7());
				parametros.put("p8", p.getPonto8());
				parametros.put("p9", p.getPonto9());
				parametros.put("p10", p.getPonto10());
				parametros.put("p11", p.getPonto11());
				parametros.put("p12", p.getPonto12());
				parametros.put("p13", p.getPonto13());
				parametros.put("p14", p.getPonto14());
				parametros.put("p15", p.getPonto15());

				parametros.put("c", p.getCalculoPonto0());
				parametros.put("c_1", p.getCalculoPonto1());
				parametros.put("c_2", p.getCalculoPonto2());
				parametros.put("c_3", p.getCalculoPonto3());
				parametros.put("c_4", p.getCalculoPonto4());
				parametros.put("c_5", p.getCalculoPonto5());
				parametros.put("c_6", p.getCalculoPonto6());
				parametros.put("c_7", p.getCalculoPonto7());
				parametros.put("c_8", p.getCalculoPonto8());
				parametros.put("c_9", p.getCalculoPonto9());
				parametros.put("c_10", p.getCalculoPonto10());
				parametros.put("c_11", p.getCalculoPonto11());
				parametros.put("c_12", p.getCalculoPonto12());
				parametros.put("c_13", p.getCalculoPonto13());
				parametros.put("c_14", p.getCalculoPonto14());
				parametros.put("c_15", p.getCalculoPonto15());

				parametros.put("total", p.getTotal());
				parametros.put("torneio", p.getTorneio().toString());

				String arquivoJasper = getServletContext().getRealPath("/relatorios/" + "sorteiosMesAno" + ".jasper");
				
				

				byte[] bytes = relatorioUtil.criarRelatorio(arquivoJasper, parametros);

				if (bytes != null && bytes.length > 0) {
					response.setContentType("application/pdf");

					response.setContentType("application/pdf");  
			        response.setHeader("Content-Disposition","attachment; filename=\""+mes+"-"+ano+".pdf\"");
					response.setContentLength(bytes.length);
					ServletOutputStream ouputStream = response.getOutputStream();
					ouputStream.write(bytes, 0, bytes.length);
					ouputStream.flush();
					ouputStream.close();
				}

			} catch (Exception e) {
				session.setAttribute("msgRelatorio", "<div class='alert alert-danger'>" + e.getMessage() + ".</div>");
				response.sendRedirect("/topwinner/restricted/relatorios.jsp");
			}
		}
		
		
		if (url.equalsIgnoreCase("/totalSorteiosMesAnoADM")) {
			try {
				RelatorioUtil relatorioUtil = new RelatorioUtil();
				Map<String, Object> parametros = new HashMap<String, Object>();

				Integer mes = new Integer(request.getParameter("mes"));
				Integer ano = new Integer(request.getParameter("ano"));
				String cnpj = request.getParameter("cnpj");

				RelatoriosDao daoRel = new RelatoriosDao();
				Pontos p = new Pontos();

				p = daoRel.SorteiosMesAno(cnpj, mes, ano);

				parametros.put("logradouro", "");
				parametros.put("bairro", "");
				parametros.put("uf", "");
				parametros.put("razaoSocial", p.getRazaosocial());
				parametros.put("mes", mes);
				parametros.put("ano", ano);
				parametros.put("cnpj", cnpj);
				parametros.put("p0", p.getPonto0());
				parametros.put("p1", p.getPonto1());
				parametros.put("p2", p.getPonto2());
				parametros.put("p3", p.getPonto3());
				parametros.put("p4", p.getPonto4());
				parametros.put("p5", p.getPonto5());
				parametros.put("p6", p.getPonto6());
				parametros.put("p7", p.getPonto7());
				parametros.put("p8", p.getPonto8());
				parametros.put("p9", p.getPonto9());
				parametros.put("p10", p.getPonto10());
				parametros.put("p11", p.getPonto11());
				parametros.put("p12", p.getPonto12());
				parametros.put("p13", p.getPonto13());
				parametros.put("p14", p.getPonto14());
				parametros.put("p15", p.getPonto15());

				parametros.put("c", p.getCalculoPonto0());
				parametros.put("c_1", p.getCalculoPonto1());
				parametros.put("c_2", p.getCalculoPonto2());
				parametros.put("c_3", p.getCalculoPonto3());
				parametros.put("c_4", p.getCalculoPonto4());
				parametros.put("c_5", p.getCalculoPonto5());
				parametros.put("c_6", p.getCalculoPonto6());
				parametros.put("c_7", p.getCalculoPonto7());
				parametros.put("c_8", p.getCalculoPonto8());
				parametros.put("c_9", p.getCalculoPonto9());
				parametros.put("c_10", p.getCalculoPonto10());
				parametros.put("c_11", p.getCalculoPonto11());
				parametros.put("c_12", p.getCalculoPonto12());
				parametros.put("c_13", p.getCalculoPonto13());
				parametros.put("c_14", p.getCalculoPonto14());
				parametros.put("c_15", p.getCalculoPonto15());

				parametros.put("total", p.getTotal());
				parametros.put("torneio", p.getTorneio().toString());

				String arquivoJasper = getServletContext().getRealPath("/relatorios/" + "sorteiosMesAno" + ".jasper");
				
				

				byte[] bytes = relatorioUtil.criarRelatorio(arquivoJasper, parametros);

				if (bytes != null && bytes.length > 0) {
					response.setContentType("application/pdf");

					response.setContentType("application/pdf");  
			        response.setHeader("Content-Disposition","attachment; filename=\""+mes+"-"+ano+".pdf\"");
					response.setContentLength(bytes.length);
					ServletOutputStream ouputStream = response.getOutputStream();
					ouputStream.write(bytes, 0, bytes.length);
					ouputStream.flush();
					ouputStream.close();
				}

			} catch (Exception e) {
				session.setAttribute("msgRelatorio", "<div class='alert alert-danger'>" + e.getMessage() + ".</div>");
				response.sendRedirect("/topwinner/restricted/relatorios.jsp");
			}
		}

	}

}
