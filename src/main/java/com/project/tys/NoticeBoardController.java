package com.project.tys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.NoticeBoardDAOImpl;
import com.project.service.GetInfoService;
import com.project.service.NoticeBoardServiceI;
import com.project.vo.BoardVO;
import com.project.vo.DeptVO;
import com.project.vo.NoticeBoardVO;
import com.project.vo.PagingVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/noticeBoard/*")
public class NoticeBoardController {

	@Autowired
	NoticeBoardDAOImpl dao;
	@Autowired
	NoticeBoardServiceI noticeBoardService;
	@Autowired
	GetInfoService getInfoService;

	// 게시글 전체 불러오기
	@RequestMapping(value = "/list")
	public ModelAndView boardList(String nowPage, String cntPerPage) throws Exception {

		ModelAndView mv = new ModelAndView();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5"; // 페이지당 게시물 수
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		PagingVO page = new PagingVO(noticeBoardService.countBoard(), Integer.parseInt(nowPage),
				Integer.parseInt(cntPerPage));
		List<NoticeBoardVO> rlist = noticeBoardService.selectAll();
		List<NoticeBoardVO> list = noticeBoardService.selectBoard(page);
		List<DeptVO> deptList = getInfoService.getDeptList();

		for (NoticeBoardVO d : rlist) {
			System.out.println(d.getN_deptName());

		}

		mv.setViewName("noticeBoard/noticeBoard");
		mv.addObject("list", list);
		mv.addObject("rlist", rlist);
		mv.addObject("paging", page);
		mv.addObject("deptList", deptList);

		return mv;
	}

	// 클릭한 게시글의 상세보기
	@RequestMapping(value = "/noticeBoardDetail")
	public ModelAndView boardDetail(@RequestParam("n_num") int n_num) {

		// 조회수 증가
		noticeBoardService.hitUp(n_num);

		// 클릭한 게시글 정보 가져오기
		NoticeBoardVO detail = noticeBoardService.boardDetail(n_num);
		ModelAndView mv = new ModelAndView();

		mv.setViewName("noticeBoard/noticeBoardDetail");
		mv.addObject("detail", detail);

		return mv;
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/noticeBoardDelete")
	public String boardDelete(@RequestParam("n_num") int n_num) {

		noticeBoardService.boardDelete(n_num);

		return "redirect:/noticeBoard/list";

	}

	// 게시글 등록하기위한 화면으로 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "/noticeBoard/noticeWrite";
	}

	// 게시물작성처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute NoticeBoardVO vo) throws Exception {
		noticeBoardService.create(vo);
		return "redirect:/noticeBoard/list";

	}

	// 게시글 수정하기위한 화면으로 이동
	@RequestMapping(value = "/noticeBoardUpdate", method = RequestMethod.GET)
	public String update() {
		return "noticeBoard/noticeBoardUpdate";
	}

	// 게시물 수정하기 처리
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute NoticeBoardVO vo) throws Exception {
		noticeBoardService.update(vo);
		return "redirect:/noticeBoard/list";
	}

	// 게시글 검색하기
	@RequestMapping(value = "/selectedList", method = RequestMethod.GET)
	public ModelAndView selectedList(String action, String searchType, String keyword, String nowPage,
			String cntPerPage) throws Exception {
		ModelAndView mav = new ModelAndView();

		if (action != null && action.equals("search")) {
			mav.addObject("list", dao.searchTypeList(searchType, keyword));
		} else {
			mav.addObject("list", noticeBoardService.selectAll());
		}
		mav.setViewName("noticeBoard/noticeBoard");
		return mav;
	}
}
