package topwinner.email;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class Email {

	public void sendEmail(String emailDestinatario,
			String mensagem, String nomeFrom, String assunto)
			throws EmailException {

		HtmlEmail email = new HtmlEmail();  
        
//        // adiciona uma imagem ao corpo da mensagem e retorna seu id  
//        URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");  
//        String cid = email.embed(url, "Apache logo");     
          
        // configura a mensagem para o formato HTML  
        email.setHtmlMsg(mensagem);  
  
        // configure uma mensagem alternativa caso o servidor não suporte HTML  
        email.setTextMsg("Seu servidor de e-mail não suporta mensagem HTML");  
          
        email.setHostName("mail.topwinner.com.br"); // o servidor SMTP para envio do e-mail  
        email.addTo(emailDestinatario, nomeFrom); //destinatário  
        email.setFrom("topwinner@globo.com", nomeFrom); // remetente  
        email.setSubject(assunto); // assunto do e-mail  
       /// email.setMsg(mensagem); //conteudo do e-mail  
        email.setAuthentication("topwinner@topwinner.com.br", "lanita10@");  
        email.setSmtpPort(25);  
        email.setSSL(false);  
        email.setTLS(false);  
        // envia email  
        email.send();

	}

}
