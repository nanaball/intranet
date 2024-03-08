package com.bitc.intranet.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.intranet.util.FileUtil;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class FileController {
	
	private final String uploadPath;
	
	private final ServletContext context;
	
	private String realPath;
	
	@PostConstruct
	public void initPath() {
		realPath = context.getRealPath(File.separator+uploadPath);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	@PostMapping("/uploadFile")
	public ResponseEntity<Object> uploadFile(MultipartFile[] file){
		ResponseEntity<Object> entity = null;
		try {
			List<String> list = new ArrayList<>();
			for(MultipartFile f: file) {
				String savedName = FileUtil.uploadFile(realPath,f);
				list.add(savedName);
			}
			entity = new ResponseEntity<>(list, HttpStatus.CREATED);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 파일 이미지 노출하지않게 처리
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		return new ResponseEntity<>(
				FileUtil.getBytes(realPath, fileName),
				FileUtil.getHeaders(fileName),
				HttpStatus.OK);
				
	}
}
