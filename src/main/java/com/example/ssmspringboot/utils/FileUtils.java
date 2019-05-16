package com.example.ssmspringboot.utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class FileUtils {
	private static final Logger logger= LoggerFactory.getLogger(FileUtils.class);

	 public static boolean upload(MultipartFile file, String path, String fileName){
		 
		 String realPath = path + "/" + fileName;
		  File dest = new File(realPath);
		  if(!dest.getParentFile().exists()){
	            dest.getParentFile().mkdirs();
	        }
		 try{
			 file.transferTo(dest);
			 return true;
		 }catch(IllegalStateException e){
			 e.printStackTrace();
			 return false;
		 }catch(IOException e){
			 e.printStackTrace();
			 return false;
		 }
		 
	 }

	/**
	 * 解析歌词文件
	 * @param path
	 * @return
	 */
	  public static String  showLyric(String path){
	      //String pathname="C:\\Users\\huangg\\Desktop\\ytResources\\music\\lyric\\";
	      //String pathname="C:\\Users\\apple\\Desktop\\ytResources\\music\\lyric\\";
		  String pathname="/home/project/resources/ytResources/music/lyric/";
	 	File file=new File(pathname+path);
		  try {
		  	byte[] s=new byte[2048];
			  FileInputStream in=new FileInputStream(file);
			  in.read(s);
			  in.close();
			  String ly=new String(s,"gbk");
			  return ly;

		  } catch (FileNotFoundException e) {

		  	logger.error("歌词文件解析错误：",e);

		  } catch (IOException e) {
			  e.printStackTrace();
		  }
		  return null;
	  }
	
}
