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
		String filePath = "d:\\Temp\\testlog.txt";
		//String filePath = "e:\\Temp\\testlog.txt";
		FileWriter fileWriter = new FileWriter(filePath, true);

		fileWriter.write(log);
		fileWriter.close();
		return super.preHandle(request, response, handler);
	}

}
