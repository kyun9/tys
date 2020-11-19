package com.project.tys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.GetInfoService;
import com.project.service.ImageUploadService;
import com.project.service.UserSearchServiceI;
import com.project.vo.BoardVO;
import com.project.vo.PagingVO;
import com.project.vo.PagingVO1;
import com.project.vo.UserVO;

@Controller
public class UserSearchController {
	@Autowired
	UserSearchServiceI userSearchService;
	@Autowired
	ImageUploadService imageUploadService;
	@Autowired
	GetInfoService getInfoService;
	//페이징처리
	   @RequestMapping(value = "/searchUser")
	   public String UserSearch(@ModelAttribute("PagingVO") PagingVO vo, @RequestParam(value="nowPage", required=false)String nowPage,
			   @RequestParam(value="user_deptno",required=false)int user_deptno,
			   @RequestParam(value="cntPerPage", required=false)String cntPerPage,
	           Model model)throws Exception{
		   //HttpSession session = request.getSession();

		   //HttpServletRequest request,
		   PagingVO1 vo1;
		   //전체 리스트 갯수
		   int listCnt = userSearchService.countUser();
		   int listCnt1 = userSearchService.countUser1(user_deptno);
		   
		   if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";	//페이지당 게시물 수
			}
		   System.out.println(listCnt1);
		   vo = new PagingVO(listCnt, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		   vo1 = new PagingVO1(listCnt1, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),user_deptno);
		   System.out.println(vo);
		   System.out.println(vo1);
		   //리스트에 게시물 저장
		    List<UserVO> list = userSearchService.selectUser(vo);
		    List<UserVO> list1 = userSearchService.selectUser1(vo1);
		      //ModelAndView mv = new ModelAndView("boardPaging");
		    System.out.println(list1);
		      if(list != null) { 
		         //mv.addObject("list", list);
		    	  model.addAttribute("list",list);
		    	  model.addAttribute("list1",list1);
		      } else {
		         throw new Exception("게시물이 존재하지 않습니다.");
		      }
		   
		   model.addAttribute("paging", vo);
		   model.addAttribute("paging1", vo1);
		   //model.addAttribute("viewAll", boardService.selectBoard(vo));
		   
		return "auth/searchUser";
		
	   }
	// 회원 삭제하기
	@RequestMapping(value="/deleteUser")
	public String deleteUser(@RequestParam("user_id") String user_id) throws Exception {
		
		userSearchService.deleteUser(user_id);
		
		return "redirect:/searchUser";
		
	}
	
	//수정할 회원 정보 조회
	//@RequestParam("b_num") int b_num
	@RequestMapping(value = "/userDetail")
	public ModelAndView userDetail(@RequestParam("user_id") String user_id) {
		// 클릭한 회원 정보 가져오기
				UserVO detail = //boardService.boardDetail(b_num);
						userSearchService.userDetail(user_id);
				ModelAndView mv = new ModelAndView();
				
				mv.setViewName("auth/userDetail");
				mv.addObject("detail", detail);
				mv.addObject("dept", getInfoService.getDeptList());
				mv.addObject("position", getInfoService.getPositionList());
				
				return mv;
	}
	
	
	//회원 수정처리(관리자가)
	@RequestMapping(value="updateUser",method=RequestMethod.POST)
	public String updateUser(@ModelAttribute UserVO vo) throws Exception {
		
		System.out.println(vo);
		userSearchService.updateUser(vo);
		return "redirect:/searchUser";
		
	}
	

}
