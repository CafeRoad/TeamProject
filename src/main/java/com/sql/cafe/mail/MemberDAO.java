package com.sql.cafe.mail;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    private String nameSpace = "member.model.MemberMapper";
 
//    ------------------------------------- Member --------------------------------------
    //가입
    public void signUp(MemberDTO member) throws Exception {
        sqlSession.insert(nameSpace+".insertUser", member);
    }
    
    //email 중복 확인
    public MemberDTO checkEmail(String email) throws Exception {
        return sqlSession.selectOne(nameSpace+".chkEmail", email);
    }
 
    //이메일 인증 코드 확인
    public MemberDTO chkAuth(String authkey) throws Exception {
        return sqlSession.selectOne(nameSpace + ".chkAuthkey", authkey);
    }
    
    //인증 후 계정 활성화
    public void successAuthkey(MemberDTO member) throws Exception {
        sqlSession.update(nameSpace + ".keyConfirm", member);
    }
}

