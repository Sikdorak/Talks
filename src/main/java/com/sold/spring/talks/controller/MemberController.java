package com.sold.spring.talks.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sold.spring.talks.dto.MemberDto;
import com.sold.spring.talks.service.MemberService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/signupForm")
	public String signupForm() {
		return "/member/signupForm";
	}
	
    @PostMapping("/signup")
    public String createMember(MemberDto memberDto) {
        memberService.createMember(memberDto);
        return "redirect:/";
    }
    
	@GetMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@PostMapping("/login")
    public String login(HttpSession session, Model model, @RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw) {
		MemberDto memberDto = new MemberDto();
		memberDto.setMember_id(member_id);
		memberDto.setMember_pw(member_pw);
        MemberDto member = memberService.login(memberDto);
        System.out.println(member);

        if (member != null) {
            session.setAttribute("member_id", member.getMember_id());
            session.setAttribute("member_nickname", member.getMember_nickname());
            return "redirect:/";
        } else {
            model.addAttribute("loginFailed", true);
            return "redirect:/member/loginForm";
        }
    }
	
    @GetMapping("/logout")
    public String logout(HttpSession session) {
         session.invalidate();
        return "redirect:/"; 
    }
}
