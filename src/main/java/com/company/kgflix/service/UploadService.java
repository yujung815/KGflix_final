package com.company.kgflix.service;

import java.io.File;
import java.io.IOException;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.kgflix.dao.ContentDAO;
import com.company.kgflix.vo.ContentVO;

@Service
public class UploadService {
	
	@Autowired
	ContentDAO contentDAO;
	
	//파일등록 + db등록
	public void excute(int new_no, int pop, int free, String title, String category, MultipartFile video, MultipartFile thumb) throws IllegalStateException, IOException {
		
		String videoPath = "D:\\java-gookbe\\workspace_2021_06_1\\KGFlix_admin_search\\src\\main\\resources\\static\\video\\" + category +"\\" + video.getOriginalFilename();
		String thumbPath = "D:\\java-gookbe\\workspace_2021_06_1\\KGFlix_admin_search\\src\\main\\resources\\static\\img\\" + category +"\\" + thumb.getOriginalFilename();
		
		video.transferTo(new File(videoPath));
		thumb.transferTo(new File(thumbPath));
		
		String videoPath2 = "video/"+category+"/"+video.getOriginalFilename();
		String thumbPath2 = "img/"+category+"/"+thumb.getOriginalFilename();
		contentDAO.insertInfo(title,category, new_no, pop, free, videoPath2, thumbPath2);
		
		
	}
	
	//파일삭제
	public void delete(String title) {
		ContentVO cvo = contentDAO.getInfo(title);
		StringTokenizer st = new StringTokenizer(cvo.getVideo_uri(),"/");
		StringTokenizer st2 = new StringTokenizer(cvo.getThumb_uri(),"/");
		File video = new File("D:\\java-gookbe\\workspace_2021_06_1\\KGFlix_admin_search\\src\\main\\resources\\static\\" + st.nextToken()+"\\"+st.nextToken()+"\\"+st.nextToken()); 
		File thumb = new File("D:\\java-gookbe\\workspace_2021_06_1\\KGFlix_admin_search\\src\\main\\resources\\static\\" + st2.nextToken()+"\\"+st2.nextToken()+"\\"+st2.nextToken()); 
		
		
		video.delete();
		thumb.delete();
	}
	
}
