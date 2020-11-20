package com.project.tys;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.BoardDAOImpl;
import com.project.service.BoardServiceI;
import com.project.service.GetInfoService;
import com.project.vo.BoardVO;
import com.project.vo.DeptVO;
import com.project.vo.PagingVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	BoardDAOImpl dao;
	@Autowired
	BoardServiceI boardService;
	@Autowired
	GetInfoService getInfoService;

	// 게시글 전체 불러오기
	@RequestMapping(value = "/list")
	public ModelAndView boardList(String nowPage, String cntPerPage, String teamNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<DeptVO> deptList = getInfoService.getDeptList();
		List<BoardVO> list = null;

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5"; // 페이지당 게시물 수
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		PagingVO page = new PagingVO(boardService.countBoard(), Integer.parseInt(nowPage),
				Integer.parseInt(cntPerPage));

		if (teamNum == null || teamNum == "" || teamNum.equals("0")) {
			list = boardService.selectBoard(page);
		} else {
			list = dao.searchTeam(Integer.parseInt(teamNum));
		}

		mv.setViewName("board/board");
		mv.addObject("list", list);
		mv.addObject("paging", page);
		mv.addObject("deptList", deptList);

		return mv;
	}

	// 클릭한 게시글의 상세보기
	@RequestMapping(value = "/boardDetail")
	public ModelAndView boardDetail(@RequestParam("b_num") int b_num) {

		// 조회수 증가
		boardService.hitUp(b_num);

		// 클릭한 게시글 정보 가져오기
		BoardVO detail = boardService.boardDetail(b_num);
		ModelAndView mv = new ModelAndView();

		mv.setViewName("board/boardDetail");
		mv.addObject("detail", detail);

		return mv;
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/boardDelete")
	public String boardDelete(@RequestParam("b_num") int b_num) {

		boardService.boardDelete(b_num);

		return "redirect:/board/list";

	}

	// 게시글 등록하기위한 화면으로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/board/write";
	}

	// 게시물작성처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo) throws Exception {
		boardService.create(vo);
		return "redirect:/board/list";

	}

	// 게시글 수정하기위한 화면으로 이동
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String update() {
		return "board/boardUpdate";
	}

	// 게시물 수정하기 처리
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) throws Exception {
		boardService.update(vo);
		return "redirect:/board/list";
	}

	// 게시글 검색하기
// 01. 게시글 조건 조회
//	@RequestMapping(value = "/selectedList")
//	public ModelAndView list(@RequestParam(defaultValue = "all") String searchOption,
//			@RequestParam(defaultValue = "") String keyword) throws Exception {
//		List<BoardVO> list = boardService.listAll(searchOption, keyword);
//		ModelAndView mav = new ModelAndView();
//
//		// 데이터를 맵에 저장
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list); // list
//		map.put("searchOption", searchOption); // 검색옵션
//		map.put("keyword", keyword); // 검색키워드
//		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
//		mav.setViewName("board/selectedList"); // 뷰를 selectedList.jsp로 설정
//		return mav; // selectedList.jsp로 List가 전달된다.
//	}

	@RequestMapping(value = "/selectedList", method = RequestMethod.GET)
	public ModelAndView selectedList(String action, String searchType, String keyword, String nowPage,
			String cntPerPage) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<DeptVO> deptList = getInfoService.getDeptList();
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5"; // 페이지당 게시물 수
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		PagingVO page = new PagingVO(boardService.countBoard(), Integer.parseInt(nowPage),
				Integer.parseInt(cntPerPage)); 
		
		
		if (action != null && action.equals("search")) {
			mav.addObject("list", dao.searchTypeList(searchType, keyword, String.valueOf(page.getStart()), String.valueOf(page.getEnd())));
		} else {
			mav.addObject("list", boardService.selectBoard(page));
		}
		mav.setViewName("board/board");
		mav.addObject("deptList", deptList);
		mav.addObject("paging", page);
		
		return mav;
	}
}