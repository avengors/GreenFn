package com.avengors.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.avengors.model.BoardDTO;
import com.avengors.model.MemberDTO;
import com.avengors.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired private BoardService bs;
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	//코로나조회
	@GetMapping(value="/covid19")
	public void covid19() {
	}
	
	@GetMapping(value="/covid19/json", produces="application/json;charset=utf-8")
	@ResponseBody
	public String covid19Json() throws IOException {
		String xml = bs.getCovidXML();
		System.out.println("XML : " + xml);
		String json = XML.toJSONObject(xml).toString();
		System.out.println("JSON : " + json);
		return json;
	}
	// 태풍조회
	@GetMapping(value="/typhoon")
	public void typhoon() {}
	
	
	//resources/dataPath/typhoon.xlsx
	@GetMapping(value="/typhoon/json", produces="application/json;charset=utf-8")
	@ResponseBody
	public List<HashMap<String, Object>> typhoonJSON(HttpServletRequest request) throws MalformedURLException{
		String path = request.getSession().getServletContext().getRealPath("resources/dataPath/typhoon.xlsx");
		System.out.println(path);
		return bs.getTyphoonList(path);
	}
		
	
	@GetMapping("/introduce")
	public void introduce() {}
	
	//news
	@GetMapping("/news")
	public ModelAndView news() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/news");
		List<BoardDTO> list = bs.boardList();
		System.out.println("컨트롤러 : " + list);
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	//게시판수정폼
	@GetMapping("update")
	public String updateform(Model model, int idx) {
		BoardDTO dto = bs.selectOne(idx);
		model.addAttribute("dto",dto);
		return "/board/update";
	}
	//게시판 수정작성
	@PostMapping("/update")
	public String update(BoardDTO dto) {
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getIdx());
		bs.updateBoard(dto);
		return "redirect:/board/news";
	}
	//삭제 게시판
	@RequestMapping("/delete")
	public String deleteBoard(int idx) {
		bs.deleteBoard(idx);
	   return "redirect:/board/news";
	}
	
	//상세보기
	@GetMapping("/view")
		public String view(Model model,int idx) {
		BoardDTO dto = bs.selectOne(idx);
		model.addAttribute("dto",dto);
		return "/board/view";
	}
	
	@GetMapping("list")
	public void list() {}
	
	@GetMapping("air")
	public void air() {}
	
	
	
	//게시물
	@GetMapping("write")
	public String writeform() {
		return "/board/write";
	}
	//게시물 작성
	@PostMapping("/write")
	public String write(BoardDTO dto) {
		bs.insertBoard(dto);
		return "redirect:/board/news";
	}
	
//	@PostMapping("/write")
//	public String write(
//				@RequestParam(name = "uploadFile") MultipartFile file,
//				@ModelAttribute BoardDTO board,
//				@SessionAttribute MemberDTO member,
//				HttpServletRequest request
//				) throws IOException {
//		BoardDTO uploadPost = bs.write(member.getIdx(), board, file, request.getSession().getServletContext().getRealPath("upload"));
//	
//		log.info("uploadPost = {}", uploadPost);
//	
//		return "redirect:/";
//	}
// 
//
//	// return type이 void인 경우 uri를 jsp로 forword하는 정보 사용한다.
//	// 요청은 get방식으로 글쓰기 폼
//	@RequestMapping(path = "/board/write", method = RequestMethod.GET)
//	public void writeForm() {
//	
//	}
	
	 
}
