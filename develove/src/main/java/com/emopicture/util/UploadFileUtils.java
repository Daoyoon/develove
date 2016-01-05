package com.emopicture.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import com.emopicture.util.MediaUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	
public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else{
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;		
	}
	
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	private static String calcPath(String uploadPath){
		
		Calendar cal = Calendar.getInstance();		
		String yearPath = File.separator+cal.get(Calendar.YEAR);	
		String monthPath = yearPath + File.separator +  new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);	
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		logger.info(datePath);
		
		if(!new File(uploadPath+datePath).exists()){		
			File yearDir = new File(uploadPath + yearPath);	
			if(!yearDir.exists()){
				yearDir.mkdir();
			}
			File monthDir = new File(uploadPath + monthPath);
			if(!monthDir.exists()){
				monthDir.mkdir();
			}
			File dateDir = new File(uploadPath + datePath);
			if(!dateDir.exists()){
				dateDir.mkdir();
			}
		}	
		return datePath;	
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		
		BufferedImage srcImg = ImageIO.read(new File(uploadPath+path, fileName));
		BufferedImage destImg = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);	
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;	
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}


}
