package com.erp.common.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


import org.apache.commons.lang.StringUtils;

public class CommonUtil {

	public static String getFirstDayOfTheMonth() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		GregorianCalendar gregorianCalendar = (GregorianCalendar) Calendar.getInstance();
		gregorianCalendar.setTime(date);
		gregorianCalendar.set(Calendar.DAY_OF_MONTH, 1);
		date = gregorianCalendar.getTime();
		return format.format(date);

	}

	public static String getCurrentDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		return format.format(date);

	}

	public static String getCurrentDate(String fmt) {
		SimpleDateFormat format = new SimpleDateFormat(fmt);
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		return format.format(date);

	}

	public static String getLastDay() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date theDate = calendar.getTime();
		String s = df.format(theDate);
		StringBuffer str = new StringBuffer().append(s).append(" 23:59:59");
		return str.toString();

	}

	public static String dateFormat(Date date, String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	public static String getNextSeqNo(String seqNo, int length) {
		int nextNo = Integer.parseInt(seqNo);
		nextNo++;
		seqNo = "" + nextNo;
		for (int i = seqNo.length(); i < length; i++) {
			seqNo = "0" + seqNo;
		}
		seqNo = StringUtils.leftPad(seqNo, length);
		return seqNo;
	}

	public static String getNextRKSeqNo(String rKseqNo) {

		String current = rKseqNo.substring(10, 14);
		String next = getNextSeqNo(current, 4);
		rKseqNo = rKseqNo.substring(0, 10);
		rKseqNo = rKseqNo + next;
		// System.out.println(current);
		return rKseqNo;
	}

	public static String getNextCKSeqNo(String CKseqNo) {
		String current = CKseqNo.substring(10, 14);
		String next = getNextSeqNo(current, 4);
		CKseqNo = CKseqNo.substring(0, 10);
		CKseqNo = CKseqNo + next;
		// System.out.println(current);
		return CKseqNo;
	}

	public static String dataFormat(String str) {
		if (str.length() <= 10) {
			return str;
		} else {
			return str.substring(0, 10);
		}
	}

	public static String digitUppercase(BigDecimal bigDecimal) {
		final String UNIT = "万仟佰拾亿仟佰拾万仟佰拾元角分";
		final String DIGIT = "零壹贰叁肆伍陆柒捌玖" ;
		String bigAmount = "";
		bigDecimal = bigDecimal.setScale(2, BigDecimal.ROUND_HALF_UP);  //截尾
		bigDecimal = bigDecimal.multiply(new BigDecimal("100")).setScale(0);

		String strAmt = bigDecimal.toString();
		if("0".equals(strAmt)){
			return "零元整";
		}
		if(strAmt.length() > 15){
			throw new RuntimeException("金额超系统上限");
		}

		int i = 0; 
		int j = UNIT.length() - strAmt.length();
		boolean isZero = false;
		for(; i<strAmt.length(); i++,j++){
			char ch = strAmt.charAt(i);
			if(ch == '0'){
				isZero = true;
				if (UNIT.charAt(j) == '亿' || UNIT.charAt(j) == '万' || UNIT.charAt(j) == '元') {
					bigAmount = bigAmount + UNIT.charAt(j);
					isZero = false;
				}
			}else{
				if (isZero) {
					bigAmount = bigAmount + "零";
					isZero = false;
				}
				bigAmount = bigAmount + DIGIT.charAt(ch - '0') + UNIT.charAt(j);
			}
		}
		if (strAmt.endsWith("00")) {
			bigAmount = bigAmount + "整";
		}
		bigAmount = bigAmount.replaceAll("亿万", "亿");
		return bigAmount;
		
	}

	public static void main(String[] args) throws Exception {

		System.out.println(digitUppercase(new BigDecimal("700003")));
	}

}
