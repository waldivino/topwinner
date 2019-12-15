package topwinner.report;

import java.sql.Connection;
import java.util.Map;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;
import topwinner.model.Dao.Dao;

public class RelatorioUtil extends Dao{

	public byte[] criarRelatorio(String arquivoJasper, Map<String, Object> parametros) {
		byte[] bytes = null;
		try {
			Connection conn = openRelatorio();
						
			JasperReport relatorioJasper = (JasperReport) JRLoader.loadObjectFromFile(arquivoJasper);
			
			bytes = JasperRunManager.runReportToPdf(relatorioJasper, parametros, conn);
			
		} catch (JRException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bytes;
	}
}
