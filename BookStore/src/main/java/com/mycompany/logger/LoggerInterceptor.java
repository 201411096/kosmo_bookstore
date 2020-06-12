package com.mycompany.logger;

import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("#####################인터셉터 들어옴");
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		// ip를 가져옴
		ip = req.getRemoteAddr();
		Date time = new Date();
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");

		String time1 = format2.format(time);

		String requesturl = request.getRequestURI();

		String log = "[접속시간]" + time1 + "[접속ip]=" + ip + "[요청url]" + requesturl + "\n";

		System.out.println(log);
		String filePath = "d:\\Temp\\testlog.txt";
		FileWriter fileWriter = new FileWriter(filePath, true);

		fileWriter.write(log);
		fileWriter.close();
		return super.preHandle(request, response, handler);
	}

}
