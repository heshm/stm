package com.erp.stm.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.io.FileOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import com.erp.common.action.CmAction;
import com.erp.common.util.Const;
import com.opensymphony.xwork2.ActionSupport;

public class ReceiptBillImageAction extends CmAction{

	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String saveDirectory;
	private String receiptNo;
	private int status;
	private String[] fileArray;
	
	public String upload(){
		status = Const.FAILURE;
		try{
		    String uploadPath = getSaveDirectory() + "/" + receiptNo;
		
		    File outFile = new File(uploadPath);
		    if(!outFile.exists()){
			    outFile.mkdir();
		    }
		
		    InputStream in = new FileInputStream(getUpload());  
		    OutputStream out = new FileOutputStream(uploadPath + "/" + uploadFileName); 
		    IOUtils.copy(in, out);
		    out.flush();  
            IOUtils.closeQuietly(in);  
            IOUtils.closeQuietly(out);  
            //System.out.println("Test Times");
            status = Const.SUCCESS;
        }catch(Exception e){
        	log.error(e.getMessage());
        }
		return SUCCESS;
	}
	
	public String showImages(){
        String uploadPath = getSaveDirectory() + "/" + receiptNo;
		File file = new File(uploadPath);
		if(file.exists()&&file.isDirectory()){
			fileArray = file.list();
			int len = fileArray.length;
			for(int i=0; i < len ; i++ ){
				fileArray[i] = saveDirectory + "/" + receiptNo + "/" + fileArray[i];
			}
			for(String s : fileArray){
				System.out.println(s);
			}
		}
		return SUCCESS;
	}
	
	public String delete(){
		String uploadPath = getSaveDirectory() + "/" + receiptNo;
		File fileFolder = new File(uploadPath);
		if (fileFolder.exists()&&fileFolder.isDirectory()){
			String[] fileArray = fileFolder.list();
			for (int i=0; i < fileArray.length; i++){
				File file = new File(uploadPath,fileArray[i]);
				if(file.isFile()){
					file.delete();
				}
			}
			if(fileFolder.list().length == 0){
				fileFolder.delete();
			}
		}
		
		status = Const.SUCCESS;
		return SUCCESS;
	}


	public File getUpload() {
		return upload;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getUploadContentType() {
		return uploadContentType;
	}


	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public String getSaveDirectory() {
		return ServletActionContext.getServletContext().getRealPath(saveDirectory);  
	}


	public void setSaveDirectory(String saveDirectory) {
		this.saveDirectory = saveDirectory;
	}


	public String getReceiptNo() {
		return receiptNo;
	}


	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String[] getFileArray() {
		return fileArray;
	}

	public void setFileArray(String[] fileArray) {
		this.fileArray = fileArray;
	}





	
}
