package com.csis3275.service_riphumi;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Service;


@Service("mailService")
public class MailService {

	@Autowired
	protected JavaMailSender mailSender;
	
	// 아이디찾기
		public String sendPassword(String id, String email) {
			String subject = "";
			String text = "";
			String getRandomPassword = getRandomPassword(); 
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("email", email);
			MimeMessage msg = mailSender.createMimeMessage();
			subject = "Temporary password from MOSS!";
			text = "Hello "+ id + ", your temporary password :" + getRandomPassword;
			try {
				msg.setSubject(subject);
				msg.setText(text);
				msg.setRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(msg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}

			return getRandomPassword;
		};
		//Creating password
		public String getRandomPassword(){
	        char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k',
	        		'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
	        		'0','1','2','3','4','5','6','7','8','9'};
	        
	        StringBuilder sb = new StringBuilder("");
	        Random rn = new Random();
	        for( int i = 0 ; i < 8 ; i++ ){
	            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
	        }
	        return sb.toString();
	    }


	
}
