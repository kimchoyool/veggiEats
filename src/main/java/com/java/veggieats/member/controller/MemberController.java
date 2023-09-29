package com.java.veggieats.member.controller;


import com.java.veggieats.board.repository.BoardRepository;
import com.java.veggieats.member.dto.MemberDTO;
import com.java.veggieats.member.entity.MemberEntity;
import com.java.veggieats.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class MemberController {
    private final MemberRepository memberRepository;
    private final BoardRepository boardRepository;


    @GetMapping(value = "/join")
    public String getJoin(){
        return "/join";
    }
    @PostMapping(value = "/join")
    public String postJoin(@RequestBody MemberDTO memberDTO){
        if(memberDTO.getYyyy() != null){
            memberDTO.setBirthday(memberDTO.getYyyy()+memberDTO.getMM()+memberDTO.getDd());
        }
        MemberEntity memberEntity = MemberEntity.builder()
                .memberId(memberDTO.getMember_id())
                .memberPassword(memberDTO.getMember_password())
                .memberName(memberDTO.getMember_name())
                .nickname(memberDTO.getNickname())
                .email(memberDTO.getEmail())
                .birthday(memberDTO.getBirthday())
                .build();
        memberRepository.save(memberEntity);

        return "/join_success";
    }

    @PostMapping(value = "/idCheck")
    @ResponseBody
    public Map<Object, Object> idCheck(@RequestBody String id){
        Map<Object,Object> map = new HashMap<>();
        Boolean exist = memberRepository.existsById(id);
        map.put("existsById", exist);
        return map;
    }

    @GetMapping(value = "/login")
    public String getLogin(){
        return "/login";
    }

    //@RequestBody
    @PostMapping(value = "/login")
    public String postLogin(MemberDTO memberDTO, Model model, HttpSession session) throws IllegalAccessException {

        if(memberDTO.getMember_id() == null || memberDTO.getMember_password() == null){
            throw new IllegalAccessException("아이디와 비밀번호는 반드시 입력해야 합니다.");
        }
        //관리자계정
        if(memberDTO.getMember_id().equals("admin") && memberDTO.getMember_password().equals("1234")){
            model.addAttribute("userlist", memberRepository.findAll());
            return "/members_list";
        }
        //아이디랑 비밀번호 둘 다 일치 하는게 있는지 확인하고 세션에 아이디 저장하기
        if(memberRepository.findByMemberIdAndMemberPassword(memberDTO.getMember_id(), memberDTO.getMember_password()) != null){
            session.setAttribute("ID", memberDTO.getMember_id());
            return "/main";
        }else{
            throw new IllegalAccessException("아이디 혹은 비밀번호를 다시 입력해주세요.");
        }

    }

    @GetMapping(value = "/logout")
    public String getLogout(HttpSession session){
        session.invalidate();
        return "/main";
    }

    @GetMapping(value = "/mypage")
    public String getMypapes(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        model.addAttribute("board", boardRepository.findAllByMemberId(ID));
        //예약도 추가해야함
        return "/my_page";
    }

    @GetMapping(value = "/myinfo")
    public String getMypage(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        if(ID != null){
            model.addAttribute("user", memberRepository.findById(ID));
        }
        return "/my_information";
    }

    @GetMapping(value = "/myReservation")
    public String getMyReservation(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        //예약내역(아이디별) 조회 내역 model에 추가
        return "/my_reservation";
    }

    @GetMapping(value = "/myBoard")
    public String getMyBoard(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        model.addAttribute("board", boardRepository.findAllByMemberId(ID));
        return "/my_recipe";
    }

    @GetMapping(value = "/updatePw")
    public String getUpdatePw(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        if(ID != null){
            model.addAttribute("user",memberRepository.findById(ID));
        }
        return "/popup/pw_update";
    }

    @Transactional
    @PostMapping(value = "/updatePw")
    public String postUpdatePw(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        String ID = (String) session.getAttribute("ID");
        MemberEntity member = memberRepository.findById(ID).get();
        //수정되는지 확인하기
        member.builder()
                .memberPassword(request.getParameter("new_pw"))
                .build();
        model.addAttribute("user",member);
        return "redirect:myinfo";
    }

    @GetMapping(value = "/updateNickname")
    public String getUpdateNickname(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        if(ID != null){
            model.addAttribute("user",memberRepository.findById(ID));
        }
        return "/popup/nName_update";
    }

    @Transactional
    @PostMapping(value = "/updateNickname")
    public String postUpdateNickname(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        String ID = (String) session.getAttribute("ID");
        MemberEntity member = memberRepository.findById(ID)
                .orElseThrow(IllegalArgumentException::new);
        member.setNickname(request.getParameter("new_n_name"));
        return "redirect:myinfo";
    }

    @GetMapping(value = "/updateEmail")
    public String getUpdateEmail(HttpSession session, Model model){
        String ID = (String) session.getAttribute("ID");
        if(ID != null){
            model.addAttribute("user",memberRepository.findById(ID));
        }
        return "/popup/email_update"; //redirect:?
    }
    @Transactional
    @PostMapping(value = "/updateEmail")
    public String postUpdateEmail(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        String ID = (String) session.getAttribute("ID");
        MemberEntity member = memberRepository.findById(ID).get();
        //수정되는지 확인하기
        member.builder()
                .email(request.getParameter("new_email"))
                .build();
        model.addAttribute("user",member);
        return "redirect:myinfo";
    }

    @PostMapping(value = "/delete")
    public String postDelete(@RequestBody MemberDTO memberDTO, HttpSession session){
        session.invalidate();
        MemberEntity member = MemberEntity.builder()
                .memberId(memberDTO.getMember_id())
                .memberPassword(memberDTO.getMember_password())
                .memberName(memberDTO.getMember_name())
                .nickname(memberDTO.getNickname())
                .email(memberDTO.getEmail())
                .birthday(memberDTO.getBirthday())
                .build();
        memberRepository.delete(member);
        return "delete_account";
    }
}
