package com.mycompany.logger;

import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mycompany.domain.CustomerVO;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
//				.getRequest();
//		String ip = req.getHeader("X-FORWARDED-FOR"); //X-Forwarded-For (XFF) 헤더는 HTTP 프록시나 로드 밸런서를 통해 웹 서버에 접속하는 클라이언트의 원 IP 주소를 식별하는 표준 헤더
//		// ip를 가져옴
//		ip = req.getRemoteAddr();
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip==null)
			ip = request.getRemoteAddr();
		Date time = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");
		String formattedTime = dateFormat.format(time);
		String requesturl = request.getRequestURI();
		
		HttpSession session = request.getSession();
		CustomerVO customerVO = null;
		String log = null;
		if(session.getAttribute("customer")!=null ) {
			customerVO = (CustomerVO)session.getAttribute("customer");
			log = "[접속시간]" + formattedTime + "[접속ip]=" + ip + "[요청url]" + requesturl + "[userId]" + customerVO.getCustomerId() + "\n";
		}else {
			log = "[접속시간]" + formattedTime + "[접속ip]=" + ip + "[요청url]" + requesturl + "\n";
		}
		
		

		System.out.println(log);
		//String filePath = "d:\\Temp\\testlog.txt";
		String filePath = "e:\\Temp\\testlog.txt";
		FileWriter fileWriter = new FileWriter(filePath, true);

		fileWriter.write(log);
		fileWriter.close();
		return super.preHandle(request, response, handler);
	}

}
