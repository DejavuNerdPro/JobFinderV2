package ace.jobFinder.Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ace.jobFinder.DAO.InternalBusinessDAO;
import ace.jobFinder.DTO.ApplyJobInDTO;
import ace.jobFinder.DTO.LoginInDTO;
import ace.jobFinder.DTO.PostJobInDTO;
import ace.jobFinder.DTO.RegisterInDTO;
import ace.jobFinder.DTO.UpdateJobInDTO;
import ace.jobFinder.Model.CvForm;
import ace.jobFinder.Model.Job;
import ace.jobFinder.Model.User;

@Controller
@RequestMapping("/")
public class JobFinderController {

	@Autowired
	InternalBusinessDAO dao;

	@RequestMapping("/hello")
	public ModelAndView whereToGo(){
		return new ModelAndView("signup");
	}

	/*@RequestMapping(value="/registration",method=RequestMethod.POST)*/
	@GetMapping("/registration")
	public String doSignup(@ModelAttribute("registerInDTO")RegisterInDTO registerInDTO,Model model,HttpServletRequest request){
		HttpSession session=request.getSession();
		User user=new User();
		user.setUserId("");
		user.setEmail(registerInDTO.getEmail());
		user.setPassword(registerInDTO.getPassword());
		user.setUsername(registerInDTO.getUsername());
		if(registerInDTO.getPassword().length()<6){
			session.setAttribute("passwordLengthFailed", "must be at least 6 characters.");
			return "redirect:/signup.jsp";
		}
		if(registerInDTO.getPassword()!=null){
			if(!registerInDTO.getPassword().equals(registerInDTO.getRepassword())){
				session.setAttribute("wrongPassword","Password is not same.");
				return "redirect:/signup.jsp";
			}else{
				dao.UserDataInsertion(user);
				session.setAttribute("IsRegistered", "true");
				return "redirect:/index.jsp";
			}
		}
		return null;
	}

	@GetMapping("/login")
	public String doLogin(@ModelAttribute("loginInDTO")LoginInDTO loginInDTO,HttpServletRequest request){
		HttpSession session=request.getSession();
		String validatedEmail=loginInDTO.getEmail().replace("ADMIN", "");
		LoginInDTO validateLoginInDTO=new LoginInDTO();
		validateLoginInDTO.setEmail(validatedEmail);
		validateLoginInDTO.setPassword(loginInDTO.getPassword());

		if(validateLoginInDTO.getPassword().length()<6){
		session.setAttribute("loginPasswordLengthFailed", "must be at least 6 characters.");
		return "redirect:/login.jsp";
		}
		List<User> userList=dao.getUserDataForLogin(validateLoginInDTO);
		if(userList==null){
			session.setAttribute("login", "false");
			return "redirect:/login.jsp";
		}
		session.setAttribute("login", "true");
		if(loginInDTO.getEmail().contains("ADMIN")){
			session.setAttribute("admin", "true");
			return "redirect:/adminHome.jsp";
		}
		session.setAttribute("admin", "false");
		return "redirect:/index.jsp";
	}

	@GetMapping("/postJob")
	public String doPostJob(@ModelAttribute("postJobInDTO")PostJobInDTO postJobInDTO,HttpServletRequest request){
		HttpSession session=request.getSession();
		int result=dao.JobDataInsertion(postJobInDTO);
		if(result>0){
			session.setAttribute("postjob", "passed");
			return "redirect:/adminHome.jsp";
		}else{
			session.setAttribute("postjob", "failed");
			return "redirect:/adminHome.jsp";
		}
	}

	@GetMapping("/loadJobData")
	public String onLoadJobData(HttpServletRequest request){
		HttpSession session=request.getSession();
		List<Job> jobList=dao.getJobData();
		if(jobList!=null){
			session.setAttribute("jobList",jobList);
		}
		return "redirect:/remove-update-job.jsp";
	}

	@GetMapping("/updateJob")
		public String doUpdateJob(@ModelAttribute("updateJobInDTO")UpdateJobInDTO updateJobInDTO){
		int result=dao.updateJob(updateJobInDTO);
		if(result>0){
			return "redirect:/remove-update-job.jsp";
		}
		return null;
	}

	@GetMapping("/removeJob")
	public String doRemoveJob(@RequestParam("jobId")String jobId){
		int result=dao.removeJob(jobId);
		if(result>0){
			return "redirect:/remove-update-job.jsp";
		}
		return null;
	}

	@GetMapping("/applyJob")
	public String doApplyJob(@ModelAttribute("applyJobInDTO")ApplyJobInDTO applyJobInDTO){
		MultipartFile file=applyJobInDTO.getFile();
		InputStream data = null;
		try {
			data=file.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("File to Byte transform failed.");
		}
		int result=dao.insertApplyJobData(applyJobInDTO, data);
		if(result>0){
			return "redirect:/job-detail.jsp";
		}
		return null;
	}

	@GetMapping("/loadApplyData")
	public String doLoadApplyData(HttpServletRequest request){
		HttpSession session=request.getSession();
		List<CvForm> cvFormList=dao.getApplyData();
		if(cvFormList!=null){
			session.setAttribute("applyData", cvFormList);
		}
		return "redirect:/adminHomePage";
	}
}
