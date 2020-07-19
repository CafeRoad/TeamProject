package com.sql.cafe.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
 
    @Autowired
    private MemberDAO dao;
    @Autowired
    private JavaMailSender mailSender;
    
//    ------------------------------------- Member --------------------------------------
    public void regist(MemberDTO member) throws Exception {
        String key = new TempKey().generateKey(30);  // 인증키 생성
        
        // authkey column 필요.
        member.setAuthkey(key);
        System.out.println("key : " + key);
        
        //DB에 가입정보등록
        dao.signUp(member);
        
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("서비스 이메일 인증");
        sendMail.setText(
                new StringBuffer()
                .append("<h1>메일인증</h1>")
                .append("<a href='http://localhost:8080/email_test/emailConfirm?authKey=")
                .append(key)
                .append("' target='_blank'>이메일 인증 확인</a>")
                .toString());
        
        sendMail.setFrom("서비스ID@gmail.com", "서비스 이름");
        sendMail.setTo(member.getEmail());
        sendMail.send();
    }
 
    //이메일 인증 키 검증
    public MemberDTO userAuth(String authkey) throws Exception {
    	MemberDTO member = new MemberDTO();
        member = dao.chkAuth(authkey);
   
        if(member!=null){
            try{
                dao.successAuthkey(member);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return member;
    }
}

