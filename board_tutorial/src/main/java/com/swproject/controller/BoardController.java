package com.swproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swproject.domain.BoardVO;
import com.swproject.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
		return "board/list";
	}
	
	@RequestMapping(value = "/register",method=RequestMethod.GET)
	public String registerGET(BoardVO board, Model model) {
		log.info("register page get...");
		return "board/register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("register page post...");
		log.info(board.toString());
		service.register(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("bno") Long bno, Model model) {
		log.info("read page get...");
		model.addAttribute(service.read(bno));
		return "board/read";
	}
	
//	@GetMapping({"/get"})
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get");
//		model.addAttribute("board", service.get(bno));
//	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(@RequestParam("bno") Long bno, Model model) {
		log.info("modify page get...");
		model.addAttribute(service.read(bno));
		return "board/modify";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("modify page post...");
		log.info(board.toString());
		service.modify(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove page...");
		service.remove(bno);
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/board/list";
	}
}
